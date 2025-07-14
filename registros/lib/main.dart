import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menu.dart';
import 'package:flutter_application_1/usuario/usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login() async {
    if (_obscurePassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Credenciales incorrectas')));
    }
  }

  void _goToCreateUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateUserPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Fondo azul en toda la pantalla
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.yellow, // Cuadro de login en amarillo
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            width: 350,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _userController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (value) => value!.isEmpty ? 'Ingrese su usuario' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Ingrese su contraseña' : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.blueAccent),
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ), // Texto en negro
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Botón "Crear usuario"
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _goToCreateUser,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Crear un usuario',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Texto en negro
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
