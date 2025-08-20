// Crie um programa que receba 4 valores numéricos digitados pelo usuário. Em seguida, permita que o usuário escolha a
//operação que deseja realizar entre as seguintes opções: soma (+), subtração (-), multiplicação (*) e divisão (/).

import 'dart:io';

void main(){
  double n1, n2,res; // variaveis para armazenar os valores
  // digitados pelo usuario
  var op,ch; // variavel para armazenar a opcao do usuario
  do{
print('+ - soma');
print('- subtracao');
print('* - multiplicacao');
print('/ - dividir');
print("Digite o numero n1");
n1 = double.parse(stdin.readLineSync()!);
print("Digite o numero n2");
n2 = double.parse(stdin.readLineSync()!);
print('Escolha a operacao desejada: ');
op = stdin.readLineSync()!;
switch(op){
  case '+':
  res = n1+n2;
  print("Resultado: $res");
  break;
  case '-':
  res = n1-n2;
  print("Resultado: $res");
  break;
  case '*':
  res = n1*n2;
  print("Resultado: $res");
  break;
  case '/':
  if(n2!=0){
  res = n1/n2;
  print("Resultado: $res");
  }
  else{
    print("Divisao por zero tende ao infinito,\n digite um valor para n2");
  }
  
  break;
  default: print("Operacao invalida");
}

print("Deseja continuar ? ");
ch = stdin.readLineSync()!;
  }while(ch!='n');
}