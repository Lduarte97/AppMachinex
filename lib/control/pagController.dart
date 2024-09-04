import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/Pagamento.dart';

class Pagcontroller {
// start na banco de dados
  final Bancodedados bancodedados = Bancodedados();
  // estrura para criar objeto.

  // metodo de cadstro de pagamento
  Future<int> addPag(Pagamento pagamentos) async {
    // criando uma variavel de banco de dados para salvar os dados.
    final db = await bancodedados.database;
    //manadar os dados para o banco de dados
    return await db.insert('Pagamento', pagamentos.toMap());
  }

  //metodo de excluir pagamento
  Future<int> deletarPagamento(int id) async {
    //cria a variável de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir o pagamento dentro do banco de dados
    return await db.delete('Pagamento', where: 'id=?', whereArgs: [id]);
    /*deleta o pagamento dentro da tabela pagamento, onde id do pagamento
    for igual ao passado no metodo deletarUsuario*/
  }

  // metodo de listar pagamento

  Future<List<Pagamento>> getUser() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista dos pagamentos do banco de dados
    final List<Map<String, dynamic>> listapagamento =
        await db.query('Pagamento');
    /* Variável do tipo lista, que recebe uma Map de Strings dinamicas que recebe todos
    os dados da tabela pagamentos do banco de dados*/
    return List.generate(listapagamento.length, (int i) {
      return Pagamento.fromMap(listapagamento[i]);
    });
  }
} // fim da UserController