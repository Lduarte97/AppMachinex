// ignore: file_names
// Importa o pacote sqflite para manipulação do banco de dados SQLite
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Importa o pacote path para trabalhar com caminhos de arquivos

// Define a classe Bancodedados
class Bancodedados {
  // Cria uma instância privada e estática da classe Bancodedados
  static final Bancodedados _instancia = Bancodedados._internal();

  //instanciando
  // Factory constructor que retorna a instância única da classe
  factory Bancodedados() => _instancia;

//use database
//evita que o banco de dados seja duplicado
//protocolo de segurança contra instancias duplicadas
  Bancodedados._internal();
  // referencia para o banco de dados,
  static Bancodedados? _database;

  // get para acessar o banco de dados
  //async define o trabalho assincrono

  Future<Bancodedados> get database async {
    if (_database != null) return _database!;
    //verifica se o banco de dados é diferente de nulo e retorna ao banco de dados
  }

  //inicializa o banco de dados
  _database= await _initDatabase();
  return _database!; // retorana o banco de dados iniciado 
}
