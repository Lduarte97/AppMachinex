import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bancodedados { // classe para criar o Banco de Dados 

// criar uma instancia do banco de dados 
static final Bancodedados _instancia 
= Bancodedados._internal();

// instanciando

 factory Bancodedados()=>_instancia;

 // protocolo de segurança contra instancias duplicadas
 //evita que o banco de dados seja duplicado.
  Bancodedados._internal(); 

// referencia para o banco de dados 
static Database? _database;

// get para acessar o banco de dados
// async define o trabalho assincrono  
Future<Database> get database async{
  if(_database != null) return _database!;
  // verifica se o banco de dados é diferente de nulo e se for retorna o banco de dados 

  // inicializar o banco de dados caso não tenha sido iniciado 
  _database= await _initDatabase();
  return _database!; // retorna o banco de dados iniciado 

} 

// metodo de inicialização privada do Banco de Dados 

Future<Database> _initDatabase()async{
  // obter o caminho do diretorio do banco de dados 
  String path = join(await getDatabasesPath(), 'user_machinex.db');
  // user_database.db é o nome do banco de dados

  // abre o banco de dados, e caso ele não exista, o metodo cria o BD 
  return openDatabase(
    path, //procura ver se já existe ou não atráves do caminho 
    version: 2 , // versão do banco de dados 
    onCreate: _onCreate , // metodo chama a criação do banco de dados 
    //onUpgrade: _onUpgrade , //atualiza o banco de dados caso exista  
    
  );

}

// metodo de criação do banco de dados 
Future _onCreate(Database db, int version) async {
  //criando as tabelas 
  await db.execute('''
     CREATE TABLE Usuarios (
      Id_usuarios INTERGER PRIMARY KEY AUTOINCREMENT NULL,
      Cpf_ou_cnpj TEXT not null, 
      Nome_usuarios TEXT not null,
      Email TEXT not null,
      Telefone TEXT not null,
      Endereco TEXT not null,
      Senha TEXT not null,
      Tipo_usuario TEXT 
     
    ),
    
 ''');

  await db.execute('''
     CREATE TABLE Equipamento (
      Id_equipamento INTERGER PRIMARY KEY AUTOINCREMENT NULL,
      Nome_equipamento TEXT not null,
      Descricao TEXT not null,
      Status_equipamento TEXT not null,
      Intencao TEXT not null,
      Valor_venda float,
      Valor_aluguel float,
      UsuarioId INTEGER,
      FOREING KEY(UsuariosId) REFERENCES Usuarios(id_usuarios),
    ),
    
 ''');

  await db.execute('''
     CREATE TABLE Transacao (
      Id_transacao INTERGER PRIMARY KEY AUTOINCREMENT NULL,
      Tipo_transacao TEXT not null,
      Data_transacao DATE not null,
      Valor_total float not null,
      Taxa_plataforma float not null,
      EquipamentoId INTEGER,
      UsuarioEquipId INTEGER
      FOREING KEY(EquipmentoId) REFERENCES Equipamento(id_equipamento),
      FOREING KEY(UsuarioEquipId) REFERENCES Usuarios(Id_Usuarios),
    ),
    
 ''');

 await db.execute('''
     CREATE TABLE Pagamento (
      Id_pagamento INTERGER PRIMARY KEY AUTOINCREMENT NULL,
      Forma_pagamento TEXT not null,
      Valor_pagamento float not null,
      Status_pagamento TEXT not null,
      data_pag DATE not null,
      TransacaoId INTEGER,
      FOREING KEY(TransacaoId) REFERENCES Transacao(Id_transacao),
      

    ),
    
 ''');

 await db.execute('''
     CREATE TABLE Avaliacao (
     Id_avaliacao INTERGER PRIMARY KEY AUTOINCREMENT NULL,
     Nota INTEGER not null,
     data_ava DATA,
     Comentario TEXT,
     UsuAvaId INTEGER,
    FOREING KEY(UsuAvaId) REFERENCES Usuarios(Id_usuarios),
    ),
    
 ''');

 await db.execute('''
  create table Anuncio(
   Id_anuncio INTERGER PRIMARY KEY AUTOINCREMENT NULL,
   Data_da_criacao date,
   Situacao TEXT not null,
   Tipo_anuncio TEXT not null,
   UsuAnuncioId INTEGER,
   EquipAnunId INTEGER,
   FOREING KEY(UsuAnuncioId) REFERENCES Usuarios(Id_usuarios),
   FOREING KEY(EquipAnunId) REFERENCES Equipamento(Id_equipamento),
    ),
    
 ''');



} // fim do metodo de criação do banco de dados 


 //metodo para atualiazar banco de dados, caso queira mudar

 // metodo para atualizar banco de dados caso queira mmudar 

 //atuaiza o banco de dados da versão 1 para 2, e assim em diante 
 /*Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
   if (oldVersion < 2) {
    await db.execute('''

''');
   }
 }*/

}

 