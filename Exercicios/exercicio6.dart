// Crie um programa que receba a idade de duas pessoas e print na tela qual é a pessoa mais velha.

import 'dart:io';

void main(){
  double n1,n2;
  print("Digite a idade da primeira pessoa");

  n1 = double.parse(stdin.readLineSync()!);

  print("Digite a idade da segunda pessoa");

  n2 = double.parse(stdin.readLineSync()!);

  if(n1>n2){
    print("A primeira pessoa é a mais velha");
  }
  else if(n1<n2){
    print("A segunda pessoa é a mais velha");
  }
  else if(n1==n2){
    print("As duas pessoas tem a mesma idade");
  }

}