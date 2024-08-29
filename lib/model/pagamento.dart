class Pagamento {
  // Declaração das variáveis da classe com null safety
  int? idPagamento;
  String? formaPagamento;
  double? valorPagamento;
  String? statusPagamento;
  DateTime? dataPag;

  // Construtor da classe
  Pagamento({
    this.idPagamento,
    this.formaPagamento,
    this.valorPagamento,
    this.statusPagamento,
    this.dataPag,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_pagamento': idPagamento,
      'forma_pagamento': formaPagamento,
      'valor_pagamento': valorPagamento,
      'status_pagamento': statusPagamento,
      'data_pag': dataPag
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Pagamento.fromMap(Map<String, dynamic> map) {
    return Pagamento(
      idPagamento: map['id_pagamento'],
      formaPagamento: map['forma_pagamento'],
      valorPagamento: map['valor_pagamento'],
      statusPagamento: map['status_pagamento'],
      dataPag: map['data_pag'] != null
          ? DateTime.parse(map['data_pag'])
          : null, // Converte String para DateTime
    );
  }
}
