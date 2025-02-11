// 3. Crie uma função que calcule o salário líquido do usuário a partir dos valores digitados pelo teclado considerando um desconto de 10% de
// impostos e bonificação de 20% em cima do salário.

import 'dart:io';

void main(){
  double salario_bruto, salario_liquido, desconto, bonificacao;

  print("Digite o salario bruto");

  salario_bruto = double.parse(stdin.readLineSync()!);

  desconto = (salario_bruto - (salario_bruto*0.10));
  print("O salario bruto com desconto de 10% é: $desconto");

  bonificacao = (salario_bruto + (salario_bruto*0.20));
  print("O salario bruto com bonificacao de 20% é: $bonificacao");

  salario_liquido = (salario_bruto - desconto + bonificacao);
  print("O salario liquido a receber é: $salario_liquido");

}
