import 'package:app/src/infrastructure/exceptions/comunication_exception.dart';
import 'package:app/src/modules/home/models/chuck-norris-response-db.dart';
import 'package:app/src/modules/home/repository/home-repository.dart';

class HomeService{

  final HomeRepository homeRepository = HomeRepository();

  Future<String?> getAnswer() async {

    try{
      Answer? answer = await homeRepository.getAnswer();
      throw Exception();
      //return "Nova curiosidade: ${answer!.text}";
    }catch(e){
      throw ComunicationException();
    }

  }

}