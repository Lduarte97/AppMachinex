// classe para listar, cadastrar e atualizar usuarios 


import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/transacao.dart';

class TransController{

  // start no banco de dados, criando um objeto dele;
  // estrutura para criar objeto.
  final Bancodedados bancodedados = Bancodedados();
  
  get listaDeTransacao => null;



  //metodo de cadastro de usuário
  //user é o nome da classe model de vocês 
  Future<int> addTransacao(Transacao transacao) async{
    // criando uma variavel de banco de dados para salvar os dados.
    //serve para conerctar aos metodos do banco de dados 
    final db = await bancodedados.database;

    // mandar os dados para o banco de dados 
    //user é o nome da tabela do banco de dados
    return await db.insert('transacao', transacao.toMap());

  } // final do metodo de cadastro do usuário 


  // metodo de excluir usuário 
  Future<int> deletarTransacao(int id) async {
    //cria a varieval de banco de dados para acessar os metodos 
     final db = await bancodedados.database;
     // excluir o usuário dentro do banco de dados 
     return await db.delete('transacao' , where: 'id=?' , whereArgs: [id]);
     /* delete o registro dentro da tabela user, onde id do usuário for igual ao id passado no metodo deleteUsuario */

  }

  //metodo para editar o usuário 
  Future<int> editarTransacao(Transacao transacao) async {

  //criar variavel de banco de dados para acessar os metodos 
  final db = await bancodedados.database;
  //atualizar os dados do usuário no banco de dados 
  return await db.update('transacao', transacao.toMap(), where: 'id= ?', whereArgs: [transacao.id_transacao]);


  }
  
  //  metodo de listar usuário 

  Future<List<Transacao>> getUser() async {
    //criar variavel do banco de dados para usar os metodos 
    final db = await bancodedados.database;
    //criar variavel para receber a lista dos usuários do banco de daddos 
    final List<Map<String , dynamic>> listadeusuario= await db.query('Transacao');
    /*variavel do tipo lista, que recebe uma Map do String dinamicas que recebe todos os dados da tabela usuário do banco de dados*/
    /* percorra a lista ede usuário e mande/retorne todos os dados para o metodo fromMap da classe model user*/
    return List.generate(listaDeTransacao.length, (int i){
      return Transacao.fromMap(listaDeTransacao[i]);

    });
  }



}// fim da classe UserController