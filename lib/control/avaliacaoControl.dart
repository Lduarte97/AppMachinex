import 'package:projeto/model/bancodeDados.dart';
import 'package:projeto/model/avaliacao.dart';

class AvaliacaoController {
  // Inicializando o banco de dados
  final Bancodedados bancodados = Bancodedados();

  // Método para adicionar uma avaliação
  Future<int> addAvaliacao(Avaliacao avaliacao) async {
    final db = await bancodados.database;
    return await db.insert('avaliacao', avaliacao.toMap());
  }

  // Método para deletar uma avaliação
  Future<int> deletarAvaliacao(int idAvaliacao) async {
    final db = await bancodados.database;
    return await db.delete('avaliacao',
        where: 'id_avaliacao = ?', whereArgs: [idAvaliacao]);
  }

  // Método para editar uma avaliação
  Future<int> editarAvaliacao(Avaliacao avaliacao) async {
    final db = await bancodados.database;
    return await db.update(
      'avaliacao',
      avaliacao.toMap(),
      where: 'id_avaliacao = ?',
      whereArgs: [avaliacao.idAvaliacao],
    );
  }

  // Método para listar todas as avaliações
  Future<List<Avaliacao>> getAvaliacoes() async {
    final db = await bancodados.database;
    final List<Map<String, dynamic>> listaDeAvaliacoes =
        await db.query('avaliacao');
    return List.generate(listaDeAvaliacoes.length, (int i) {
      return Avaliacao.fromMap(listaDeAvaliacoes[i]);
    });
  }
}
