// funcao com parametro obrigatorio

void criarUsuario(int? idade,{required String nome} ){
  print("Nome: $nome e idade: $idade");

}

void main(){
  criarUsuario(37, nome: "Leonardo");

}