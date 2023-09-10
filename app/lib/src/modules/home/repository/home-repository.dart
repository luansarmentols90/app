import 'dart:convert';

import 'package:app/src/config/db/db_helper.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-db.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:dio/dio.dart';

class HomeRepository{

  final DBHelper dbHelper = DBHelper();

  Future<Answer?> getAnswer() async {
    try{
      await dbHelper.initDb();
      await dbHelper.truncateTable();
      final dioClient = Dio();
      Response response = await dioClient.get("https://api.chucknorris.io/jokes/random");
      ChuckNorrisResponseModel chuckNorrisResponseModel = ChuckNorrisResponseModel.fromJson(response.data!);
      await dbHelper.saveAnswer(chuckNorrisResponseModel); //todo não fazer isso, somente para demonstração
      return (await dbHelper.getAnswers()).first;
    }on DioException catch(e){
      print(e.message);
      return null;
    }
  }
}