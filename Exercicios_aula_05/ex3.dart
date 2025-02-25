//Crie uma classe denominada “Máquinas” com os seguintes atributos:
//Nome da máquina
//Quantidade de eixos
//Rotações por minuto
//Consumo de energia elétrica
//Essa classe deve ser a mãe de outras classes.
//Criar classe denominada furadeira herdando o nome da máquina, rotações por minuto, 
//consumo de energia elétrica.
//Criar métodos para ligar, desligar a máquina e um método para ajustar a velocidade de 
//rotação da máquina.


// Classe mãe Máquinas
class Maquina {
  String? nomeDaMaquina;
  int? quantidadeDeEixos;
  int? rotacoesPorMinuto;
  double? consumoDeEnergia;

  // Método para ligar a máquina
  void ligar() {
    print("A máquina $nomeDaMaquina foi ligada.");
  }

  // Método para desligar a máquina
  void desligar() {
    print("A máquina $nomeDaMaquina foi desligada.");
  }


  void ajustarVelocidade(int novaRotacao) {
    rotacoesPorMinuto = novaRotacao;
    print("A velocidade da máquina $nomeDaMaquina foi ajustada para $novaRotacao rotações por minuto.");
  }
}


class Furadeira extends Maquina {
  Furadeira(String nome, int rotacoes, double consumo) {
    nomeDaMaquina = nome;
    rotacoesPorMinuto = rotacoes;
    consumoDeEnergia = consumo;
    quantidadeDeEixos = 1; 
  }

  void perfurar() {
    print("A furadeira $nomeDaMaquina está perfurando.");
  }
}

void main() {

  Furadeira furadeira = Furadeira("Furadeira Elétrica", 1500, 1.2);
  
  // Usando os métodos da máquina
  furadeira.ligar();
  furadeira.ajustarVelocidade(2000); // Ajustando a velocidade da furadeira
  furadeira.perfurar(); // A furadeira realizando sua função
  furadeira.desligar();
}
