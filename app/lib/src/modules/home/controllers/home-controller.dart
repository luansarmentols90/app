import 'package:app/src/modules/home/services/home-service.dart';
import 'package:flutter/material.dart';
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

  @observable 
  int attempts = 0;

  int limitAttempts = 3; //pode ficar em algum arquivo de config

  @action
  Future<void> getAnswer(BuildContext context) async {
    try{
      this.isLoading = true;
      String? chuckNorrisResponseModelAnswer = await this.homeService.getAnswer();
      this.answer = chuckNorrisResponseModelAnswer ?? "";
      this.isLoading = false;
    }catch(e){
      print("tentando....");
      this.attempts++;
      if(this.attempts >= this.limitAttempts) {
        this.isLoading = false;
        this.attempts = 0;
        ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(content: const Text("Deu ruim rapaaaa!"), action: SnackBarAction(label: "Fechar", onPressed: () {
              print('fechouu');
            }))
          );
      }else{
        this.isLoading = false;
        await this.getAnswer(context);
      }  
    }
  }

}
