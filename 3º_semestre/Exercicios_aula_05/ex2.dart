//. Crie uma classe “Filha” com o tipo de animal pássaro, cachorro, tigre, peixe e o atributo: 
// peso, métodos acordou, dormiu.


class Animal {
  String? nome;
  int? idade;
  String? cor;
  String? raca;
  double? peso; 

 
  void acordou() {
    print("O animal $nome acordou.");
  }

  void dormiu() {
    print("O animal $nome dormiu.");
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


class Passaro extends Animal {
  void voar() {
    print("O pássaro $nome está voando.");
  }
}


class Peixe extends Animal {
  void nadar() {
    print("O peixe $nome está nadando.");
  }
}

void main() {
  // Criando objeto de Cachorro
  Cachorro rocky = Cachorro();
  rocky.nome = "Rocky";
  rocky.idade = 2;
  rocky.cor = "Marrom";
  rocky.raca = "Labrador";
  rocky.peso = 12.5;
  rocky.acordou();
  rocky.latir();
  rocky.dormiu();
  
  // Criando objeto de Tigre
  Tigre memphis = Tigre();
  memphis.nome = "Memphis";
  memphis.idade = 30;
  memphis.cor = "Branco";
  memphis.raca = "Bengal";
  memphis.peso = 250.0;
  memphis.acordou();
  memphis.atacar();
  memphis.dormiu();
  
  // Criando objeto de Pássaro
  Passaro azul = Passaro();
  azul.nome = "Azul";
  azul.idade = 1;
  azul.cor = "Azul";
  azul.raca = "Canário";
  azul.peso = 0.02;
  azul.acordou();
  azul.voar();
  azul.dormiu();
  
  // Criando objeto de Peixe
  Peixe nemo = Peixe();
  nemo.nome = "Nemo";
  nemo.idade = 3;
  nemo.cor = "Laranja";
  nemo.raca = "Palhaço";
  nemo.peso = 0.1;
  nemo.acordou();
  nemo.nadar();
  nemo.dormiu();
}
