//. 06  Crie métodos abstratos na classe abstrata como colocar o cinto, ligar o carro, desligar o
// carro e dirigir

// Classe abstrata Automoveis
abstract class Automoveis {
  String nome;
  String cor;
  int ano;
  bool status;

  // Construtor
  Automoveis(this.nome, this.cor, this.ano, this.status);

  // Métodos abstratos
  void Ligar();
  void Desligar();
  void Colocar_cinto();
  void Dirigir();
}

// Classe que herda de Automoveis
class Carro extends Automoveis {
  // Construtor
  Carro(String nome, String cor, int ano, bool status)
      : super(nome, cor, ano, status);

      @override
  void Ligar() {
    print('$nome foi ligado.');
    status = true;
  }

  @override
  void Desligar() {
    print('$nome foi desligado.');
    status = false;
  }

  @override
  void Colocar_cinto() {
    print('$nome: Colocando o cinto de segurança.');
  }

  @override
  void Dirigir() {
    if (status) {
      print('$nome está ligado e com o cinto. Pode dirigir!');
    } else {
      print('$nome não está ligado. Não é possível dirigir.');
    }
  }
}

