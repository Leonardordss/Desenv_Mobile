//. 05 Crie uma classe chamada “Carro” herdando características da classe abstrata 
//“Automóveis”.


// Classe
abstract class Automoveis {
  String nome;
  String cor;
  int ano;

  // Construtor
  Automoveis(this.nome, this.cor, this.ano);
}

// Classe que herda
class Carro implements Automoveis {
  @override
  String nome;
  @override
  String cor;
  @override
  int ano;

  Carro(this.nome, this.cor, this.ano);
}
