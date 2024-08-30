import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_shape.dart';
import 'package:flutter_signin_button/sign_in_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Adicione sua lógica de autenticação aqui
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email: $email\nSenha: $password'),
      ),
    );
  }

  void _loginWithGoogle() {
    // Adicione sua lógica de autenticação com Google aqui
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login com Google não implementado'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            // Adicione aqui o widget da logo
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 8),
              child: FlutterLogo(),
            ),
            Text('Nome do App'),
          ],
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700], // Cor do botão
                disabledBackgroundColor: Colors.white,   // Cor do texto
              ),
              child: Text('Entrar'),
            ),
            SizedBox(height: 16.0),
            SignInButton(
              Buttons.Google,
              onPressed: _loginWithGoogle,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Navegar para tela de "Esqueci a senha"
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Navegar para "Esqueci a senha"'),
                      ),
                    );
                  },
                  child: Text('Esqueci a senha'),
                ),
                TextButton(
                  onPressed: () {
                    // Navegar para tela de "Fazer cadastro"
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Navegar para "Fazer cadastro"'),
                      ),
                    );
                  },
                  child: Text('Fazer cadastro'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
