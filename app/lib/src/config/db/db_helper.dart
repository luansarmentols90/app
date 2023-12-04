import 'package:app/src/modules/home/models/chuck-norris-response-db.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
class DBHelper {

  late Database _db;

  //-------------------------------------------
  static const String TABLE = "answers";

  static const String ANSWER_ID = "id";
  static const String TEXT = "text";
  //-------------------------------------------

  static const DB_NAME = "test";

//Initialize database

  Future<Database> get db async{

    _db = await initDb();
    return _db;

  }

  initDb () async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ANSWER_ID INTEGER PRIMARY KEY, $TEXT TEXT)");
  }

  Future<ChuckNorrisResponseModel> saveAnswer(ChuckNorrisResponseModel answer) async {
    try{
      var dbClient = await db; 
      answer.id = (await dbClient.insert(TABLE, {"id": answer.id, "text": answer.value}));
      return answer;
    }catch(e){
      throw e;
    }
    
  }

  Future<List<Answer>> getAnswers() async {
    var dbClient = await db;
    List<Map<String, Object?>> maps = await dbClient.query(TABLE, columns: [ANSWER_ID, TEXT]);
    List<Answer> answers = [];
    
    if(maps.isNotEmpty){
      for(int i = 0; i < maps.length; i++){
       answers.add(Answer.fromJson(maps[i])); 
      }
    }

    return answers;

  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: "$ANSWER_ID = ?", whereArgs: [id]);
  }

  Future<int> update(ChuckNorrisResponseModel answer) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, answer.toJson(), where: "$ANSWER_ID = ?", whereArgs: [answer.id]);
  }

  Future<int> truncateTable() async {
    var dbClient = await db;
    return await dbClient.delete(TABLE);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }


}