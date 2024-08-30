//classe para listar, cadastro e atualizar usuarios

import 'package:projeto/model/bandoDados.dart';
import 'package:projeto/model/usuarios.dart';

class Usercontroller {
//start no banco de dados, criando um objeto dele;
//estrutura para criar objeto.
  final Bancodedados bancodados = Bancodedados();

  //metodo de cadastro fr usuario
  //User é o nome da classe model de vocês
  Future<int> addUser(Usuarios usuario) async {
    //criando uma variavel de banco de dados para salvar os dados.
    //serve para conectar o metodo ao banco de dados
    final db = await bancodados.database;

    //mandar os dados para o banco de dados
    //user é o nome da tabela do banco de dados
    return await db.insert('user', usuario.toMap());
  } //fim do metodo de cadastro do usuário

  //metodo de excluir usuarios
  Future<int> deletarUsuario(int idUsuario) async {
    //cria a variavel de banco de dados para acessar os metodos
    final db = await bancodados.database;
    //excluir o usuário dentro do banco de dados
  }
}//fim da classe UserController