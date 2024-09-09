class Anuncio {
  // Declaração das variáveis da classe com null safety
  int? id_anuncio;
  DateTime? data_da_criacao;
  String? situacao;
  String? tipo_anuncio;
  int? id_usuario;
  int? id_equipamento;

  // Construtor da classe
  Anuncio({
    this.id_anuncio,
    this.data_da_criacao,
    this.situacao,
    this.tipo_anuncio,
    this.id_usuario,
    this.id_equipamento,
  });

  // Método para converter o objeto em um Map
  Map<String, dynamic> toMap() {
    return {
      'id_anuncio': id_anuncio,
      'data_da_criacao': data_da_criacao
          ?.toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'situacao': situacao,
      'tipo_anuncio': tipo_anuncio,
      'id_usuario': id_usuario,
      'id_equipamento': id_equipamento,
    };
  }

  // Método factory para criar um objeto da classe a partir de um Map
  factory Anuncio.fromMap(Map<String, dynamic> map) {
    return Anuncio(
      id_anuncio: map['id_anuncio'],
      data_da_criacao: map['data_da_criacao'] != null
          ? DateTime.parse(map['data_da_criacao'])
          : null, // Converte String para DateTime
      situacao: map['situacao'],
      tipo_anuncio: map['tipo_anuncio'],
      id_usuario: map['id_usuario'],
      id_equipamento: map['id_equipamento'],
    );
  }
}
