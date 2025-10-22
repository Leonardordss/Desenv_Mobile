import 'package:flutter/material.dart';
import 'package:appiot/telaapp.dart';


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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.05), // Espaço do topo ajustado
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Leonardo e William',
              style: TextStyle(
                fontSize: screenWidth * 0.055, // Tamanho da fonte responsivo
                fontWeight: FontWeight.bold,
                color: const Color(0xFF001F5B),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08,
                  vertical: screenHeight * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.03), // Espaço antes do logo

                    // Logo SENAI
                    Image.asset(
                      'assets/images/logo.jpg',
                      width: screenWidth * 0.4, // Largura do logo responsiva
                    ),

                    SizedBox(height: screenHeight * 0.04), // Espaço após o logo

                    // Botão "Roberto Mange"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF001F5B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                      ),
                      onPressed: () {},
                      child: Text(
                        '"Roberto Mange"',
                        style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // Espaço após o botão "Roberto Mange"

                    // Botão de Play
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF001F5B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.06), // Padding responsivo
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Telaapp()),
                        );
                      },
                      child: Icon(
                        Icons.play_circle_outline,
                        size: screenWidth * 0.12, // Tamanho do ícone responsivo
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // Espaço após o botão de Play

                    // Botão "Controle de Dispositivos"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF001F5B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Controle de Dispositivos',
                        style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

