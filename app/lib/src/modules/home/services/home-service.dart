import 'package:app/src/modules/home/models/chuck-norris-response-db.dart';
import 'package:app/src/modules/home/repository/home-repository.dart';

class HomeService{

  final HomeRepository homeRepository = HomeRepository();

  Future<String?> getAnswer() async {

    try{
      Answer? answer = await homeRepository.getAnswer();
      return "Nova curiosidade: ${answer!.text}";
    }catch(e){
      rethrow;
    }

  }

}