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
  static Database? _database;

  //get para acesar o banco de dados
  //async define o trabalho assincrono
  Future<Database> get database async {
    if (_database != null) return _database!;
    // verifica se o banco de dados é diferentes de nulo e se for retorna

    // inicializar o banco de dados não tenha sido iniciado
    _database = await _initDatabase();
    return _database!; // retorna o banco de dados iniciado
  }

  // metodo de inialização privada do banco de dados

  Future<Database> _initDatabase() async {
    // Obter o caminho do diretorio do banco de dados
    String path = join(await getDatabasesPath(), 'user.machinex.db');
    //user_database.db é o nome do banco de dados
    // abre o banco de dados, e caso ele não exista, o metodo cria o BD
    return openDatabase(
      path,
      version: 2, //versão do banco de dados
      onCreate: _onCreate, // metodo chama a criação do banco de dados

      //onUpgrade: _onUpgrade, //atualiza o banco de dados caso exista
    );
  }

  //metodo de criação do banco de dados
  Future _onCreate(Database db, int version) async {
    //criando as tabelas
    await db.execute('''
      CREATE TABLE Usuarios(
      id_usuarios INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Cpf_ou_cnpj TEXT not null,
      Email TEXT not null ,
      Telefone TEXT not null,
      Endereco TEXT not null,
      Senha TEXT not null,
      Tipo_usuario TEXT
      )
'''); //fim da tabela Usuários
    await db.execute('''
      CREATE TABLE Equipamento(
      id_equipamento INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Nome_equipamento TEXT not null,
      Descricao TEXT not null,
      Status_equipamento TEXT not null,
      Intencao TEXT not null,
      Valor_venda REAL,
      Valor_aluguel REAL,
      UsuarioId INTEREGE,
      FOREIGN KEY(UsuarioId) REFERENCES Usuarios(id_usuarios),
      ),
'''); //fim da tabela Equipamento
    await db.execute('''
      CREATE TABLE Transacao(
      id_transacao INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Tipo_transacao TEXT not null,
      Data_transacao DATE not null ,
      Valor_total REAL not null,
      Taxa_paltaforma REAL not null,
      UsuarioIdEquip INTEGER,
      EquipamentoID INTEGER,
      FOREIGN KEY(UsuarioIdEquip) REFERENCES Usuarios(id_Usuarios),
      FOREIGN KEY(EquipamentoID) REFRENCES Equipamento(id_equipamento),
      ),
'''); //fim da tabela Transacao
    await db.execute('''
      CREATE TABLE Pagamento(
      id_pagamento INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Forma_pagamento TEXT not null,
      Valor_pagamento REAL not null ,
      Status_pagamento TEXT not null,
      Data_pag DATE not null,
      transacaoId INTEGER,
      FOREIGN KEY (transacaoId) REFRENCES Transacao (id_transacao),
      ),
'''); //fim da tabela pagamento
    await db.execute('''
      CREATE TABLE Avaliacao(
      id_avaliacao INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Nota INTEGER not null,
      Data_ava DATE not null ,
      Comentario TEXT not null,
      IdUsuarioAva INTEGER,
      FOREIGN KEY (IdUsuarioAva) REFERENCES Usuarios(id_usuarios),
      ),
'''); //fim da tabela avaliacao
    await db.execute('''
      CREATE TABLE Anuncio(
      id_anuncio INTERGER PRIMARY KEY AUTOINCREMENT not null,
      Data_da_Criacao DATE,
      Situacao TEXT not null ,
      Tipo_anuncio TEXT not null,
      IdUsuarioAnu INTEGER,
      IdEquip INTEGER,
      FOREIGN KEY (IdUsuarioAnu) REFERENCES Usuarios(id_usuarios),
      FOREIGN KEY (IdEquip) REFERENCES Equipamento(id_equipamento ),
      ),
''');
  } //fim do metodo de criação do banco de dados

  //metodo para atualizar banco de dados caso queira mudar

  //atualiza o banco de dados da versão 1 para 2, e assim em diante
  /*Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''

''');
    }
  }*/
}
