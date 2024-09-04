import 'dart:io'; // Importa para usar File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  File? _profileImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeria'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Câmera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveProfile() {
    // Função de salvar o perfil
    final email = _emailController.text;
    final about = _aboutController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Perfil Atualizado'),
          content: Text(
              'Email: $email\nSobre: $about\nTelefone: $phone\nEndereço: $address'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                'assets/logo.png', // Verifique se o caminho está correto
                height: 40,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'App de Controle de Peso',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/profile.png')
                            as ImageProvider,
                    child: _profileImage == null
                        ? const Icon(Icons.camera_alt,
                            size: 50, color: Colors.white)
                        : null,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome do Usuário', // Nome do usuário, substitua conforme necessário
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Usuário desde: Janeiro 2024', // Data ou informação adicional
                        style: TextStyle(
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blue[700]),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(
                labelText: 'Sobre Mim',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blue[700]),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone, color: Colors.blue[700]),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Endereço',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home, color: Colors.blue[700]),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Alterar Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blue[700]),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Salvar Perfil'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Desenvolvido por Paulo Henrique - 2024',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue[700]),
          ),
        ),
      ),
    );
  }
}
