//. Crie uma classe mãe chamada “Animal” com os atributos:
//String nome, int idade, String cor, String raça.

class Animal {
  String? nome;
  int? idade;
  String? cor;
  String? raca;

  void dormir() {
    print("O animal $nome está dormindo.");
  }
}

class Cachorro extends Animal {
  void latir() {
    print("O cachorro $nome está latindo.");
  }
}

class Tigre extends Animal {
  void atacar() {
    print("O tigre $nome atacou!");
  }
}

void main() {
  Cachorro rocky = Cachorro();
  rocky.nome = "Rocky";
  rocky.idade = 2;
  rocky.cor = "Marrom";
  rocky.raca = "Labrador";
  rocky.latir();
  rocky.dormir();

  Tigre memphis = Tigre();
  memphis.nome = "Memphis";
  memphis.idade = 30;
  memphis.cor = "Branco";
  memphis.raca = "Bengal";
  memphis.atacar();
}
