import 'package:projeto/model/bandoDados.dart';
import 'package:projeto/model/anuncio.dart';

class AnuncioController {
  // Inicializando o banco de dados
  final Bancodedados bancodados = Bancodedados();

  // Método para adicionar um anúncio
  Future<int> addAnuncio(Anuncio anuncio) async {
    final db = await bancodados.database;
    return await db.insert('anuncio', anuncio.toMap());
  }

  // Método para deletar um anúncio
  Future<int> deletarAnuncio(int idAnuncio) async {
    final db = await bancodados.database;
    return await db
        .delete('anuncio', where: 'id_anuncio = ?', whereArgs: [idAnuncio]);
  }

  // Método para editar um anúncio
  Future<int> editarAnuncio(Anuncio anuncio) async {
    final db = await bancodados.database;
    return await db.update(
      'anuncio',
      anuncio.toMap(),
      where: 'id_anuncio = ?',
      whereArgs: [anuncio.id_Anuncio],
    );
  }

  // Método para listar todos os anúncios
  Future<List<Anuncio>> getAnuncios() async {
    final db = await bancodados.database;
    final List<Map<String, dynamic>> listaDeAnuncios =
        await db.query('anuncio');
    return List.generate(listaDeAnuncios.length, (int i) {
      return Anuncio.fromMap(listaDeAnuncios[i]);
    });
  }
}
