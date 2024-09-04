import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/Pagamento.dart';

class Pagcontroller {
// start na banco de dados
  final Bancodedados bancodedados = Bancodedados();
  // estrura para criar objeto.

  // metodo de cadstro de usuario
  Future<int> addPag(Pagamento pagamentos) async {
    // criando uma variavel de banco de dados para salvar os dados.
    final db = await bancodedados.database;
    //manadar os dados para o banco de dados
    return await db.insert('Pagamento', pagamentos.toMap());
  }

  //metodo de excluir usuário
  Future<int> deletarPagamento(int id) async {
    //cria a variável de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir o usuário dentro do banco de dados
    return await db.delete('Pagamento', where: 'id=?', whereArgs: [id]);
    /*delete o usuário dentro da tabela Usuarios, onde id do usuário
    for igual ao passado no metodo deletarUsuario*/
  }

  // metodo para editar o usuário
  Future<int> editarPagamento(Pagamento pagamentos) async {
    //criar variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    //atualizar os dados do usuário
    return await db.update('Pagamento', pagamentos.toMap(),
        where: 'id= ?', whereArgs: [pagamentos.id_Pagamento]);
  }

  // metodo de listar usuário

  Future<List<Pagamento>> getUser() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista dos usuarios do banco de dados
    final List<Map<String, dynamic>> listapagamento =
        await db.query('Pagamento');
    /* Variável do tipo lista, que recebe uma Map de Strings dinamicas que recebe todos
    os dados da tabela usuário do banco de dados*/
    return List.generate(listapagamento.length, (int i) {
      return Pagamento.fromMap(listapagamento[i]);
    });
  }
} // fim da UserController