class Avaliacao {
  // Declaração das variáveis da classe com null safety
  int? id_avaliacao;
  int? nota;
  DateTime? data_ava;
  String? comentario;
  int? id_usuarios;

  // Construtor da classe
  Avaliacao({
    this.id_avaliacao,
    this.nota,
    this.data_ava,
    this.comentario,
    this.id_usuarios,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_avaliacao': id_avaliacao,
      'nota': nota,
      'data_ava': data_ava
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'comentario': comentario,
      'id_usuarios': id_usuarios,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      id_avaliacao: map['id_avaliacao'],
      nota: map['nota'],
      data_ava: map['data_ava'] != null
          ? DateTime.parse(map['data_ava'])
          : null, // Converte String para DateTime
      comentario: map['comentario'],
      id_usuarios: map['id_usuarios'],
    );
  }
}
