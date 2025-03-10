//POLIMORFISMO // Permite numa classe ter varios objetos para formar uma superclasse

//Classe pai

class Animal {
  void fazerSom() {
    print("O animal faz um som");
  }
}

//Cria a classe filha

class Cachorro extends Animal {
  // polimorfismo
  @override
  void fazerSom() {
    print("O cachorro late: Au Au");
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print("O gato mia");
  }
}

void main() {
  Animal meuanimal = Cachorro();
  meuanimal.fazerSom();
  Animal meuanimal1 = Gato();
  meuanimal1.fazerSom();
}
