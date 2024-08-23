import 'package:flutter/material.dart';
import 'package:projeto/view/Transacao.dart';

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
        // Configura o tema dos botões de texto
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue[700], // Cor do texto dos botões
          ),
        ),
        // Configura o tema dos botões elevados
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700], // Cor do fundo dos botões
            foregroundColor: Colors.white, // Cor do texto dos botões
          ),
        ),
      ),
      home: Transacao(), // Define a tela inicial do aplicativo
    );
  }
}

