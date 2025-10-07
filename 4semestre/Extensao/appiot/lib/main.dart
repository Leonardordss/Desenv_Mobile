import 'package:flutter/material.dart';
import 'tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SENAI App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo SENAI
            Image.asset(
  'assets/images/logo.jpg',
  width: 150,
),

            const SizedBox(height: 20),

            // Botão "Roberto Mange"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001F5B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                '“Roberto Mange”',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Botão de Play
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001F5B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24),
              ),
              onPressed: () {// Navegar para a segunda tela
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Tela2()),
    );
  },
  child: const Icon(
    Icons.play_circle_outline,
    size: 50,
    color: Colors.white,
              
              ),
            ),
            const SizedBox(height: 20),

            // Botão "Controle de Dispositivos"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001F5B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                'Controle de Dispositivos',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
