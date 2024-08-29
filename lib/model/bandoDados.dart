//Importa o pacote sqflite para manipulação do banco de dados SQLite
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Importa o pacote path para trabalhar com caminhos de arquivos

// Define a classe Bancodedados
class Bancodedados {
  // Cria uma instância privada e estática da classe Bancodedados
  static final Bancodedados _instancia = Bancodedados._internal();

  // Factory constructor que retorna a instância única da classe
  factory Bancodedados() => _instancia;

  // Use database
  // Evita que o banco de dados seja duplicado
  // Protocolo de segurança contra instâncias duplicadas
  Bancodedados._internal();

  // Referência para o banco de dados
  static Database? _database;

  // Get para acessar o banco de dados
  // Async define o trabalho assíncrono
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Verifica se o banco de dados é diferente de nulo e retorna ao banco de dados
    // Inicializa o banco de dados
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Obtém o caminho do diretório do banco de dados
    String path = join(await getDatabasesPath(), 'user.database.bd');
    // Abre o banco de dados, e caso ele não exista, o método cria o BD
    return openDatabase(
      path, // Procura ver se já existe ou não através do caminho
      version: 2, // Versão do banco de dados
      onCreate: _onCreate, // Método chama a criação do banco de dados
      //onUpgrade: _onUpgrade, // Atualiza o banco de dados caso exista
    );
  }

  // Método de criação do banco de dados
  Future _onCreate(Database db, int version) async {
    // Criando tabelas
    await db.execute('''
      CREATE TABLE Usuarios (
        Id_usuarios INTEGER PRIMARY KEY AUTOINCREMENT,
        Cpf_ou_cnpj VARCHAR(14) NOT NULL,
        Nome_usuarios VARCHAR(50) NOT NULL,
        Email VARCHAR(50) NOT NULL,
        Telefone VARCHAR(11) NOT NULL,
        Endereco VARCHAR(100) NOT NULL,
        Senha VARCHAR(8) NOT NULL,
        Tipo_usuario VARCHAR(10)
      ),
    ''');

    await db.execute('''
      CREATE TABLE Equipamento (
        Id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
        Nome_equipamento VARCHAR(20) NOT NULL,
        Descricao VARCHAR(100) NOT NULL,
        Status_equipamento VARCHAR(10) NOT NULL,
        Intencao VARCHAR(7) NOT NULL,
        Valor_venda FLOAT,
        Valor_aluguel FLOAT,
        Id_usuarios INTEGER,
        FOREIGN KEY (Id_usuarios) REFERENCES Usuarios(Id_usuarios)
      ),
    ''');

    await db.execute('''
      CREATE TABLE Transacao (
        Id_transacao INTEGER PRIMARY KEY AUTOINCREMENT,
        Tipo_transacao VARCHAR(7) NOT NULL,
        Data_transacao DATE NOT NULL,
        Valor_total FLOAT NOT NULL,
        Taxa_plataforma FLOAT NOT NULL,
        Id_equipamento INTEGER,
        Id_usuarios INTEGER,
        FOREIGN KEY (Id_equipamento) REFERENCES Equipamento(Id_equipamento),
        FOREIGN KEY (Id_usuarios) REFERENCES Usuarios(Id_usuarios)
      ),
    ''');

    await db.execute('''
      CREATE TABLE Pagamento (
        Id_Pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
        Forma_pagamento VARCHAR(10) NOT NULL,
        Valor_pagamento FLOAT NOT NULL,
        Status_pagamento VARCHAR(10) NOT NULL,
        data_pag DATE NOT NULL,
        Id_transacao INTEGER,
        FOREIGN KEY (Id_transacao) REFERENCES Transacao(Id_transacao)
      ),
    ''');

    await db.execute('''
      CREATE TABLE Avaliacao (
        Id_avaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
        Nota INTEGER NOT NULL,
        data_ava DATE,
        Comentario VARCHAR(200),
        Id_usuarios INTEGER,
        FOREIGN KEY (Id_usuarios) REFERENCES Usuarios(Id_usuarios)
      ),
    ''');

    await db.execute('''
      CREATE TABLE Anuncio (
        Id_anuncio INTEGER PRIMARY KEY AUTOINCREMENT,
        Data_da_criacao DATE,
        Situacao VARCHAR(7) NOT NULL,
        Tipo_anuncio VARCHAR(7) NOT NULL,
        Id_usuario INTEGER,
        Id_equipamento INTEGER,
        FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuarios),
        FOREIGN KEY (Id_equipamento) REFERENCES Equipamento(Id_equipamento)
      ),
    ''');
  }

  // Método de atualização do banco de dados
  //Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  // Atualizações podem ser feitas aqui para versões futuras do banco de dados
  // Por enquanto, apenas uma mensagem de log
  // print('Atualizando banco de dados de $oldVersion para $newVersion');
  //if(olderVersion<2){//versao antiga for menor que 2
  //await db.execute(''''
  //'''')}
}
