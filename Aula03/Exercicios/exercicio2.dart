// 2. Crie uma função que calcule a área de um triângulo a partir de dados digitados pelo usuário. A = (b* h)/2 e retorne esse valor.

import 'dart:io';

void main(){
  double base, altura, area, res;
  print("Digite a base");

  base = double.parse(stdin.readLineSync()!);

  print("Digite a altura");

  altura = double.parse(stdin.readLineSync()!);

  print("Digite a area");

  area = double.parse(stdin.readLineSync()!);

  res = (base*altura)/2;
  print("A area do triangulo é: $res");

}
