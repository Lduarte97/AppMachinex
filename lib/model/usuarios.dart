class Usuarios {
  //criação de uma classe "User" classe sempre se inicia com letra maiúscula

  int? id_usuarios; //Variável que aceita o valor null devido o ponto de interrogação
  String? cpf_ou_cnpj;
  String? nome_usuarios;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipo_usuario;
  //int idade1 = 20; variável que não aceita o valor null

  //construtor - chamada da classe que recebe os dados
  Usuarios ({this.id_usuarios, this.cpf_ou_cnpj,this.nome_usuarios,this.email,this.telefone,this.endereco,this.senha,this.tipo_usuario});
  //this refencia uso de variavel local (contida na classe)

  //metodo que converte o objeto user em map
  Map<String,dynamic> toMap(){
    return{
      'usuarios': id_usuarios,
      'cpf_ou_cnpj': cpf_ou_cnpj,
      'nome_usuarios': nome_usuarios,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
      'tipo_usuario': tipo_usuario,
    };
  }

  //cria um objeto de uso da classe, apartir de um map
  factory Usuarios.fromMap(Map<String,dynamic>map){
    return Usuarios(//nome da classe
      id_usuarios: map['id_usuarios'],
      cpf_ou_cnpj: map['cpf_ou_cnpj'],
      nome_usuarios: map['nome_usuarios'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      
    );
  }//final do factory





}
