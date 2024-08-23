import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  // Controladores dos campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String _selectedGender = 'Masculino'; // Valor padrão para o sexo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Nome
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.red[700]),
                ),
              ),
              SizedBox(height: 16),

              // CPF
              TextField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card, color: Colors.red[700]),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.red[700]),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Senha
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.red[700]),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),

              // Data de Nascimento
              TextField(
                controller: _birthDateController,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  border: OutlineInputBorder(),
                  prefixIcon:
                      Icon(Icons.calendar_today, color: Colors.red[700]),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 16),

              // Gênero
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(),
                ),
                items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),

              // Botão de Cadastro
              ElevatedButton(
                onPressed: () {
                  // Lógica de cadastro
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white, // Texto branco
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Desenvolvido por Paulo Henrique - 2024',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red[700]),
          ),
        ),
      ),
    );
  }
}
