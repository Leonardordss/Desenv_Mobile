//Importa biblioteca dart:io

import 'dart:io';

void main(){

  print("Digite o primeiro numero");

var num1 = stdin.readLineSync()!; // quando usa uma variavel o int.parse tem que ser usado em outro local conforme exemplo abaixo

print("Digite o segundo numero");

var num2 = stdin.readLineSync()!;

var res = int.parse(num1) + int.parse(num2);

print("Resultado = $res");

}