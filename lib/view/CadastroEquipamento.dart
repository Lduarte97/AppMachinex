import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? _image; // Para armazenar a imagem selecionada
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource
          .gallery, // Você pode alterar para ImageSource.camera para tirar uma foto
    );
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Cadastro de Equipamento',
            style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Seção para selecionar a imagem do equipamento
              Center(
                child: Column(
                  children: <Widget>[
                    _image == null
                        ? Text('Nenhuma imagem selecionada.')
                        : Image.file(
                            File(_image!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Selecionar Imagem'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        onPrimary: Colors.white,
                      ),
                    ),
                  ],
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                      primary: Colors.blue[700], // Cor do botão "Cadastrar"
                      onPrimary: Colors.white, // Cor do texto do botão
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold), // Texto em negrito
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, // Cor de fundo do botão
                      primary: Colors.black, // Cor do texto do botão
                      side: BorderSide(color: Colors.black), // Cor da borda
                    ),
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
