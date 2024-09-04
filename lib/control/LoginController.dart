import 'package:flutter/services.dart';
import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/usuarios.dart';
import 'package:sqflite/sqflite.dart';

class Logincontroller {
  //chamando o banco de dados
  final Bancodedados _bancodedados = Bancodedados();

  // metodo de login com e-mail e senha

  Future<Usuarios?> loginWithEmailPassword(String email, String senha) async {
    // startar a variável de banco de dados para usar os metodos
    final db = await _bancodedados.database;

    // listar os usuários cadastrados no banco de dados
    final List<Map<String, dynamic>> lista = await db.query(
      'Usuarios',
      where: 'Email =? AND Senha=?',
      whereArgs: [email, senha],
    ); //final da verificação de email e senha
    if (lista.isNotEmpty) {
      return Usuarios.fromMap(lista.first);
      //se lista não for null, retorne os dados do usuário
    } else {
      return null;
      //se a lista for nula, retorne null.
    }
  } // fim do metodo de autenticação com email e senha
}
