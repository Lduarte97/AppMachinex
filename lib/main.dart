import 'package:flutter/material.dart';
import 'package:projeto/model/anuncio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machnex',
      theme: ThemeData(
        // Define a paleta de cores e outros estilos para o aplicativo
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[700]!, // Define a cor base para o tema
        ),
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
      home: Anuncio(), // Define a tela inicial do aplicativo
    );
  }
}
