
import 'dart:io';

void main(){
  double n1,n2, res;
  print("Digite o primeiro numero");

  n1 = double.parse(stdin.readLineSync()!);

  print("Digite o segundo numero");

  n2 = double.parse(stdin.readLineSync()!);

  res = (n1+n2)/2;
  print("Media: $res");
  if(res>=5){
    print("Aprovado - media $res");
  }
  else{
    print("Reprovado - media: $res");
  }

//recebe o numero digitado pelo usuario e converte de string para double

}