import 'package:app/src/modules/access/views/login/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const Scaffold(
        body: LoginPage()
      ),
    );
  }
}

