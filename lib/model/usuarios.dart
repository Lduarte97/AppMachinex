class Usuarios {
  // Criação de uma classe "Usuarios", classe sempre se inicia com letra maiúscula
  int?
      id_usuarios; // Variável que aceita o valor null devido ao ponto de interrogação
  String? cpf_ou_cnpj;
  String? nome_usuarios;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipo_usuario;

<<<<<<< HEAD
// construtor - chamada da classe que recebe os dados
  Usuarios(
      {this.id_usuarios,
      this.cpf_ou_cnpj,
      this.nome_usuarios,
      this.email,
      this.telefone,
      this.endereco,
      this.senha,
      this.tipo_usuario});

  //metodo que converte o objeto user em map
=======
  // Construtor - chamada da classe que recebe os dados
  Usuarios({
    this.id_usuarios,
    this.cpf_ou_cnpj,
    this.nome_usuarios,
    this.email,
    this.telefone,
    this.endereco,
    this.senha,
    this.tipo_usuario,
  });

  // Método que converte o objeto Usuarios em um mapa de dados
>>>>>>> main
  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': id_usuarios,
      'cpf_ou_cnpj': cpf_ou_cnpj,
<<<<<<< HEAD
      'nome_usuario': nome_usuarios,
=======
      'nome_usuarios': nome_usuarios,
>>>>>>> main
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
      'tipo_usuario': tipo_usuario,
    };
  }

<<<<<<< HEAD
  //cria um objeto de uso da classe, a partir de um map
=======
  // Cria um objeto da classe Usuarios a partir de um Map
>>>>>>> main
  factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      id_usuarios: map['id_usuarios'],
      cpf_ou_cnpj: map['cpf_ou_cnpj'],
<<<<<<< HEAD
      nome_usuarios: map['nome_usuario'],
=======
      nome_usuarios: map['nome_usuarios'],
>>>>>>> main
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      tipo_usuario: map['tipo_usuario'],
    );
  }
}
