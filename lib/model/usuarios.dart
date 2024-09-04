class Usuarios {
  int? idUsuarios; // Variável que aceita valor nulo
  String? cpfOuCnpj;
  String? nomeUsuarios;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipoUsuario;

  // Construtor da classe
  Usuarios({
    this.idUsuarios,
    this.cpfOuCnpj,
    this.nomeUsuarios,
    this.email,
    this.telefone,
    this.endereco,
    this.senha,
    this.tipoUsuario,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': idUsuarios,
      'cpf_ou_cnpj': cpfOuCnpj,
      'nome_usuarios': nomeUsuarios,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
      'tipo_usuario': tipoUsuario,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      idUsuarios: map['id_usuarios'],
      cpfOuCnpj: map['cpf_ou_cnpj'],
      nomeUsuarios: map['nome_usuarios'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      tipoUsuario: map['tipo_usuario'],
    );
  }

  get id => null;
}
