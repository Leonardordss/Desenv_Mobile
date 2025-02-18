// Crie um programa que receba a nota de dois alunos, calcule sua média e informe se o aluno está aprovado ou reprovado conforme a média.
//Se média for maior ou igual a 7: Aprovado.
//Maior ou igual a 4 e menor do que 7: Exame.
//Menor do que 4: Reprovado.


import 'dart:io';

void main(){
  double n1,n2, res;
  print("Digite a primeira nota");

  n1 = double.parse(stdin.readLineSync()!);

  print("Digite a segunda nota");

  n2 = double.parse(stdin.readLineSync()!);

  res = (n1+n2)/2;
  print("Media: $res");
  if(res>=7){
    print("Você está Aprovado - media $res");
  }
  else if(res>=4){
    print("Você ficou de Exame - media $res");
  }
  else{
    print("Você está Reprovado - media: $res");
  }

}