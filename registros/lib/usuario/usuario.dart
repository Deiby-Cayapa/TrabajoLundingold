import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _isLoading = false; // Para controlar el estado de carga
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Usuario'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.yellow,
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
                  const Icon(Icons.person_add, size: 60, color: Colors.blue),
                  const SizedBox(height: 10),
                  const Text(
                    'Registro',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  // Primer Nombre
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Primer Nombre',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (value) => value!.isEmpty ? 'Ingrese su nombre' : null,
                  ),
                  const SizedBox(height: 20),
                  // Primer Apellido
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Primer Apellido',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Ingrese su apellido' : null,
                  ),
                  const SizedBox(height: 20),
                  // Usuario
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
                        (value) => value!.isEmpty ? 'Ingrese un usuario' : null,
                  ),
                  const SizedBox(height: 20),
                  // Contraseña
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
                            value!.isEmpty ? 'Ingrese una contraseña' : null,
                  ),
                  const SizedBox(height: 20),
                  // Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingrese su email';
                      } else if (!value.contains('@')) {
                        return 'Email no válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  // Botón de Registro - ¡AQUÍ ESTÁ EL BOTÓN IMPLEMENTADO!
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          _isLoading
                              ? null
                              : () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  setState(() => _isLoading = true);
                                  try {
                                    // Simulamos un proceso de registro
                                    await Future.delayed(
                                      const Duration(seconds: 2),
                                    );

                                    // Aquí iría tu lógica real de registro:
                                    // await AuthService.registrarUsuario(
                                    //   _firstNameController.text,
                                    //   _lastNameController.text,
                                    //   _userController.text,
                                    //   _passController.text,
                                    //   _emailController.text,
                                    // );

                                    // Limpiar el formulario después del registro
                                    _formKey.currentState?.reset();
                                    _firstNameController.clear();
                                    _lastNameController.clear();
                                    _userController.clear();
                                    _passController.clear();
                                    _emailController.clear();
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
                                    );
                                  } finally {
                                    setState(() => _isLoading = false);
                                  }
                                }
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.blueAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBackgroundColor: Colors.green,
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                color: Colors.yellow,
                              )
                              : const Text(
                                'Crear Usuario',
                                style: TextStyle(fontSize: 18),
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userController.dispose();
    _passController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
