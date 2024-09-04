class Usuarios {
<<<<<<< HEAD
  // Declaração das variáveis da classe com null safety
  int? idUsuarios;
  String? cpfOuCnpj;
  String? nomeUsuarios;
=======
  // Criação de uma classe "Usuarios", classe sempre se inicia com letra maiúscula
  int?
      id_usuarios; // Variável que aceita o valor null devido ao ponto de interrogação
  String? cpf_ou_cnpj;
  String? nome_usuarios;
>>>>>>> main
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipoUsuario;

<<<<<<< HEAD
  // Construtor da classe
  Usuarios({
    this.idUsuarios,
    this.cpfOuCnpj,
    this.nomeUsuarios,
=======
  // Construtor - chamada da classe que recebe os dados
  Usuarios({
    this.id_usuarios,
    this.cpf_ou_cnpj,
    this.nome_usuarios,
>>>>>>> main
    this.email,
    this.telefone,
    this.endereco,
    this.senha,
<<<<<<< HEAD
    this.tipoUsuario,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': idUsuarios,
      'cpf_ou_cnpj': cpfOuCnpj,
      'nome_usuarios': nomeUsuarios,
=======
    this.tipo_usuario,
  });

  // Método que converte o objeto Usuarios em um mapa de dados
  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': id_usuarios,
      'cpf_ou_cnpj': cpf_ou_cnpj,
      'nome_usuarios': nome_usuarios,
>>>>>>> main
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
<<<<<<< HEAD
      'tipo_usuario': tipoUsuario,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      idUsuarios: map['id_usuarios'],
      cpfOuCnpj: map['cpf_ou_cnpj'],
      nomeUsuarios: map['nome_usuarios'],
=======
      'tipo_usuario': tipo_usuario,
    };
  }

  // Cria um objeto da classe Usuarios a partir de um Map
  factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      id_usuarios: map['id_usuarios'],
      cpf_ou_cnpj: map['cpf_ou_cnpj'],
      nome_usuarios: map['nome_usuarios'],
>>>>>>> main
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
<<<<<<< HEAD
      tipoUsuario: map['tipo_usuario'],
=======
      tipo_usuario: map['tipo_usuario'],
>>>>>>> main
    );
  }
}
