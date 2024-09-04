class Transacao {
  int? id_transacao;
  String? tipo_transacao;
  DateTime? data_transacao;
  double? valor_total;
  double? taxa_plataforma;

  // Construtor - inicializando os valores
  Transacao({
    this.id_transacao,
    this.tipo_transacao,
    this.data_transacao,
    this.valor_total,
    this.taxa_plataforma,
  });

  // Método que converte o objeto Transacao em um mapa de dados
  Map<String, dynamic> toMap() {
    return {
      'id_transacao': id_transacao,
      'tipo_transacao': tipo_transacao,
      'data_transacao':
          data_transacao?.toIso8601String(), // Converte DateTime para String
      'valor_total': valor_total,
      'taxa_plataforma': taxa_plataforma,
    };
  }

  // Cria um objeto Transacao a partir de um Map
  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      id_transacao: map['id_transacao'],
      tipo_transacao: map['tipo_transacao'],
      data_transacao: map['data_transacao'] != null
          ? DateTime.parse(map['data_transacao'])
          : null, // Converte String para DateTime
      valor_total: map['valor_total'],
      taxa_plataforma: map['taxa_plataforma'],
    );
  }
}
