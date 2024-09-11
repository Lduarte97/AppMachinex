import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:projeto/control/loginController.dart'; // Corrected typo in import
=======
import 'package:projeto/control/LoginController.dart';
>>>>>>> 233a56b1f27fbe0b99853d52afdc993b2c371533
import 'package:projeto/model/usuarios.dart';
import 'package:projeto/view/Cadastro.dart';
import 'package:projeto/view/ListaEquipamentos.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _loginWithEmail() {
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Email: $email, Password: $password');
    Navigator.pushNamed(
        context, '/home'); // Navega para a tela 'Lista de equipamentos'
  }

  void _loginWithGoogle() {
    print('Login com Google');
    Navigator.pushNamed(
        context, '/home'); // Leva até a tela "Lista de equipamentos"
  }

  void _navigateToRecuperarSenha() {
    print('Navegar para tela de recuperação de senha');
  }

  //metodo para o usuário logar

  Future<void> logindousuario() async {
    //criar try catch para tratar erros

    try {
      //variavel para acessar o loginController
      final Logincontroller _loginController = Logincontroller();
      /*criar um objeto da tela model do usuário
      nesse método ele manda email e senha para o controller
      que verifica se a senha e email existem no banco de dados
      e se existir, retorna os dados do usuário a quem pertencem*/
      Usuarios? usuario = await _loginController.loginWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
      //verifica se o usuário retornado em usuário vázio

      if (usuario != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListaEquipamentos(),
          ),
        );
      } else {
        //não encontrol ninguem com email e senha informados
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Senha ou E-mail Incorretos!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 10),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao Entrar!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 100, 232),
        title: Row(
          children: [
            Icon(Icons.app_registration, size: 40),
            SizedBox(width: 10),
            Text('Machinex'),
          ],
        ),
      ),
      body: Container(
        color: Color(
            0xFFEEEEEE), // Cor de fundo ajustada para combinar com a imagem
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                child: ClipOval(
                  child: Image.asset(
                    'lib/assets/logo.png',
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: logindousuario,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Login com Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Text('Login com Google'),
                ],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Ainda não tem uma conta?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _navigateToRecuperarSenha,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                'Desenvolvedor: Lucas Duarte - 2024',
                style: TextStyle(color: Colors.blue[700]),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
