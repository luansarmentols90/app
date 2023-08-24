import 'package:app/src/modules/home/models/chuck-norris-response-model.dart';
import 'package:app/src/modules/home/repository/home-repository.dart';

class HomeService{

  final HomeRepository homeRepository = HomeRepository();

  Future<String?> getAnswer() async {

    try{
      ChuckNorrisResponseModel? chuckNorrisResponseModel = await homeRepository.getAnswer();
      return "Nova curiosidade: ${chuckNorrisResponseModel!.value}";
    }catch(e){
      rethrow;
    }

  }

}