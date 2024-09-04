import 'package:projeto/model/bancoDeDados.dart';
import 'package:projeto/model/equipamento.dart';

class Equipcontroller {
// start na banco de dados
  final Bancodedados bancodedados = Bancodedados();
  // estrura para criar objeto.

  // metodo de cadstro de equipamento
  Future<int> addEquip(Equipamento cadastroequip) async {
    // criando uma variavel de banco de dados para salvar os dados.
    final db = await bancodedados.database;
    //manadar os dados para o banco de dados
    return await db.insert('Equipamento', cadastroequip.toMap());
  }

  //metodo de excluir equipamento
  Future<int> deletarEquipamento(int id) async {
    //cria a variável de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir o equipamento dentro do banco de dados
    return await db.delete('Equipamento', where: 'id=?', whereArgs: [id]);
    /*delete o usuário dentro da tabela equipamento, onde id do equipamento
    for igual ao passado no metodo deletarUsuario*/
  }

  // metodo para editar o equipamento
  Future<int> editarEquipamento(Equipamento cadastroequip) async {
    //criar variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    //atualizar os dados do equipamento
    return await db.update('Equipamento', cadastroequip.toMap(),
        where: 'id= ?', whereArgs: [cadastroequip.id_equipamento]);
  }

  // metodo de listar equipamento

  Future<List<Equipamento>> getEquip() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista dos equipamentos do banco de dados
    final List<Map<String, dynamic>> listaequipamento =
        await db.query('Equipamento');
    /* Variável do tipo lista, que recebe uma Map de Strings dinamicas que recebe todos
    os dados da tabela equipamento do banco de dados*/
    return List.generate(listaequipamento.length, (int i) {
      return Equipamento.fromMap(listaequipamento[i]);
    });
  }
} // fim da UserController