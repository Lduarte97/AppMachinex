import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bancodedados {
  // Classe para criar o banco de dados

  // Criar uma instância do banco de dados
  static final Bancodedados _instancia = Bancodedados._internal();

  // Instanciando
  factory Bancodedados() => _instancia;

  // Protocolo de segurança contra instâncias duplicadas
  Bancodedados._internal();

  // Referência para o banco de dados
  static Database? _database;

  // Getter para acessar o banco de dados
  // async define o trabalho assíncrono
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Verifica se o banco de dados é diferente de nulo e, se for, retorna

    // Inicializar o banco de dados se ainda não tiver sido iniciado
    _database = await _initDatabase();
    return _database!; // Retorna o banco de dados iniciado
  }

  // Método de inicialização privada do banco de dados
  Future<Database> _initDatabase() async {
    // Obter o caminho do diretório do banco de dados
    String path = join(await getDatabasesPath(), 'user.machinex.db');
    // 'user.machinex.db' é o nome do banco de dados
    // Abre o banco de dados e, caso ele não exista, o método cria o BD
    return openDatabase(
      path,
      version: 2, // Versão do banco de dados
      onCreate: _onCreate, // Método para criar o banco de dados
      // onUpgrade: _onUpgrade, // Atualiza o banco de dados caso exista
    );
  }

  // Método de criação do banco de dados
  Future _onCreate(Database db, int version) async {
    // Criando as tabelas
    await db.execute('''
      CREATE TABLE Usuarios(
      id_usuarios INTEGER PRIMARY KEY AUTOINCREMENT,
      Cpf_ou_cnpj TEXT NOT NULL,
      nome_usuarios TEXT NOT NULL,
      Email TEXT NOT NULL,
      Telefone TEXT NOT NULL,
      Endereco TEXT NOT NULL,
      Senha TEXT NOT NULL,
      Tipo_usuario TEXT,
      Sexo TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Equipamento(
      id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome_equipamento TEXT NOT NULL,
      Descricao TEXT NOT NULL,
      Status_equipamento TEXT NOT NULL,
      Intencao TEXT NOT NULL,
      Valor_venda REAL,
      Valor_aluguel REAL,
      UsuarioId INTEGER,
      FOREIGN KEY(UsuarioId) REFERENCES Usuarios(id_usuarios)
      )
    ''');

    await db.execute('''
      CREATE TABLE Transacao(
      id_transacao INTEGER PRIMARY KEY AUTOINCREMENT,
      Tipo_transacao TEXT NOT NULL,
      Data_transacao DATE NOT NULL,
      Valor_total REAL NOT NULL,
      Taxa_paltaforma REAL NOT NULL,
      UsuarioIdEquip INTEGER,
      EquipamentoID INTEGER,
      FOREIGN KEY(UsuarioIdEquip) REFERENCES Usuarios(id_usuarios),
      FOREIGN KEY(EquipamentoID) REFERENCES Equipamento(id_equipamento)
      )
    ''');

    await db.execute('''
      CREATE TABLE Pagamento(
      id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
      Forma_pagamento TEXT NOT NULL,
      Valor_pagamento REAL NOT NULL,
      Status_pagamento TEXT NOT NULL,
      Data_pag DATE NOT NULL,
      transacaoId INTEGER,
      FOREIGN KEY (transacaoId) REFERENCES Transacao(id_transacao)
      )
    ''');

    await db.execute('''
      CREATE TABLE Avaliacao(
      id_avaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
      Nota INTEGER NOT NULL,
      Data_ava DATE NOT NULL,
      Comentario TEXT NOT NULL,
      IdUsuarioAva INTEGER,
      FOREIGN KEY (IdUsuarioAva) REFERENCES Usuarios(id_usuarios)
      )
    ''');

    await db.execute('''
      CREATE TABLE Anuncio(
      id_anuncio INTEGER PRIMARY KEY AUTOINCREMENT,
      Data_da_Criacao DATE,
      Situacao TEXT NOT NULL,
      Tipo_anuncio TEXT NOT NULL,
      IdUsuarioAnu INTEGER,
      IdEquip INTEGER,
      FOREIGN KEY (IdUsuarioAnu) REFERENCES Usuarios(id_usuarios),
      FOREIGN KEY (IdEquip) REFERENCES Equipamento(id_equipamento)
      )
    ''');
  } // Fim do método de criação do banco de dados

  // Método para atualizar banco de dados caso queira mudar

  // Atualiza o banco de dados da versão 1 para 2, e assim em diante
  /*Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        -- Adicione as instruções de atualização aqui
      ''');
    }
  }*/
}
