// lib/data/user_data.dart

class UserData {
  static String? nome;
  static String? email;
  static String? senha;

  static bool isRegistered(String emailInput, String senhaInput) {
    return emailInput == email && senhaInput == senha;
  }

  static bool get isUserRegistered => email != null && senha != null;
}