class Equipamento {
  // Declaração das variáveis da classe com null safety
  int? id_equipamento;
  String? nome_equipamento;
  String? descricao;
  String? status_equipamento;
  String? intencao;
  double? valor_venda;
  double? valor_aluguel;
  int? id_usuarios;

  // Construtor da classe
  Equipamento({
    this.id_equipamento,
    this.nome_equipamento,
    this.descricao,
    this.status_equipamento,
    this.intencao,
    this.valor_venda,
    this.valor_aluguel,
    this.id_usuarios,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_equipamento': id_equipamento,
      'nome_equipamento': nome_equipamento,
      'descricao': descricao,
      'status_equipamento': status_equipamento,
      'intencao': intencao,
      'valor_venda': valor_venda,
      'valor_aluguel': valor_aluguel,
      'id_usuarios': id_usuarios,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Equipamento.fromMap(Map<String, dynamic> map) {
    return Equipamento(
      id_equipamento: map['id_equipamento'],
      nome_equipamento: map['nome_equipamento'],
      descricao: map['descricao'],
      status_equipamento: map['status_equipamento'],
      intencao: map['intencao'],
      valor_venda: map['valor_venda'],
      valor_aluguel: map['valor_aluguel'],
      id_usuarios: map['id_usuarios'],
    );
  }
}
