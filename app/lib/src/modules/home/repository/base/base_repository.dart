import 'package:app/src/config/db/db_helper.dart';

mixin BaseRepository {
  
  final DBHelper dbHelper = DBHelper();

  Future<void> insert(String tableName, String query) async{
    //faz o paranaue aqui;
  }
}