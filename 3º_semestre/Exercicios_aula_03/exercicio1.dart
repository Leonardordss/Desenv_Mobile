//1. Crie uma função que receba as informações de um usuário digitado pelo teclado: Nome, Curso, Idade.

import 'dart:io';

void main(){
  int idade;
  String nome;
  String curso;

  print("Digite sua idade");
  idade = int.parse(stdin.readLineSync()!);

  print("Digite seu nome");
  nome = stdin.readLineSync()!;

  print("Digite seu Curso");
  curso = stdin.readLineSync()!;

  print("Nome: $nome");
  print("Idade: $idade");
  print("Curso: $curso");
}
