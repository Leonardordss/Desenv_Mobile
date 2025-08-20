//Funcao Assincrona - atraso de uma resposta simulando uma api


Future<void> carregarDados()async{
  print("Carregando");
  await Future.delayed(Duration(seconds: 2));
  print("Dados carregados");

}

void main()async{
  await carregarDados();

}