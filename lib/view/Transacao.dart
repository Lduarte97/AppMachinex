import 'package:flutter/material.dart';

class Transacao extends StatefulWidget {
  @override
  _TransacaoState createState() => _TransacaoState();
}

class _TransacaoState extends State<Transacao> {
  // Lista de transações fictícias com o número da transação
  final List<Map<String, String>> transacoes = [
    {
      'numero': '001',
      'tipo': 'Compra',
      'data': '20/08/2024',
      'valor': '100,00',
      'taxa': '10,00',
      'equipamento': 'Câmera DSLR',
      'pagamento': 'Cartão de Crédito'
    },
    {
      'numero': '002',
      'tipo': 'Venda',
      'data': '21/08/2024',
      'valor': '200,00',
      'taxa': '15,00',
      'equipamento': 'Lente 50mm',
      'pagamento': 'Boleto Bancário'
    },
    {
      'numero': '003',
      'tipo': 'Aluguel',
      'data': '22/08/2024',
      'valor': '150,00',
      'taxa': '20,00',
      'equipamento': 'Tripé Profissional',
      'pagamento': 'Pix'
    },
    {
      'numero': '004',
      'tipo': 'Compra',
      'data': '23/08/2024',
      'valor': '120,00',
      'taxa': '12,00',
      'equipamento': 'Microfone Condensador',
      'pagamento': 'Cartão de Débito'
    },
    {
      'numero': '005',
      'tipo': 'Aluguel',
      'data': '24/08/2024',
      'valor': '180,00',
      'taxa': '25,00',
      'equipamento': 'Iluminação Softbox',
      'pagamento': 'Transferência Bancária'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          children: [
            Image.asset(
              'assets/download.png', // Certifique-se de ter o caminho correto para o logo
              height: 100,
            ),
            SizedBox(width: 10),
            Text('Transações'), // Substitua pelo nome do seu aplicativo

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Histórico de Transações',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transacoes.length,
                itemBuilder: (context, index) {
                  final transacao = transacoes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('Transação ${transacao['numero']} - ${transacao['tipo']} de ${transacao['equipamento']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data: ${transacao['data']}'),
                          Text('Valor Total: R\$ ${transacao['valor']}'),
                          Text('Taxa da Plataforma: R\$ ${transacao['taxa']}'),
                        ],
                      ),
                      onTap: () {
                        _mostrarDetalhesTransacao(context, transacao);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[700],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Desenvolvido por Suel Ribeiro - 2024',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _mostrarDetalhesTransacao(BuildContext context, Map<String, String> transacao) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes da Transação ${transacao['numero']}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Número da Transação: ${transacao['numero']}'),
                Text('Tipo de Transação: ${transacao['tipo']}'),
                Text('Data: ${transacao['data']}'),
                Text('Valor Total: R\$ ${transacao['valor']}'),
                Text('Taxa da Plataforma: R\$ ${transacao['taxa']}'),
                SizedBox(height: 10),
                Text('Informações sobre o Equipamento:'),
                Text('Nome do Equipamento: ${transacao['equipamento']}'),
                SizedBox(height: 10),
                Text('Detalhes do Pagamento:'),
                Text('Forma de Pagamento: ${transacao['pagamento']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
