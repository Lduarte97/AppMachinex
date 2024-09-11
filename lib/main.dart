import 'package:flutter/material.dart';
import 'package:projeto/view/home.dart';
import 'package:projeto/view/anuncio.dart';
import 'package:projeto/view/Avaliacao.dart';
import 'package:projeto/control/loginController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      //home: Login(),
      home: Login(),
    );
  }
}
