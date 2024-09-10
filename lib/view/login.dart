import 'package:flutter/material.dart';
import 'package:projeto/control/loginController.dart'; // Corrected typo in import
import 'package:projeto/control/loginCrotoller.dart';
import 'package:projeto/model/usuarios.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleEmailPasswordLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final LoginController _loginController = LoginController();
      Usuario? user = await _loginController.loginWithEmailPassword(
        email,
        password,
      );

      if (user != null) {
        // Navigate to another screen or show success message
        Navigator.pushReplacementNamed(context, '/home'); // Example navigation
      } else {
        _showDialog('Login Failed', 'Invalid email or password.');
      }
    } catch (e) {
      _showDialog('Login Error', 'An error occurred. Please try again.');
    }
  }

  void _handleGoogleLogin() {
    // Implement Google login logic here
    _showDialog('Login com Google', 'Login com Google não implementado.');
  }

  void _handleFacebookLogin() {
    // Implement Facebook login logic here
    _showDialog('Login com Facebook', 'Login com Facebook não implementado.');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/download.png', // Caminho da imagem atualizado
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'App de Imóveis',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blue[700]),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blue[700]),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleEmailPasswordLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Entrar com Email e Senha'),
            ),
            SizedBox(height: 16),
            Text('Ou continue com', style: TextStyle(color: Colors.blue[700])),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _handleGoogleLogin,
                  icon: Icon(Icons.login, color: Colors.white),
                  label: Text('Google', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _handleFacebookLogin,
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label:
                      Text('Facebook', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Desenvolvido por Paulo Henrique - 2024',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue[700]),
          ),
        ),
      ),
    );
  }
}
