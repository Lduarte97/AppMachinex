class Avaliacao {
  int? idAvaliacao;
  int? nota;
  DateTime? date;
  String? comentario;

  // Construtor da classe
  Avaliacao({
    this.idAvaliacao,
    this.nota,
    this.date,
    this.comentario,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_avaliacao': idAvaliacao,
      'nota': nota,
      'date': date
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'comentario': comentario,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      idAvaliacao: map['id_avaliacao'],
      nota: map['nota'],
      date: map['date'] != null
          ? DateTime.parse(map['date'])
          : null, // Converte String para DateTime
      comentario: map['comentario'],
    );
  }
}
