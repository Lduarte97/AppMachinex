import 'package:flutter/material.dart';

/* classe obrigatoria em toda tela, ela é responsável por definir o estado de mudança dos widgets
o widget statefulwidget permite a randenização dos componentes de interface
*/
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// classe de criação de interface

class _LoginState extends State<Login> {
  //chave de acesso do formulario padrao
  final _formKey = GlobalKey<FormState>();
  
  //variaveis de formulario
  final _emailUsuario = TextEditingController();
  final _senhaUsuario = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(//metodo de retorno dos widgets
      appBar: AppBar(
        title: Text('Tela de Login'),
        backgroundColor: const Color.fromARGB(255, 7, 7, 225),

      ),
    
    ); //final Scaffold
    
  }//final widget
  
}//final classe LoginState

