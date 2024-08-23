import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _senhaController = TextEditingController();
  final _dataNascimentoController = TextEditingController();

  String _tipoDocumento = 'CPF';
  String _sexo = 'Masculino';
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _cadastrar() {
    // Lógica de cadastro
    final nome = _nomeController.text;
    final email = _emailController.text;
    final endereco = _enderecoController.text;
    final cpf = _tipoDocumento == 'CPF' ? _cpfController.text : '';
    final cnpj = _tipoDocumento == 'CNPJ' ? _cnpjController.text : '';
    final senha = _senhaController.text;
    final dataNascimento = _dataNascimentoController.text;

    // Implementar lógica de cadastro aqui
    print(
        'Nome: $nome, Email: $email, Endereço: $endereco, CPF: $cpf, CNPJ: $cnpj, Data de Nascimento: $dataNascimento, Senha: $senha, Sexo: $_sexo');
  }

  void _cancelar() {
    // Lógica para cancelar ou voltar para outra tela
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
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
              SizedBox(height: 16),
              TextField(
                controller: _enderecoController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoDocumento,
                decoration: InputDecoration(
                  labelText: 'Tipo de Documento',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _tipoDocumento = newValue!;
                  });
                },
                items: <String>['CPF', 'CNPJ']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              if (_tipoDocumento == 'CPF')
                TextField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (_tipoDocumento == 'CNPJ')
                TextField(
                  controller: _cnpjController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CNPJ',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 16),
              TextField(
                controller: _dataNascimentoController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _sexo,
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _sexo = newValue!;
                  });
                },
                items: <String>['Masculino', 'Feminino', 'Outro']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _senhaController,
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
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _cadastrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700], // Cor do botão
                      foregroundColor: Colors.white, // Cor do texto
                      minimumSize: Size(150, 40), // Tamanho mínimo
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _cancelar,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, // Cor de fundo
                      side: BorderSide(color: Colors.black), // Cor da borda
                      minimumSize: Size(150, 40), // Tamanho mínimo
                    ),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.black, // Cor do texto
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
