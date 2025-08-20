//Crie um programa que converta valores de reais (R$) para outras moedas de acordo com a escolha do usuário: euro (EUR), dólar (USD),franco suíço (CHF).
//Considere o valor do Euro 7,00
//Dólar 6,56
//Franco Suiço 4,35

import 'dart:io';

void main(){
  double quantia,res; // variaveis para armazenar os valores
  // digitados pelo usuario
  
  var op; // variavel para armazenar a opcao do usuario
print('Euro');
print('Dolar');
print('Franco Suiço');

print("Digite a quantia em Reais");
 quantia = double.parse(stdin.readLineSync()!);

print('Escolha a moeda que deseja converter: ');
op = stdin.readLineSync()!;
switch(op){
  case 'dolar':
  res = quantia*6.56;
  print("O valor convertido em Dólar: $res");
  break;
  case 'euro':
  res = quantia*7.00;
  print("O valor convertido em Euro: $res");
  break;
  case 'franco':
  res = quantia*4.35;
  print("O valor convertido em Franco Suiço: $res");
  break;
  
  }
  
  }