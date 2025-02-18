//  Um posto de combustíveis oferece descontos variados com base no tipo de combustível adquirido e na quantidade comprada. O
//desconto é aplicado diretamente no valor total, e as condições específicas para cada tipo de combustível devem ser consideradas.
//Escreva um programa que:
//1. Solicite ao usuário:
//● A quantidade de litros comprada.
//● O tipo de combustível, sendo:
//■ E para etanol,
//■ D para diesel,
//■ G para gasolina.
//2. Calcule:
//● O valor do desconto utilizando a fórmula:
//desconto = preço do litro × quantidade de litros × percentual de desconto.
//● O valor total a ser pago utilizando a fórmula:
//valor total = (preço do litro × quantidade de litros) - desconto.
//3. Exiba o valor a ser pago pelo cliente.
//Observações:
//● O programa deve tratar corretamente os diferentes tipos de combustíveis.
//● A fórmula do desconto depende do preço do litro e do percentual aplicável para cada combustível.

  import 'dart:io';

void main() {
  double quantia, valorPorLitro, desconto, valorTotal;

  print("Digite a quantidade de Litros comprada:");
  quantia = double.parse(stdin.readLineSync()!);

  // Solicita o tipo de combustível
  print("Digite o tipo de combustível (E para Etanol, D para Diesel, G para Gasolina):");
  var op = stdin.readLineSync()!.toUpperCase();

  switch (op) {
    case 'E': // Etanol
      valorPorLitro = 1.70;
      if (quantia >= 15) {
        desconto = valorPorLitro * quantia * 0.04;
      } else {
        desconto = valorPorLitro * quantia * 0.03;
      }
      break;

    case 'D': // Diesel
      valorPorLitro = 2.00;
      if (quantia >= 15) {
        desconto = valorPorLitro * quantia * 0.05;
      } else {
        desconto = valorPorLitro * quantia * 0.03;
      }
      break;

    case 'G': // Gasolina
      valorPorLitro = 4.50;
      if (quantia >= 20) {
        desconto = valorPorLitro * quantia * 0.03;
      } else {
        desconto = 0;
      }
      break;

    default:
      print("Opção de combustível inválida.");
      return; // Sai do programa se a opção for inválida
  }

  valorTotal = (valorPorLitro * quantia) - desconto;

  print("O valor a ser pago é: R\$ $valorTotal");
}
