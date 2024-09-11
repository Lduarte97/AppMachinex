import 'package:flutter/material.dart';

class Equipamento {
  final String nome;
  final String descricao;
  final String status;
  final bool isVenda;
  final bool isAluguel;
  final double? valorVenda;
  final double? valorAluguel;

  Equipamento({
    required this.nome,
    required this.descricao,
    required this.status,
    required this.isVenda,
    required this.isAluguel,
    this.valorVenda,
    this.valorAluguel,
  });
}

class ListaEquipamentos extends StatelessWidget {
  final List<Equipamento> equipamentos = []; // Lista vazia para ser preenchida

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void _confirmarSaida(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação de saída'),
          content: Text('Você realmente deseja sair?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o pop-up
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black),
                foregroundColor: Colors.black,
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (Route<dynamic> route) => false);
              }, // Navegar para a tela de login
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Sair',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
        backgroundColor: Colors.blue[700],
        title: Text(
          'Lista de Equipamentos',
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil do usuário'),
              onTap: () {
                _navigateTo(context, '/perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastro de equipamento'),
              onTap: () {
                Navigator.pushNamed(context, '/CadastroEquipamentos');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Transações'),
              onTap: () {
                _navigateTo(context, '/Transacao');
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagamentos'),
              onTap: () {
                _navigateTo(context, '/pagamentos');
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('Anúncios'),
              onTap: () {
                _navigateTo(context, '/anuncios');
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Avaliações'),
              onTap: () {
                _navigateTo(context, '/avaliacoes');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                _confirmarSaida(context); // Chama o pop-up de confirmação
              },
            ),
          ],
        ),
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
                    leading: Icon(Icons.image, size: 80, color: Colors.grey),
                    title: Text(
                      equipamento.nome,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                            color:
                                equipamento.isVenda ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                          'Aluguel: ${equipamento.isAluguel ? 'Sim (${equipamento.valorAluguel != null ? 'R\$ ${equipamento.valorAluguel!.toStringAsFixed(2)}' : 'N/A'})' : 'Não'}',
                          style: TextStyle(
                            color: equipamento.isAluguel
                                ? Colors.blue
                                : Colors.red,
                          ),
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
