class Transacao {
  int? idTransacao;
  String? tipoTransacao;
  DateTime? dataTransacao;
  double? valorTotal;
  double? taxaPlataforma;

  // Construtor da classe
  Transacao({
    this.idTransacao,
    this.tipoTransacao,
    this.dataTransacao,
    this.valorTotal,
    this.taxaPlataforma,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_transacao': idTransacao,
      'tipo_transacao': tipoTransacao,
      'data_transacao': dataTransacao
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'valor_total': valorTotal,
      'taxa_plataforma': taxaPlataforma,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      idTransacao: map['id_transacao'],
      tipoTransacao: map['tipo_transacao'],
      dataTransacao: map['data_transacao'] != null
          ? DateTime.parse(map['data_transacao'])
          : null, // Converte String para DateTime
      valorTotal: map['valor_total'],
      taxaPlataforma: map['taxa_plataforma'],
    );
  }
}
