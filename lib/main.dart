import 'package:flutter/material.dart';
import 'view/perfilUsuario.dart'; // Certifique-se de importar o arquivo correto
import 'view/login.dart'; // Certifique-se de importar o arquivo correto
import 'view/cadastro.dart'; // Certifique-se de importar o arquivo correto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Controle de Peso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Correção aqui: deve ser useMaterial3, não useMateria13
      ),
      home: UserProfile(), // Inicializa o widget UserProfile
      initialRoute: '/',
      routes: {
        '/': (context) => Login(), // Tela Login (Certifique-se de que a classe Login existe e está corretamente importada)
        '/cadastro': (context) => Cadastro(), // Tela Cadastro (Certifique-se de que a classe Cadastro existe e está corretamente importada)
        '/home': (context) => home(), // Tela Home (Certifique-se de que a classe Home existe e está corretamente importada)
        '/registroIMC': (context) => UserProfile(), // Tela RegistroIMC (Certifique-se de que a classe RegistroIMC existe e está corretamente importada)
        
      },
    );
  }
  
  



