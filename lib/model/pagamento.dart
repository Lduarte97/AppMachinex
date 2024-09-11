class Pagamento {
  // Declaração das variáveis da classe com null safety
  int? id_pagamento;
  String? forma_pagamento;
  double? valor_pagamento;
  String? status_pagamento;
  String? status_pag;
  DateTime? data_pag;

  // Construtor da classe
  Pagamento({
    this.id_pagamento,
    this.forma_pagamento,
    this.valor_pagamento,
    this.status_pagamento,
    this.data_pag,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_pagamento': id_pagamento,
      'forma_pagamento': forma_pagamento,
      'valor_pagamento': valor_pagamento,
      'status_pagamento': status_pagamento,
      'data_pag': data_pag
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Pagamento.fromMap(Map<String, dynamic> map) {
    return Pagamento(
      id_pagamento: map['id_pagamento'],
      forma_pagamento: map['forma_pagamento'],
      valor_pagamento: map['valor_pagamento'],
      status_pagamento: map['status_pagamento'],
      data_pag: map['data_pag'] != null
          ? DateTime.parse(map['data_pag'])
          : null, // Converte String para DateTime
    );
  }
}
