import 'package:flutter/material.dart';
import 'package:projeto/view/Login.dart';
import 'package:projeto/view/Cadastro.dart';
import 'package:projeto/view/CadastroEquipamento.dart';
import 'package:projeto/view/ListaEquipamentos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Login(),
      home: Cadastro(),
      //home: CadastroEquipamento(),
      //home: ListaEquipamentos(),
    );
  }
}
