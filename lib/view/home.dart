import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        color: Colors.blue[700], // Fundo azul 700
        child: ListView(
          children: [
            _buildListItem(context, 'Tela de Cadastro e Login', Login()),
            _buildListItem(context, 'Tela de Perfil do Usuário', UserProfile()),
            _buildListItem(context,
                'Tela de Listagem e Detalhes de Equipamentos', EquipmentList()),
            _buildListItem(
                context,
                'Tela de Cadastro e Gerenciamento de Equipamentos',
                EquipmentManagement()),
            _buildListItem(context, 'Tela de Transações', Transactions()),
            _buildListItem(
                context, 'Tela de Recuperação de Senha', PasswordRecovery()),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, String title, Widget destination) {
    return Card(
      color: Colors.white, // Cartões brancos
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.blue[700]), // Texto em azul 700
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}

// Placeholder widgets for navigation
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('User Profile Screen'),
      ),
    );
  }
}

class EquipmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment List'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('Equipment List Screen'),
      ),
    );
  }
}

class EquipmentManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Management'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('Equipment Management Screen'),
      ),
    );
  }
}

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('Transactions Screen'),
      ),
    );
  }
}

class PasswordRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Recovery'),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text('Password Recovery Screen'),
      ),
    );
  }
}
