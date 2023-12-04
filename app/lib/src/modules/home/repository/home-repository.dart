import 'package:app/src/infrastructure/exceptions/base_exception.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:app/src/modules/home/repository/base/base_repository.dart';
import 'package:dio/dio.dart';

class HomeRepository with BaseRepository{

  Future<String?> getAnswer() async {
    try{
      final dioClient = Dio();
      Response response = await dioClient.get("https://api.chucknorris.io/jokes/random"); //todo para testar só zoar essa api aqui
      ChuckNorrisResponseModel chuckNorrisResponseModel = ChuckNorrisResponseModel.fromJson(response.data!);
      return chuckNorrisResponseModel.value;
    }on DioException catch(e){
      throw BaseException("message", HomeRepository().runtimeType.toString(), "error", e);
    }
  }

  Future<void> insertHome() async{
    //aqui estou invocando um método do base repository
    await insert("TABELA", "queryEtc");
  }

}