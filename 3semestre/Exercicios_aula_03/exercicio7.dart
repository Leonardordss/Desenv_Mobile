// Crie um programa que receba o valor médio de três modelos de carro e indique qual é mais caro e o mais barato.

import 'dart:io';

void main() {
  double valorCarro1, valorCarro2, valorCarro3;

  print("Digite o valor médio do primeiro carro:");
  valorCarro1 = double.parse(stdin.readLineSync()!);

  print("Digite o valor médio do segundo carro:");
  valorCarro2 = double.parse(stdin.readLineSync()!);

  print("Digite o valor médio do terceiro carro:");
  valorCarro3 = double.parse(stdin.readLineSync()!);

  double maisCaro = valorCarro1;
  double maisBarato = valorCarro1;

  if (valorCarro2 > maisCaro) {
    maisCaro = valorCarro2;
  }
  if (valorCarro3 > maisCaro) {
    maisCaro = valorCarro3;
  }

  if (valorCarro2 < maisBarato) {
    maisBarato = valorCarro2;
  }
  if (valorCarro3 < maisBarato) {
    maisBarato = valorCarro3;
  }
  
  print("O carro mais caro custa: R\$ $maisCaro");
  print("O carro mais barato custa: R\$ $maisBarato");
}
