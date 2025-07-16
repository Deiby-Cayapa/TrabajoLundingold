class AuthManager {
  // Lista de usuarios registrados (en memoria)
  static final List<Map<String, String>> _users = [
    {'user': 'admin', 'password': '1234'},
  ];

  // Registrar nuevo usuario
  static bool registerUser({
    required String firstName,
    required String lastName,
    required String user,
    required String password,
    required String email,
  }) {
    if (_users.any((u) => u['user'] == user)) {
      return false;
    }

    _users.add({
      'firstName': firstName,
      'lastName': lastName,
      'user': user,
      'password': password,
      'email': email,
    });

    return true;
  }

  // Validar login
  static bool validateLogin(String user, String password) {
    return _users.any((u) => u['user'] == user && u['password'] == password);
  }

  // Obtener lista (opcional)
  static List<Map<String, String>> get users => _users;
}
