import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Comentado pois não está sendo usado

class CadastroEquipamento extends StatefulWidget {
  @override
  _CadastroEquipamentoState createState() => _CadastroEquipamentoState();
}

class _CadastroEquipamentoState extends State<CadastroEquipamento> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _statusController = TextEditingController();
  final _valorVendaController = TextEditingController();
  final _valorAluguelController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isVenda = false;
  bool _isAluguel = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Cadastro de Equipamento',
            style: TextStyle(color: Colors.black)),
      ),
      // Adicionando ScrollView para permitir a rolagem do conteúdo da tela
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? Icon(Icons.camera_alt, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome do Equipamento',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do equipamento';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _statusController,
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o status do equipamento';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SwitchListTile(
                  title: Text('Venda'),
                  value: _isVenda,
                  onChanged: (bool value) {
                    setState(() {
                      _isVenda = value;
                      if (!value && !_isAluguel) {
                        _valorVendaController.clear();
                      }
                    });
                  },
                  activeColor: Colors.blue[700],
                ),
                SwitchListTile(
                  title: Text('Aluguel'),
                  value: _isAluguel,
                  onChanged: (bool value) {
                    setState(() {
                      _isAluguel = value;
                      if (!value && !_isVenda) {
                        _valorAluguelController.clear();
                      }
                    });
                  },
                  activeColor: Colors.blue[700],
                ),
                SizedBox(height: 16.0),
                if (_isVenda)
                  TextFormField(
                    controller: _valorVendaController,
                    decoration: InputDecoration(
                      labelText: 'Valor de Venda',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          double.tryParse(value) == null) {
                        return 'Digite um valor válido';
                      }
                      return null;
                    },
                  ),
                if (_isAluguel)
                  TextFormField(
                    controller: _valorAluguelController,
                    decoration: InputDecoration(
                      labelText: 'Valor de Aluguel',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          double.tryParse(value) == null) {
                        return 'Digite um valor válido';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Processar os dados e enviar para o banco de dados
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Equipamento Cadastrado')),
                          );
                          // Adicione a lógica para enviar os dados para o banco de dados aqui
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                      ),
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context); // Volta para a tela anterior
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
