import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[800], // Fondo azul para toda la parte superior
          child: Stack(
            children: [
              // Contenido desplazado hacia abajo
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: const Text("Administrador"),
                      accountEmail: const Text("admin@escuela.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 249, 199, 0),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.blue[800]),
                    ),

                    // PORTAL NORTE
                    ExpansionTile(
                      initiallyExpanded: false,
                      title: const Text(
                        "TRATAMIENTO DE AGUAS - PORTAL NORTE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 249, 199, 0),
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'Planta Tratamiento de Agua',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'TSF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'MUDWIZARD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'DRAGFLOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'Piscinas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'POLISHING POND',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      indent: 16,
                      endIndent: 16,
                    ),

                    // PORTAL SUR
                    ExpansionTile(
                      title: const Text(
                        "TRATAMIENTO DE AGUAS - PORTAL SUR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 249, 199, 0),
                          fontSize: 12,
                          letterSpacing: 1.2,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'Ingreso',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'Reactivos Utilizados',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'Agua Tratada',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text(
                            'Destino final del Agua Tratada',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text('Cerrar Sesión'),
                      onTap: () => SystemNavigator.pop(),
                    ),
                  ],
                ),
              ),

              // Botón "X" arriba a la izquierda
              Positioned(
                top: 8,
                left: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  tooltip: 'Cerrar menú',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
