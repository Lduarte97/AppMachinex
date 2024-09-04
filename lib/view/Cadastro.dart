import 'package:flutter/material.dart';
import 'package:projeto/control/userController.dart';
import 'package:projeto/model/usuarios.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cnpjController = TextEditingController();
  final _senhaController = TextEditingController();
  // ignore: unused_field
  final _sexoController = TextEditingController();

  String _tipoDocumento = 'CPF';
  String _sexo = 'Masculino';
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /*void _cadastrar() {
    // Lógica de cadastro
    final nome = _nomeController.text;
    final email = _emailController.text;
    final telefone = _telefoneController.text;
    final endereco = _enderecoController.text;
    final cpf = _tipoDocumento == 'CPF' ? _cpfController.text : '';
    final cnpj = _tipoDocumento == 'CNPJ' ? _cnpjController.text : '';
    final senha = _senhaController.text;
    final sexo = _sexo.text;
  

    // Implementar lógica de cadastro aqui
    print(
        'Nome: $nome, Email: $email, Telefone: $telefone, Endereço: $endereco, CPF: $cpf, CNPJ: $cnpj, Senha: $senha, Sexo: $_sexo');
  }*/

  void _cancelar() {
    // Lógica para cancelar ou voltar para outra tela
    Navigator.pop(context);
  }

  //criar metodo salvar cadastro
  void salvarcadastro() async {
    // try catch serve para tratar erros

    try {
      // variável da classe usar controller
      // variável me permite chamar o metodo de salvar usuário
      Usercontroller usercontroller = Usercontroller();

      //salvar os dados que o usuário gigitou na classe model

      Usuarios usuario = Usuarios(
        cpf_ou_cnpj: _cpfController.text,
        nome_usuarios: _nomeController.text,
        email: _emailController.text,
        telefone: _telefoneController.text,
        endereco: _enderecoController.text,
        senha: _senhaController.text,
        tipo_usuario: _tipoDocumento,
        sexo: _sexo,
      );

      //salvar usuário
      int userId = await usercontroller.addUser(usuario);
      // criando uma variável do tipo int para guardar o id do novo
      // usuario criado, e manda ao banco de dados o novo usuário
      // metodo de adicionar um novo usuário

      //mensagem de sucesso para o cadastro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.green, //mensagem em caixa verde
          duration: Duration(seconds: 5), //mensagem dura 5 segundos
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro não realizado!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  } //final do metodo salvar cadastro

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
                    onPressed: salvarcadastro,
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
