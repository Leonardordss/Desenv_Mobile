import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/menu_item.dart';

class ApiService {

  static const String _baseUrl = 'http://192.168.15.157:8080/api'; 
  final _storage = const FlutterSecureStorage();

  Future<String?> _getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> _saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }

  Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Após o registro, faz o login automaticamente
      return await login(username, password);
    } else {
      throw Exception('Falha ao registrar: ${jsonDecode(response.body)}');
    }
  }

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveToken(data['token']);
      return true;
    } else {
      throw Exception('Falha no login: ${jsonDecode(response.body)}');
    }
  }

  Future<List<MenuItem>> fetchMenuItems() async {
    final token = await _getToken();
    if (token == null) {
      throw Exception('Usuário não autenticado');
    }

    final response = await http.get(
      Uri.parse('$_baseUrl/menu/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar o cardápio');
    }
  }

  Future<Map<String, dynamic>> fetchAddressByCep(String cep) async {
    final response = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cep/json/'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      if (data.containsKey('erro')) {
        throw Exception('CEP não encontrado');
      }
      return data;
    } else {
      throw Exception('Falha ao consultar o ViaCEP');
    }
  }
}
