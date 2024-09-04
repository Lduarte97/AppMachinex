class Avaliacao {
  int? id_avaliacao;
  int? nota;
  DateTime? date;
  String? comentario;

  // Construtor - inicializando os valores
  Avaliacao({
    this.id_avaliacao,
    this.nota,
    this.date,
    this.comentario,
  });

  // Método que converte o objeto Avaliacao em um mapa de dados
  Map<String, dynamic> toMap() {
    return {
      'id_avaliacao': id_avaliacao,
      'nota': nota,
      'date': date?.toIso8601String(), // Converte DateTime para String
      'comentario': comentario,
    };
  }

  // Cria um objeto Avaliacao a partir de um Map
  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      id_avaliacao: map['id_avaliacao'],
      nota: map['nota'],
      date: map['date'] != null
          ? DateTime.parse(map['date'])
          : null, // Converte String para DateTime
      comentario: map['comentario'],
    );
  }
}
