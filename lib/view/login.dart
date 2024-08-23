import 'package:flutter/material.dart';
//import 'view/Login.dart'; // Certifique-se de que o caminho está correto para o arquivo Login.dart

/* Classe obrigatória em toda tela, responsável por definir o estado de mudança dos widgets.
   O widget StatefulWidget permite a renderização dos componentes de interface. */
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// Classe de criação de interface
class _LoginState extends State<Login> {
  // Chave de acesso do formulário padrão
  final _formKey = GlobalKey<FormState>();

  // Variáveis de formulário
  final emailUsuario = TextEditingController();
  final senhaUsuario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Método de retorno dos widgets */
      appBar: AppBar(
        title: Text('Tela de Login'),
        backgroundColor: Colors.blue,
      ), // AppBar
      body: Padding(
        // Definindo margem para os widgets
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailUsuario,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: senhaUsuario,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Processa o login
                  }
                },
                child: Text('Login'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Entre com sua senha",
                ),
                obscureText: true, //ocultar senha
              ), //final TextFormField
            ], // final da children (filhos) da column
          ), // Column
        ), // Form
      ), // Padding
    ); // Scaffold
  }
}
