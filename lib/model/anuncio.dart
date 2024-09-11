class Anuncio {
  int? id_Anuncio;
  DateTime? date;
  String? situacao;
  String? tipoAnuncio;

  // Construtor da classe
  Anuncio({
    this.id_Anuncio,
    this.date,
    this.situacao,
    this.tipoAnuncio,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_anuncio': id_Anuncio,
      'date': date
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'situacao': situacao,
      'tipo_anuncio': tipoAnuncio,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Anuncio.fromMap(Map<String, dynamic> map) {
    return Anuncio(
      id_Anuncio: map['id_anuncio'],
      date: map['date'] != null
          ? DateTime.parse(map['date'])
          : null, // Converte String para DateTime
      situacao: map['situacao'],
      tipoAnuncio: map['tipo_anuncio'],
    );
  }
}
