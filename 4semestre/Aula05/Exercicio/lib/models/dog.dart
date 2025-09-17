// Cria uma classe chamada para armazenar os dados digitados pelo usuario
class Dog {
  final int? id; // nulo ao criar Autoincrement
  final String nome;
  final int notas;
  final String materia;

  // Cria o construtor

  Dog(
      {this.id,
      required this.nome,
      required this.notas,
      required this.materia});
  // funçao que copia os parametros da classe dog
  Dog copyWith({int? id, String? nome, int? notas, String? materia}) {
    return Dog(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        notas: notas ?? this.notas,
        materia: materia ?? this.materia);
  }

  Map<String, dynamic> toMap() =>
      {'id': id, 'nome': nome, 'notas': notas, 'materia': materia};

  factory Dog.fromMap(Map<String, dynamic> map) => Dog(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      notas: map['notas'] as int,
      materia: map['materia'] as String);
}

//nome, materia, notas