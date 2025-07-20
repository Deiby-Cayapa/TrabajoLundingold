class AuthManager {
  // Lista de usuarios registrados (en memoria)
  static final List<Map<String, String>> _users = [
    {'user': 'admin', 'password': '1234'}, // Ejemplo inicial
  ];

  // Método para registrar nuevo usuario
  static bool registerUser({
    required String firstName,
    required String lastName,
    required String user,
    required String password,
    required String email,
  }) {
    // Validar si el usuario ya existe
    if (_users.any((u) => u['user'] == user)) {
      return false; // Usuario ya existe
    }

    users.add({
      'firstName': firstName,
      'lastName': lastName,
      'user': user,
      'password': password, // ¡En producción usa encriptación!
      'email': email,
    });
    return true;
  }

  // Método para validar login
  static bool validateLogin(String user, String password) {
    return _users.any((u) => u['user'] == user && u['password'] == password);
  }

  // Obtener todos los usuarios (opcional)
  static List<Map<String, String>> get users => _users;
}
