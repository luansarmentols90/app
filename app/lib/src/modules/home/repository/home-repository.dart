
import 'package:app/src/infrastructure/exceptions/base_exception.dart';
import 'package:app/src/infrastructure/exceptions/comunication_exception.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-db.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:app/src/modules/home/repository/base/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepository with BaseRepository{

  Future<Answer?> getAnswer() async {
    try{
      await dbHelper.initDb();
      await dbHelper.truncateTable();
      final dioClient = Dio();
      Response response = await dioClient.get("https://api.chucknorris.io/jokes/random");
      ChuckNorrisResponseModel chuckNorrisResponseModel = ChuckNorrisResponseModel.fromJson(response.data!);
      return (await dbHelper.getAnswers()).first;
    }on DioException catch(e){
      throw BaseException("message", HomeRepository().runtimeType.toString(), "error", e);
    }
  }

  Future<void> insertHome() async{
    //aqui estou invocando um método do base repository
    await insert("TABELA", "queryEtc");
  }

}