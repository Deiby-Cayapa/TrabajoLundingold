import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menu.dart';
import 'package:flutter_application_1/usuario/usuario.dart';
import 'package:flutter_application_1/service/auth.service.dart'; // Asegúrate de importar correctamente
import 'dart:convert';

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
    if (_formKey.currentState!.validate()) {
      final username = _userController.text.trim();
      final password = _passController.text.trim();

      final response = await AuthService.login(username, password);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final accessToken = data['access'];

        // Aquí podrías guardar el token con SharedPreferences o pasarlo a otra pantalla

        // Éxito: redirigir
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuPage()),
        );
      } else {
        // Fallo: mostrar error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
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
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ), // Fondo azul en toda la pantalla
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                253,
                254,
                255,
              ), // Cuadro de login en amarillo
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(223, 56, 56, 56),
                  blurRadius: 10,
                  offset: Offset(0, 8),
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
                    color: Color.fromARGB(255, 0, 60, 255),
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
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 128, 192),
                        ),
                        backgroundColor: const Color.fromARGB(255, 0, 79, 216),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
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
                        side: const BorderSide(
                          color: Color.fromARGB(255, 0, 13, 255),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Crear un usuario',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(
                            255,
                            0,
                            25,
                            211,
                          ), // Texto en negro
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
