//. 01 Crie uma classe abstrata “Máquina industrial” com os seguintes métodos:
//Nome – Nome da máquina
//Potência da máquina
//Status – booleano
//Métodos abstratos
//Ligar() – Um método abstrato que define como a máquina é ligada
//Desligar () – Método abstrato que define como a máquina é desligada


// Classe abstrata MaquinaIndustrial
abstract class MaquinaIndustrial {
  String nome;
  double potencia;
  bool status;

  // Construtor
  MaquinaIndustrial(this.nome, this.potencia, this.status);

  // Métodos abstratos 
  void Ligar();
  void Desligar();
}

// Classe que herda
class Maquina1 implements MaquinaIndustrial {
  @override
  String nome;
  @override
  double potencia;
  @override
  bool status;

  Maquina1(this.nome, this.potencia, this.status);

  @override
  void Ligar() {
    print('$nome foi ligada com potência de $potencia W.');
    status = true;
  }

  @override
  void Desligar() {
    print('$nome foi desligada.');
    status = false;
  }
}

void main() {
  
  Maquina1 maquina1 = Maquina1('Máquina de Corte', 1500.0, false);

  // Ligando e desligando
  maquina1.Ligar();  
  maquina1.Desligar();  
}
