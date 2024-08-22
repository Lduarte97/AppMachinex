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
    // Lógica de autenticação com e-mail e senha
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Email: $email, Password: $password');
  }

  void _loginWithGoogle() {
    // Lógica de autenticação com o Google
    print('Login com Google');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 100, 232),
        title: Row(
          children: [
            Icon(Icons.app_registration,
                size: 40), // Logo (substitua por sua logo)
            SizedBox(width: 10),
            Text('Machinex'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/assets/Catioro.jpg',
              height: 100,
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
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loginWithEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white, // Cor do botão
                disabledBackgroundColor:
                    Color.fromARGB(248, 237, 3, 226), // Cor do texto
                disabledForegroundColor: Colors.black,
              ),
              child: Text('Login com Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white, // Cor do botão
                disabledBackgroundColor:
                    Color.fromARGB(248, 237, 3, 226), // Cor do texto
                disabledForegroundColor: Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons
                      .email_outlined), // Ícone do Google (substitua por ícone apropriado)
                  SizedBox(width: 10),
                  Text('Login com Google'),
                ],
              ),
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
