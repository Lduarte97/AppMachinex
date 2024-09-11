import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();

  void _recuperarSenha() {
    final cpf = _cpfController.text;
    final email = _emailController.text;
    print('CPF: $cpf, Email: $email');
    // Lógica para recuperação de senha aqui
  }

  void _cancelar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 100, 232),
        title: Row(
          children: [
            Icon(Icons.lock_reset, size: 40),
            SizedBox(width: 10),
            Text('Recuperar Senha'),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _recuperarSenha,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Recuperar Senha'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: _cancelar,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                disabledBackgroundColor: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
