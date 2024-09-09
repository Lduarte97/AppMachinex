import 'package:flutter/services.dart';
import 'package:projeto/model/usuarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto/model/bandoDados.dart';
import 'package:projeto/model/usuarios.dart';

// Classe para realizar login do usuário
class LoginController {
  /* Chamando o banco de dados, DatabaseHelper é o nome
   do meu banco de dados, BancodeDados */
  final DatabaseHelper _bancodedados = DatabaseHelper();
//metodo de autenticação com e-mail e senha
  Future<Usuario?> loginWithEmailPassword(String email, String senha) async {
    //startar a variavel de banco de dados para usar os metodos
    final db = await _bancodedados.database;

    //listar os usuarios cadastrados no banco de dados
    //'users' nome da tabela usuario do meu banco de dados
    final List<Map<String, dynamic>> lista = await db.query(
      'Users',
      where: 'email =? AND senha=?',
      whereArgs: [email, senha],
    ); //final de verificação de email e senha no banco de dados
    if (lista.isNotEmpty) {
      return Usuario.fromMap(lista.first);
      //se lista não for nula, retorna os dados do usuario
      return null;
      //se lista for nula, retorne null.
    }
  } //fim do metodo de autenticação com e-mail e senha
}

class DatabaseHelper {
  get database => null;
}
