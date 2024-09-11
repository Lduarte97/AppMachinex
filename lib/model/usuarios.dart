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
  String? sexo;

  //metodo que converte o objeto user em ma
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
    this.sexo,
  });

  // Método que converte o objeto Usuarios em um mapa de dados
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
      'sexo': sexo,
    };
  }

  // Cria um objeto da classe Usuarios a partir de um Map
  factory Usuarios.fromMap(Map<String, dynamic> map) {
    return Usuarios(
      id_usuarios: map['id_usuarios'],
      cpf_ou_cnpj: map['cpf_ou_cnpj'],
      nome_usuarios: map['nome_usuario'],
      email: map['email'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      senha: map['senha'],
      tipo_usuario: map['tipo_usuario'],
      sexo: map['sexo'],
    );
  }
}
