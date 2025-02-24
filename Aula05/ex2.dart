// Exemplo 2 - programação orientada a objeto

class Carro {
  String marca = "Nissan";
  int ano = 2025;

  // Método abrir a porta do carro
  void abrirporta(int nqtde) {
    if (nqtde == 1) {
      print("Porta do motorista aberta");
    } else if (nqtde == 2) {
      print("Porta do motorista e passageiro aberta");
    } else if (nqtde == 3) {
      print("Porta do motorista, passageiro aberta e traseira esquerda");
    } else if (nqtde == 4) {
      print("As 4 portas do veículo estão abertas");
    }
  }

  // Método fechar a porta do carro (corrigido dentro da classe)
  void fecharporta(int nqtde) {
    if (nqtde == 1) {
      print("Porta do motorista fechada");
    } else if (nqtde == 2) {
      print("Porta do motorista e passageiro fechada");
    } else if (nqtde == 3) {
      print("Porta do motorista, passageiro fechada e traseira esquerda");
    } else if (nqtde == 4) {
      print("As 4 portas do veículo estão fechadas");
    }
  }

  // Método ligar o carro
  void liga() {
    print("Carro ligado");
  }

  // Método desligar o carro
  void desliga() {
    print("Carro desligado");
  }
}

void main() {
  // Instancia o objeto Tiida
  Carro Tiida = Carro();

  Tiida.ano = 2022;
  Tiida.marca = "Nissan Tiida";
  Tiida.liga();
  Tiida.abrirporta(1);
  Tiida.fecharporta(1); // Chama o método fecharporta corretamente
  print("Exibe Informações");
  print("${Tiida.marca}");
  print("${Tiida.ano}");
}
