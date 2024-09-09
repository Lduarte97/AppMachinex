import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final TextEditingController _cpfOuCnpjController = TextEditingController();
  final TextEditingController _nomeUsuariosController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _tipoUsuarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Campo CPF ou CNPJ
              TextFormField(
                controller: _cpfOuCnpjController,
                decoration: InputDecoration(labelText: 'CPF ou CNPJ'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF ou CNPJ';
                  }
                  return null;
                },
              ),
              // Campo Nome
              TextFormField(
                controller: _nomeUsuariosController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              // Campo Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o email';
                  }
                  return null;
                },
              ),
              // Campo Telefone
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone';
                  }
                  return null;
                },
              ),
              // Campo Endereço
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o endereço';
                  }
                  return null;
                },
              ),
              // Campo Senha
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a senha';
                  }
                  return null;
                },
              ),
              // Campo Tipo de Usuário
              TextFormField(
                controller: _tipoUsuarioController,
                decoration: InputDecoration(labelText: 'Tipo de Usuário'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tipo de usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Usuario novoUsuario = Usuario(
                        cpfOuCnpj: _cpfOuCnpjController.text,
                        nomeUsuarios: _nomeUsuariosController.text,
                        email: _emailController.text,
                        telefone: _telefoneController.text,
                        endereco: _enderecoController.text,
                        senha: _senhaController.text,
                        tipoUsuario: _tipoUsuarioController.text,
                      );

                      // Aqui você pode fazer algo com o objeto novoUsuario,
                      // como enviá-lo para o banco de dados ou uma API

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuário cadastrado com sucesso!'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Cadastro não realizado!'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 5),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Text('Salvar cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Usuario {
  int? idUsuarios;
  String? cpfOuCnpj;
  String? nomeUsuarios;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipoUsuario;

  Usuario({
    this.idUsuarios,
    this.cpfOuCnpj,
    this.nomeUsuarios,
    this.email,
    this.telefone,
    this.endereco,
    this.senha,
    this.tipoUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': idUsuarios,
      'cpf_ou_cnpj': cpfOuCnpj,
      'nome_usuarios': nomeUsuarios,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
      'tipo_usuario': tipoUsuario,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuarios: map['id_usuarios'],
      cpfOuCnpj: map['cpf_ou_cnpj'],
      nomeUsuarios: map['nome_usuarios'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      tipoUsuario: map['tipo_usuario'],
    );
  }
}
