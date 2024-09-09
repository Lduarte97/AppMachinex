class Transacao {
  // Declaração das variáveis da classe com null safety
  int? id_transacao;
  String? tipo_transacao;
  DateTime? data_transacao;
  double? valor_total;
  double? taxa_plataforma;
  int? id_equipamento;
  int? id_usuarios;

  // Construtor da classe
  Transacao({
    this.id_transacao,
    this.tipo_transacao,
    this.data_transacao,
    this.valor_total,
    this.taxa_plataforma,
    this.id_equipamento,
    this.id_usuarios,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_transacao': id_transacao,
      'tipo_transacao': tipo_transacao,
      'data_transacao': data_transacao
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'valor_total': valor_total,
      'taxa_plataforma': taxa_plataforma,
      'id_equipamento': id_equipamento,
      'id_usuarios': id_usuarios,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      id_transacao: map['id_transacao'],
      tipo_transacao: map['tipo_transacao'],
      data_transacao: map['data_transacao'] != null
          ? DateTime.parse(map['data_transacao'])
          : null, // Converte String para DateTime
      valor_total: map['valor_total'],
      taxa_plataforma: map['taxa_plataforma'],
      id_equipamento: map['id_equipamento'],
      id_usuarios: map['id_usuarios'],
    );
  }
}
