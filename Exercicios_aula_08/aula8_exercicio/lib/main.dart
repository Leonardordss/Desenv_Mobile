// biblioteca sempre necessaria para criar os Widgets para o Android
import 'package:flutter/material.dart';

// funçao principal do codigo do aplicativo
void main() {
  runApp(TelaApp());
}

// cria uma classe do tipo Stateless
class TelaApp extends StatelessWidget {
  const TelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App aula 08"),
          backgroundColor: Colors.green,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _cont extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
}

class _HomeState extends State<Home> {
  String? _msg; // cria uma variavel chamada _msg
  // função para exibir mensagem
  _exibemsg() {
    // setState função que gerencia o estado do aplicativo para atualizar
    // as saidas na tela do aplicativo
    setState(() {
      _msg = "Senai";
    });
  }

  // função para limpar o campo de mensagem
  _limpar() {
    setState(() {
      _msg = "";
    });
  }

  _exibemsg2() {
    setState(() {
      _msg = "Leonardo";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.center,
              width: 200, height: 50, color: Colors.red,
              // ${_msg} acessa o conteudo da variavel _msg
              child: Text(
                "${_msg}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.center,
              width: 200, height: 50, color: Colors.green,
              // ${_msg} acessa o conteudo da variavel _msg
              child: Text(
                "${_msg}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _exibemsg, child: Text("Exibir ")),
              TextButton(onPressed: _limpar, child: Text("Limpar")),
              IconButton(onPressed: _exibemsg2, icon: Icon(Icons.mail)),
            ],
          )
        ],
      ),
    );
  }
}
