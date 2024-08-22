import 'package:flutter/material.dart';

class Equipamento {
  final String nome;
  final String descricao;
  final String status;
  final bool isVenda;
  final bool isAluguel;
  final double? valorVenda;
  final double? valorAluguel;
  final String? imagePath; // Caminho da imagem

  Equipamento({
    required this.nome,
    required this.descricao,
    required this.status,
    required this.isVenda,
    required this.isAluguel,
    this.valorVenda,
    this.valorAluguel,
    this.imagePath,
  });
}

class ListaEquipamentos extends StatelessWidget {
  final List<Equipamento> equipamentos = []; // Lista vazia para ser preenchida

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Lista de Equipamentos',
            style: TextStyle(color: Colors.black)),
      ),
      body: equipamentos.isEmpty
          ? Center(
              child: Text(
                'Nenhum equipamento cadastrado.',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: equipamentos.length,
              itemBuilder: (context, index) {
                final equipamento = equipamentos[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: equipamento.imagePath != null
                        ? Image.asset(
                            equipamento.imagePath!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image, size: 80, color: Colors.grey),
                    title: Text(equipamento.nome,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(equipamento.descricao),
                        SizedBox(height: 4.0),
                        Text('Status: ${equipamento.status}'),
                        SizedBox(height: 4.0),
                        Text(
                          'Venda: ${equipamento.isVenda ? 'Sim (${equipamento.valorVenda != null ? 'R\$ ${equipamento.valorVenda!.toStringAsFixed(2)}' : 'N/A'})' : 'Não'}',
                          style: TextStyle(
                              color: equipamento.isVenda
                                  ? Colors.green
                                  : Colors.red),
                        ),
                        Text(
                          'Aluguel: ${equipamento.isAluguel ? 'Sim (${equipamento.valorAluguel != null ? 'R\$ ${equipamento.valorAluguel!.toStringAsFixed(2)}' : 'N/A'})' : 'Não'}',
                          style: TextStyle(
                              color: equipamento.isAluguel
                                  ? Colors.blue
                                  : Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
