import 'package:flutter/material.dart';
import 'package:projeto/view/Login.dart';
import 'package:projeto/view/Cadastro.dart';
import 'package:projeto/view/CadastroEquipamento.dart';
import 'package:projeto/view/ListaEquipamentos.dart';
import 'package:projeto/view/RecuperarSenha.dart';

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
      //Define as rotas aqui
      initialRoute: '/',
      routes: {
        '/': (context) => Login(), //tela login
        '/cadastro': (context) => Cadastro(), //tela cadastro de usuário
        '/home': (context) => ListaEquipamentos(), //tela home
        '/CadastroEquipamentos': (context) =>
            CadastroEquipamento(), //Cadastro equipamento
        '/Recuperação': (context) => RecuperarSenha(),
      },
      //home: Login(),
      //home: Cadastro(),
      //home: CadastroEquipamento(),
      //home: ListaEquipamentos(),
    );
  }
}
