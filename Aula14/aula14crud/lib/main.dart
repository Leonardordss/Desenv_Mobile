import 'package:aula14crud/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white, // cor de fundo
      primarySwatch: Colors.red // cor de texto
    ),
    home: Login(),
  ));
}

