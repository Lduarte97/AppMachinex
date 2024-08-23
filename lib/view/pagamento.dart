import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  int _ultimoId = 2;

  final List<Map<String, String>> pagamentos = [
    {
      'id': '1',
      'formaPagamento': 'Cartão de Crédito',
      'valor': '150.00',
      'status': 'Concluído',
      'data': '2024-08-10',
    },
    {
      'id': '2',
      'formaPagamento': 'Transferência Bancária',
      'valor': '250.00',
      'status': 'Pendente',
      'data': '2024-08-15',
    },
  ];

  String gerarIdAutomatico() {
    _ultimoId++;
    return _ultimoId.toString();
  }

  void mostrarDetalhes(Map<String, String> pagamento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes do Pagamento'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${pagamento['id']}'),
              Text('Forma de Pagamento: ${pagamento['formaPagamento']}'),
              Text('Valor: ${pagamento['valor']}'),
              Text('Status: ${pagamento['status']}'),
              Text('Data: ${pagamento['data']}'),
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

  void novoPagamento() {
    final _formKey = GlobalKey<FormState>();
    String formaPagamento = '';
    String valor = '';
    String status = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Novo Pagamento'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Forma de Pagamento'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a forma de pagamento';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formaPagamento = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Valor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o valor';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    valor = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o status';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    status = value!;
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
                    pagamentos.add({
                      'id': gerarIdAutomatico(),
                      'formaPagamento': formaPagamento,
                      'valor': valor,
                      'status': status,
                      'data': DateTime.now().toLocal().toString().split(' ')[0],
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
        title: Text('Pagamentos'),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar pagamentos...',
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
              itemCount: pagamentos.length,
              itemBuilder: (context, index) {
                final pagamento = pagamentos[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('Pagamento ID: ${pagamento['id']}'),
                    subtitle: Text(
                        'Forma de Pagamento: ${pagamento['formaPagamento']} - Valor: ${pagamento['valor']} - Status: ${pagamento['status']} - Data: ${pagamento['data']}'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[700],
                      size: 16,
                    ),
                    onTap: () => mostrarDetalhes(pagamento),
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
        onPressed: novoPagamento,
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Novo Pagamento',
      ),
    );
  }
}
