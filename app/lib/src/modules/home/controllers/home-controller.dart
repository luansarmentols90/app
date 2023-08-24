import 'package:app/src/modules/home/services/home-service.dart';
import 'package:mobx/mobx.dart';

part 'home-controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  HomeService homeService = HomeService();

  @observable
  int value = 0;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String answer = "";

  @action
  Future<void> getAnswer() async {
    try{
      this.isLoading = true;
      String? chuckNorrisResponseModelAnswer = await this.homeService.getAnswer();
      this.answer = chuckNorrisResponseModelAnswer ?? "";
      this.isLoading = false;
    }catch(e){
      this.isError = true;
      this.isLoading = false;
    }
  }

}
