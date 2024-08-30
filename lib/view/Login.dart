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
  //chave de acesso do formulário padrão.

  final _formkey = GlobalKey<FormState>();

  //variaveis de formulário 
  final _emailUsuario = TextEditingController();
  final _senhaUsuario = TextEditingController();




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( //metodo de retorno dos widgets 
     appBar: AppBar(
       title: Text('Tela de Login'),
       backgroundColor: const Color.fromARGB(255, 29, 120, 195),

    
     ), //AppBar
     body: Padding (padding: padding),


    
    ); //final Scaffold //Scaffold







    throw UnimplementedError();
  } // final widget 
 
// aqui dentro ficará os icones, botões, imagens e demais partes do design
   
} 
