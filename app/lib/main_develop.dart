import 'package:app/src/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  
  //Quando for necessário carregar alguma coisa antes do app de fato rodar, deve ser adicionado aqui.
  // -->

  startApplication();
  
}

void startApplication() {
  runApp(const App());
}
