// Crie uma classe denominada “Produtos” com os seguintes parâmetros:
//Nome do produto
//Quantidade
//Preço do produto
//Tipo de comunicação
//Consumo de energia elétrica
//Essa classe de produtos deve ser a mãe de outras classes como 
//fritadeira, televisão, ar-condicionado.
//As classes filhas devem possuir os seguintes métodos – Ligar, desligar, ajuste de temperatura com passagem de parâmetros para setpoint.


class Produtos {
  String? nomeProduto;
  int? quantidade;
  double? precoProduto;
  String? tipoDeComunicacao;
  double? consumoDeEnergia;

  // Método para ligar o produto
  void ligar() {
    print("O produto $nomeProduto foi ligado.");
  }

  // Método para desligar o produto
  void desligar() {
    print("O produto $nomeProduto foi desligado.");
  }
}


class Fritadeira extends Produtos {
  double? temperatura; // ajuste na fritadeira

  Fritadeira(String nome, int quantidade, double preco, String comunicacao, double energia) {
    nomeProduto = nome;
    quantidade = quantidade;
    precoProduto = preco;
    tipoDeComunicacao = comunicacao;
    consumoDeEnergia = energia;
  }


  void ajusteTemperatura(double setPoint) {
    temperatura = setPoint;
    print("A temperatura da fritadeira $nomeProduto foi ajustada para $setPoint°C.");
  }
}


class Televisao extends Produtos {
  Televisao(String nome, int quantidade, double preco, String comunicacao, double energia) {
    nomeProduto = nome;
    quantidade = quantidade;
    precoProduto = preco;
    tipoDeComunicacao = comunicacao;
    consumoDeEnergia = energia;
  }

 
  void mudarCanal(int canal) {
    print("O canal da televisão $nomeProduto foi alterado para o canal $canal.");
  }
}


class ArCondicionado extends Produtos {
  double? temperatura; // ajuste no ar-condicionado

  ArCondicionado(String nome, int quantidade, double preco, String comunicacao, double energia) {
    nomeProduto = nome;
    quantidade = quantidade;
    precoProduto = preco;
    tipoDeComunicacao = comunicacao;
    consumoDeEnergia = energia;
  }


  void ajusteTemperatura(double setPoint) {
    temperatura = setPoint;
    print("A temperatura do ar-condicionado $nomeProduto foi ajustada para $setPoint°C.");
  }
}

void main() {
  
  Fritadeira fritadeira = Fritadeira("Fritadeira Elétrica", 1, 250.0, "Manual", 1500.0);
  fritadeira.ligar();
  fritadeira.ajusteTemperatura(180); // Ajusta temperatura da fritadeira
  fritadeira.desligar();

  
  Televisao tv = Televisao("Smart TV", 2, 1200.0, "Wi-Fi", 100.0);
  tv.ligar();
  tv.mudarCanal(5); // canal da televisão
  tv.desligar();

 
  ArCondicionado ar = ArCondicionado("Ar-Condicionado Split", 3, 2000.0, "Remoto", 1500.0);
  ar.ligar();
  ar.ajusteTemperatura(22); // temperatura do ar-condicionado
  ar.desligar();
}
