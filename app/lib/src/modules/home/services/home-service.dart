import 'package:app/src/infrastructure/exceptions/comunication_exception.dart';
import 'package:app/src/modules/home/repository/home-repository.dart';

class HomeService{

  final HomeRepository homeRepository = HomeRepository();

  Future<String?> getAnswer() async {

    try{
      String? answer = await homeRepository.getAnswer();
      return "Nova curiosidade: ${answer!}";
    }on ComunicationException catch (e){
      print(e.toStringMessage());
      rethrow;
    }

  }

}