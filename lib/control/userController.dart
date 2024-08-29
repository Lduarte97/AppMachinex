// classe para listar, cadastrar e atualizar usuarios

import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/usuarios.dart';

class Usercontroller {
// start na banco de dados
  final Bancodedados bancodedados = Bancodedados();
  // estrura para criar objeto.

  // metodo de cadstro de usuario
  Future<int> addUser(Usuarios usuario) async {
    // criando uma variavel de banco de dados para salvar os dados.
    final db = await bancodedados.database;
    //manadar os dados para o banco de dados
    return await db.insert('Usuarios', usuario.toMap());
  }
}// fim da UserController 