class Usuario {
  // Declaração das variáveis da classe com null safety
  int? id_usuarios;
  String? cpf_ou_cnpj;
  String? nome_usuarios;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? tipo_usuario;

  static var id;

  // Construtor da classe
  Usuario({
    this.id_usuarios,
    this.cpf_ou_cnpj,
    this.nome_usuarios,
    this.email,
    this.telefone,
    this.endereco,
    this.senha,
    this.tipo_usuario,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_usuarios': id_usuarios,
      'cpf_ou_cnpj': cpf_ou_cnpj,
      'nome_usuarios': nome_usuarios,
      'email': email,
      'telefone': telefone,
      'endereco': endereco,
      'senha': senha,
      'tipo_usuario': tipo_usuario,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id_usuarios: map['id_usuarios'],
      cpf_ou_cnpj: map['cpf_ou_cnpj'],
      nome_usuarios: map['nome_usuarios'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      tipo_usuario: map['tipo_usuario'],
    );
  }
}
