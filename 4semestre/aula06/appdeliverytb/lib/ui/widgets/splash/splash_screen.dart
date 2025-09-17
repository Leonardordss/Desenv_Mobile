import 'package:appdeliverytb/ui/_core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:appdeliverytb/ui/widgets/cadastro/cadastro_screen.dart';
import 'package:appdeliverytb/ui/widgets/home/home_Screen.dart';
import 'package:appdeliverytb/data/user_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void _fazerLogin() {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (!UserData.isUserRegistered) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Você precisa se cadastrar primeiro')),
      );
      return;
    }

    if (UserData.isRegistered(email, senha)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('E-mail ou senha incorretos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/banners/banner_splash.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png', width: 192),
                    SizedBox(height: 32),
                    Column(
                      children: [
                        Text(
                          'Um parceiro inovador para sua',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          'Melhor experiência culinária',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 32),

                        // LOGIN FORM
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: senhaController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),

                        // Botão "Entrar"
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _fazerLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                            ),
                            child: Text('Entrar'),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Botão "Cadastrar-se"
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CadastroScreen()),
                              );
                            },
                            child: Text(
                              'Cadastrar-se',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
