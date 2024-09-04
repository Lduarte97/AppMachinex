class Equipamento {
  int? idEquipamento;
  String? nomeEquipamento;
  String? descricao;
  String? statusEquipamento;
  String? intencao;
  double? valorVenda;
  double? valorAluguel;

  // Construtor da classe
  Equipamento({
    this.idEquipamento,
    this.nomeEquipamento,
    this.descricao,
    this.statusEquipamento,
    this.intencao,
    this.valorVenda,
    this.valorAluguel,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_equipamento': idEquipamento,
      'nome_equipamento': nomeEquipamento,
      'descricao': descricao,
      'status_equipamento': statusEquipamento,
      'intencao': intencao,
      'valor_venda': valorVenda,
      'valor_aluguel': valorAluguel,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Equipamento.fromMap(Map<String, dynamic> map) {
    return Equipamento(
      idEquipamento: map['id_equipamento'],
      nomeEquipamento: map['nome_equipamento'],
      descricao: map['descricao'],
      statusEquipamento: map['status_equipamento'],
      intencao: map['intencao'],
      valorVenda: map['valor_venda'],
      valorAluguel: map['valor_aluguel'],
    );
  }
}
