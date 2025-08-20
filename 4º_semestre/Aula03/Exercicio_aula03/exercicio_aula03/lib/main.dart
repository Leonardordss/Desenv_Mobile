import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(TelaHome());
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 03 App Sharedpreferences',
      home: TelaApp(),
    );
    
  } 
    
   
}

class TelaApp extends StatefulWidget {
  const TelaApp({super.key});

  @override
  State<TelaApp> createState() => _TelaAppState();
}

class _TelaAppState extends State<TelaApp> {
  final _ctrlNome = TextEditingController(); // Variavel para armazenar o que o usuario digita
  final _ctrlEndereco = TextEditingController();
  final _ctrlIdade = TextEditingController();
  String _nomeSalvo =""; // Variavel para pegar informações do banco de dados

  static const String _kUsernames = 'usernames';
  bool _existeUsername = false;
  // Cria uma lista para armazenar os nomes
  List<String> _nomes =[];
  @override
  void initState(){
    super.initState();
    _carregarNome();
  }

  @override
  // Função monitorar o texteditcontroller
  void dispose(){
    _ctrlNome.dispose();
    _ctrlEndereco.dispose();
    _ctrlIdade.dispose();
    super.dispose();
  }

  // Função para salvar o nome 
  Future<void> _salvarNome()async{
    // Faz a leitura do Sharedpreferences
    final prefs =await SharedPreferences.getInstance();
    final nome = _ctrlNome.text.trim(); // trim remove os espaços em branco
    final endereco = _ctrlEndereco.text.trim();
    final idade = _ctrlIdade.text.trim();
    final String userData = '$nome|$endereco|$idade'; // Combine data into a single string

    final atuais = prefs.getStringList(_kUsernames)??[];
    if(atuais.contains(userData)){
      _snack('Esse usuário já está na lista');
      return;
    }
    atuais.add(userData); // atualiza a lista de nomes
    await prefs.setStringList(_kUsernames, atuais); // salva a informaçao
     setState(() => _nomes = List<String>.from(atuais));
     _ctrlNome.clear(); // limpa o campo texto
     _ctrlEndereco.clear();
     _ctrlIdade.clear();

    
    _snack('Usuário salvo com sucesso !');
    


  }
  // Função para carregar o nome no aplicativo

  Future<void> _carregarNome()async{
    // realiza a leitura do que está armazenado
    final prefs = await SharedPreferences.getInstance();
    setState(()=> _nomes = prefs.getStringList(_kUsernames)??[]);
     

  }

  // Função para remover um nome
  Future<void> _removerNome(String userData)async{
    final prefs = await SharedPreferences.getInstance();
    final atuais =  prefs.getStringList(_kUsernames)?? [];
    atuais.remove(userData);
    await prefs.setStringList(_kUsernames, atuais);
    setState(() =>_nomes =List<String>.from(atuais));
    final parts = userData.split('|');
    final nome = parts[0];
    _snack('Removido $nome');
      
    

  }

Future<void> _limparTudo()async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_kUsernames);
  setState(() => _nomes=[]);

}
  // Cria a função da snack
  void _snack(String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: 
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Digite um nome, endereço e idade e salve localmente com SharedPreferences',
            style: TextStyle(fontSize: 16),),
            SizedBox(height: 12,),
            TextField(
              controller: _ctrlNome,
              decoration: InputDecoration(labelText: 'Nome',
              border: OutlineInputBorder(),
               ),
               textInputAction: TextInputAction.next,
              
            ),
            SizedBox(height: 12,),
            TextField(
              controller: _ctrlEndereco,
              decoration: InputDecoration(labelText: 'Endereço',
              border: OutlineInputBorder(),
               ),
               textInputAction: TextInputAction.next,
              
            ),
            SizedBox(height: 12,),
            TextField(
              controller: _ctrlIdade,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Idade',
              border: OutlineInputBorder(),
               ),
               textInputAction: TextInputAction.done,
               onSubmitted: (_) => _salvarNome() ,
              
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(onPressed: _salvarNome,icon: Icon(Icons.save),
                  label: Text('Salvar'),)),
                  SizedBox(height: 8,),
                  Expanded(
                    child: OutlinedButton.icon(onPressed: _carregarNome, icon: Icon(Icons.refresh),
                    label: Text('Carregar'))),
                    SizedBox(height: 8,),
                    Expanded(child: OutlinedButton.icon(
                      onPressed:_nomes.isEmpty? null: _limparTudo,icon: Icon(Icons.delete), 
                      label: Text('Remover')))
              ],
            ),
            SizedBox(height: 16,),
            Expanded(
              child: _nomes.isEmpty?
              const Center(
                child: Text('Sem usuários salvos'),
              ):ListView.separated(
                itemCount: _nomes.length,
                separatorBuilder: (_,__)=>const Divider(height: 1,),
                itemBuilder: (context,i){
                  final userData = _nomes[i];
                  final parts = userData.split('|');
                  final nome = parts[0];
                  final endereco = parts[1];
                  final idade = parts[2];
                  return Dismissible(
                    key: ValueKey(userData),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete),
                    ),
                      secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete),
                                           ),
                     onDismissed: (__)=>_removerNome(userData),
                     child: ListTile(
                      leading: CircleAvatar(
                        child: Text(nome.isNotEmpty? nome[0].toUpperCase():'?'),
                      ),
                      title: Text('$nome, $idade anos'),
                      subtitle: Text(endereco),
                      trailing: IconButton(
                        onPressed: ()=>_removerNome(userData), icon: Icon(Icons.delete)),
                     ),
                     
                     
                     );
                     

                },
                )

              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text('Total: ${_nomes.length}'),
              )
            
                    
                  ],
                ),
              ),
    );
  }
}


