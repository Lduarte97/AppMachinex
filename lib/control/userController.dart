// classe para listar, cadastrar e atualizar usuarios 

import 'package:projeto/model/bancoDeDados.dart';

classe UserController{

  // start no banco de dados, criando um objeto dele;
  // estrutura para criar objeto.
  final Bancodedados bancodedados = Bancodedados();



  //metodo de cadastro de usuário
  //user é o nome da classe model de vocês 
  Future<int> addUse(Usuarios usuario) async{
    // criando uma variavel de banco de dados para salvar os dados.
    //serve para conerctar aos metodos do banco de dados 
    final db = await bancodedados.database;

    // mandar os dados para o banco de dados 
    //user é o nome da tabela do banco de dados
    return await db.insert('Usuarios',usuario.toMap());

  } // final do metodo de cadastro do usuário 


}// fim da classe UserController