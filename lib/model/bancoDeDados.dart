import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bancodedados {
  //classe para criar o banco de dados

  //criar uma instancia de banco de dados
  static final Bancodedados _instancia = Bancodedados._internal();
  //instanciando
  factory Bancodedados() => _instancia;

  // protocolo de segurança contra instancias duplicadas
  Bancodedados._internal();

  //referencia para o banco de dados
  static Bancodedados? _database;

  //get para acesar o banco de dados
  //async define o trabalho assincrono
  Future<Bancodedados> get database async {
    if (_database != null) return _database!;
    // verifica se o banco de dados é diferentes de nulo e se for retorna

    // inicializar o banco de dados não tenha sido iniciado
    _database = await _initDatabase();
    return _database!; // retorna o banco de dados iniciado
  }

  // metodo de inialização privada do banco de dados

  Future<Database> _initDatabase() async {
    // Obter o caminho do diretorio do banco de dados
    String path = join(await getDatabasesPath(), 'user.database.db');
    //user_database.db é o nome do banco de dados
    // abre o banco de dados, e caso ele não exista, o metodo cria o BD
    return openDatabase(
      path,
      version: 2, //versão do banco de dados
      onCreate: _onCreate, // metodo chama a criação do banco de dados
      onUpgrade: _onUpgrade, //atualiza o banco de dados caso exista
    );
  }

  //metodo de criação do banco de dados
  Future _onCreate(Database db, int version) async {
    //criando as tabelas
    await db.execute('''
      CREATE TABLE user(
      id INTERGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT ,
      )
''');
  } //fim do metodo de criação do banco de dados
}
