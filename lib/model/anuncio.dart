import 'package:flutter/material.dart';

class Anuncio extends StatefulWidget {
  @override
  _AnuncioState createState() => _AnuncioState();
}

class _AnuncioState extends State<Anuncio> {
  int _ultimoId = 2;

  final List<Map<String, String>> anuncios = [
    {
      'id': '1',
      'usuarioId': '1001',
      'equipamentoId': '2001',
      'data': '2024-08-10',
      'status': 'Disponível',
      'descricao': 'Equipamento de alta qualidade, pouco uso.',
    },
    {
      'id': '2',
      'usuarioId': '1002',
      'equipamentoId': '2002',
      'data': '2024-08-15',
      'status': 'Vendido',
      'descricao': 'Equipamento novo, na embalagem original.',
    },
  ];

  String gerarIdAutomatico() {
    _ultimoId++;
    return _ultimoId.toString();
  }

  void mostrarDetalhes(Map<String, String> anuncio) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes do Anúncio'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${anuncio['id']}'),
              Text('ID do Usuário: ${anuncio['usuarioId']}'),
              Text('ID do Equipamento: ${anuncio['equipamentoId']}'),
              Text('Data de criação: ${anuncio['data']}'),
              Text('Status: ${anuncio['status']}'),
              SizedBox(height: 10),
              Text('Descrição: ${anuncio['descricao']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue[700]),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void novoAnuncio() {
    final _formKey = GlobalKey<FormState>();
    String usuarioId = '';
    String equipamentoId = '';
    String descricao = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Novo Anúncio'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'ID do Usuário'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o ID do usuário';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    usuarioId = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ID do Equipamento'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o ID do equipamento';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    equipamentoId = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    descricao = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue[700]),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    anuncios.add({
                      'id': gerarIdAutomatico(),
                      'usuarioId': usuarioId,
                      'equipamentoId': equipamentoId,
                      'data': DateTime.now().toLocal().toString().split(' ')[0],
                      'status': 'Disponível',
                      'descricao': descricao,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anúncios'),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar anúncios...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Adicione lógica de pesquisa aqui
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: anuncios.length,
              itemBuilder: (context, index) {
                final anuncio = anuncios[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('Anúncio ID: ${anuncio['id']}'),
                    subtitle: Text(
                        'Usuário ID: ${anuncio['usuarioId']} - Equipamento ID: ${anuncio['equipamentoId']} - Data: ${anuncio['data']} - Status: ${anuncio['status']}'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[700],
                      size: 16,
                    ),
                    onTap: () => mostrarDetalhes(anuncio),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blue[700],
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              'Desenvolvido por Gerlane Rodrigues - 2024',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: novoAnuncio,
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Novo Anúncio',
      ),
    );
  }
}
