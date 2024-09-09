import 'package:flutter/material.dart';
import 'package:projeto/view/anuncio.dart';
import 'package:projeto/view/home.dart';
import 'package:projeto/view/registro.dart';

//import 'view/Login.dart'; // caminho da tela de login

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
      home: Cadastro(),
    );
  }
}
