import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:dio/dio.dart';

class HomeRepository{

  Future<ChuckNorrisResponseModel?> getAnswer() async {
    try{
      final dioClient = Dio();
      Response response = await dioClient.get("https://api.chucknorris.io/jokes/random");
      return ChuckNorrisResponseModel.fromJson(response.data!);
    }on DioException catch(e){
      print(e.message);
      return null;
    }
  }
}