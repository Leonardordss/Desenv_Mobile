// Escreva um programa que calcule o preço a pagar pelo fornecimento de energia elétrica.
//● Pergunte para o usuário a quantidade de kWh consumida e o tipo de instalação: Residência (R), Indústrias (I), Comércio (C).
//● Calcule o preço da energia com base na tabela a seguir.
//● O preço a pagar pelo fornecimento da energia elétrica deve ser calculado preço unitário do KWh * quantidade de KWh inserido
//pelo usuário

//Residencial = Faixa(kwh) até 500 = preço 0,50. Acima de 500 = 0,70

//Comercial = Faixa(kwh) até 1000 = preço 0,65. Acima de 1000 = 0,60

//Industrial = Faixa(kwh) até 5000 = preço 0,55. Acima de 5000 = 0,50

import 'dart:io';

void main() {
  // Solicita a quantidade de kWh consumida
  print("Digite a quantidade de kWh consumida:");
  double kWh = double.parse(stdin.readLineSync()!);

  // Solicita o tipo de instalação
  print("Digite o tipo de instalação (R para Residencial, I para Industrial, C para Comercial):");
  String tipoInstalacao = stdin.readLineSync()!.toUpperCase();

  double precoUnitario = 0.0;
  
  
  if (tipoInstalacao == 'R') {
    if (kWh <= 500) {
      precoUnitario = 0.50;
    } else {
      precoUnitario = 0.70;
    }
  } else if (tipoInstalacao == 'C') {
    if (kWh <= 1000) {
      precoUnitario = 0.65;
    } else {
      precoUnitario = 0.60;
    }
  } else if (tipoInstalacao == 'I') {
    if (kWh <= 5000) {
      precoUnitario = 0.55;
    } else {
      precoUnitario = 0.50;
    }
  } else {
    print("Tipo de instalação inválido.");
    return; // Encerra o programa se o tipo for inválido
  }

  double valorTotal = precoUnitario * kWh;

  print("O valor a ser pago pelo fornecimento de energia elétrica é: R\$ $valorTotal");
}
