import 'package:flutter/material.dart';

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
  }

  void _loginWithGoogle() {
    print('Login com Google');
  }

  void _navigateToCadastro() {
    print('Navegar para tela de cadastro');
  }

  void _navigateToRecuperarSenha() {
    print('Navegar para tela de recuperação de senha');
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
              onPressed: _loginWithEmail,
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _navigateToCadastro,
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
