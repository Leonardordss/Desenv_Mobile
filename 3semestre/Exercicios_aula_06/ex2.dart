//. 02 Crie duas subclasses concretas de máquina industrial Prensa e Robô solda.
//Prensa deve ter um atributo adicional chamado “Pressão em toneladas” e os métodos ligar 
//e desligar devem exibir mensagens adequadas.
//Robô solda deve ter um atributo chamado tipo de solda(String) para especificar o tipo de 
//solda que realiza. Os métodos ligar e desligar devem exibir mensagens adequadas.

// Classe
abstract class MaquinaIndustrial {
  String nome;
  double potencia;
  bool status;

  // Construtor
  MaquinaIndustrial(this.nome, this.potencia, this.status);

  // Métodos para ligar e desligar
  void Ligar();
  void Desligar();
}

// Subclasse Prensa
class Prensa extends MaquinaIndustrial {
  double pressaoToneladas;

  Prensa(String nome, double potencia, bool status, this.pressaoToneladas)
      : super(nome, potencia, status);

  @override
  void Ligar() {
    print('$nome foi ligada com uma pressão de $pressaoToneladas toneladas e potência de $potencia W.');
    status = true;
  }

  @override
  void Desligar() {
    print('$nome foi desligada. A pressão de $pressaoToneladas toneladas foi desativada.');
    status = false;
  }
}

// Subclasse RoboSolda
class RoboSolda extends MaquinaIndustrial {
  String tipoSolda;

  RoboSolda(String nome, double potencia, bool status, this.tipoSolda)
      : super(nome, potencia, status);

  @override
  void Ligar() {
    print('$nome foi ligada. Realizando solda tipo: $tipoSolda com potência de $potencia W.');
    status = true;
  }

  @override
  void Desligar() {
    print('$nome foi desligado. A solda tipo $tipoSolda foi desativada.');
    status = false;
  }
}

void main() {

  Prensa prensa1 = Prensa('Prensa Hidráulica', 5000.0, false, 50.0);


  RoboSolda robo1 = RoboSolda('Robô de Solda', 2000.0, false, 'MIG');


  prensa1.Ligar();  
  prensa1.Desligar();  


  robo1.Ligar();  
  robo1.Desligar();  
}
