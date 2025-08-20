// Importando a bibliotec dart:io

import 'dart:io';

// Função principal do codigo

void main(){

print("Digite seu nome"); // Exibe a mensagem no terminal

// digite o seu nome
// null safety
// so ira converter o dado se a entrada nao for vazia

String nome = stdin.readLineSync()!;

print("Digite sua idade");

String idade = stdin.readLineSync()!;

print("Seu nome é $nome e a sua idade é $idade");

}