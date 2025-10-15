// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appdeliverytb/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// Tela de produtos nova

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Prodscreen2 extends StatefulWidget {
  const Prodscreen2({super.key});

  @override
  State<Prodscreen2> createState() => _Prodscreen2State();
}

class _Prodscreen2State extends State<Prodscreen2> {

  final String baseUrl = "http://10.109.83.10:8000/api/produtos";
  

  @override
  void initState(){
    super.initState();
    leituradados();
  }

  // Lista de produtos
  List<Map<String,dynamic>> dado=[];

  Future<void> leituradados()async{
    final resp = await http.get(Uri.parse(baseUrl));

    if(resp.statusCode==200){
      final lista = (jsonDecode(resp.body) as List<dynamic>).cast<Map<String,dynamic>>();
      setState(() {
        dado = lista;
      });
    }else{
      throw Exception('Falha ao consumir API (${resp.statusCode})');
    }

  }

  // Função para atualizar os produtos

  Future<void> _atualizarProduto({
    required int id,
    required String nome,
    required double preco,
    required int quantidade
  })async{

    final url = Uri.parse("$baseUrl$id/");
    final body = jsonEncode({
      "nome":""
    })
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
