import 'dart:io';
import 'dart:ffi';

void main(){

  print("Digite o primeiro numero");

  double num1 = double.parse(stdin.readLineSync()!);

  print("Digite o primeiro numero");

  double num2 = double.parse(stdin.readLineSync()!);

  double res = num1 * num2;

  print("Res = $res");

}