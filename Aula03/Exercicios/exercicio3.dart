// 3. Crie uma função que calcule o salário líquido do usuário a partir dos valores digitados pelo teclado considerando um desconto de 10% de
// impostos e bonificação de 20% em cima do salário.

import 'dart:io';

void main(){
  double salario_bruto, salario_liquido, desconto, bonificacao;

  print("Digite o salario bruto");

  salario_bruto = double.parse(stdin.readLineSync()!);

  desconto = (salario_bruto*0.10);
  print("Desconto de 10% sobre o salario é: $desconto");

  bonificacao = (salario_bruto*0.20);
  print("Bonificacao de 20% sobre o salario é: $bonificacao");

  salario_liquido = (salario_bruto - desconto + bonificacao);
  print("O salario liquido a receber é: $salario_liquido");

}
