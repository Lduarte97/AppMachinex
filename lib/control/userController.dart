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
    return await db.delete('user', where: 'id=?', whereArgs: [idUsuario]);
    /*delete o registro dentro da tabela user, onde id do usuário
    for igual ao id passado no metodo deletarUsuario */
  }

  //metodo para editar o usuário
  Future<int> editarUsuario(Usuarios usuarios) async {
    //criar variavel de banco de dados acessar os metodos
    final db = await bancodados.database;
    //atualizar os dados do usuário no banco de dados
    return await db.update('user', usuarios.toMap(),
        where: "id=?", whereArgs: [usuarios.id]);
    /*atualize dentro da tabela user, os dados novos dos usuarios
  onde id da tabela do usuário é igual id do usuário passado */
  }

//metodo de lista usuário
  Future<List<Usuarios>> getUser() async {
//criar variavel do banco de dados para usar os metodos
    final db = await bancodados.database;
    //criar variavel para receber a lista dos usuário de banco de dados
    final List<Map<String, dynamic>> listadeusario = await db.query('user');
    /*variavel do tipo lista, que recebe uma Map de String dinamicas 
    que recebe todos os dados da tabela usuário do banco de dados */
    return List.generate(listadeusario.length, (int i) {
      return Usuarios.fromMap(listadeusario[i]);
    });
  }
}//fim da classe UserController