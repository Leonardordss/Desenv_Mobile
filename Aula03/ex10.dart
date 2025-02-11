// funcao com parametro obrigatorio

void criarUsuario({required String nome, int? idade}){
  print("Usuario: $nome. idade: $idade");

}

void main(){
  criarUsuario(nome: "Leonardo", idade:37);

}