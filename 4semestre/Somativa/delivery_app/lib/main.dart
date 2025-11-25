import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/confirmation_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWrapper(),
        '/menu': (context) => const MenuScreen(),
        '/cart': (context) => const CartScreen(),
        '/confirm': (context) => const ConfirmationScreen(),
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isLoggedIn = false;
  bool _showRegister = false;

  void _handleLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
      _showRegister = false;
    });
  }

  void _handleNavigateToRegister() {
    setState(() {
      _showRegister = true;
    });
  }

  void _handleRegisterSuccess() {
    // Após o registro, volta para a tela de login
    setState(() {
      _showRegister = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return const MenuScreen();
    } else if (_showRegister) {
      return RegisterScreen(onRegisterSuccess: _handleRegisterSuccess);
    } else {
      return LoginScreen(
        onLoginSuccess: _handleLoginSuccess,
        onNavigateToRegister: _handleNavigateToRegister,
      );
    }
  }
}
