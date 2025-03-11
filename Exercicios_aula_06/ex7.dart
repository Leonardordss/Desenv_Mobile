//. 07 Crie uma classe concreta “Carro” implementando os métodos abstratos exibindo 
// mensagens adequadas

// Classe abstrata Automoveis
abstract class Automoveis {
  String nome;
  String cor;
  int ano;
  bool status; // Atributo de status

  // Construtor
  Automoveis(this.nome, this.cor, this.ano, this.status);

  // Métodos abstratos
  void Ligar();
  void Desligar();
  void Colocar_cinto();
  void Dirigir();
}

// Classe que herda
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

void main() {
  // Criando objeto
  Carro meuCarro = Carro('Fusca', 'Azul', 1985, false);
  
  // Usando os métodos do carro
  meuCarro.Ligar();
  meuCarro.Colocar_cinto();
  meuCarro.Dirigir();
  meuCarro.Desligar();
}
