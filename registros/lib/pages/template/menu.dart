import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/portal_Norte/piscinas.dart';
import 'package:flutter_application_1/pages/portal_Norte/dragflow.dart';
import 'package:flutter_application_1/pages/portal_Norte/mudwizard.dart';
import 'package:flutter_application_1/pages/portal_Norte/plantaTratamiento.dart';
import 'package:flutter_application_1/pages/portal_Norte/polishing.dart';
import 'package:flutter_application_1/pages/portal_Norte/tsf.dart';
import 'package:flutter_application_1/pages/portal_Sur/ingreso.dart';
import 'package:flutter_application_1/pages/portal_Sur/reactivos.dart';
import 'package:flutter_application_1/pages/portal_Sur/agua_tratada.dart';
import 'package:flutter_application_1/pages/portal_Sur/destino_final.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[800],
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: const Text("Administrador"),
                      accountEmail: const Text("admin@escuela.com"),
                      currentAccountPicture: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 249, 199, 0),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.blue[800]),
                    ),
                    ExpansionTile(
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
                          title: const Text(
                            'Piscinas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PiscinasPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Dragflow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DragflowPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'MudWizard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MudwizardPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Planta de Tratamiento',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const PlantatratamientoPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Polishing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PolishingPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'TSF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TSfgPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
                          title: const Text(
                            'Ingresos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IngresosPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Reactivos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReactivosPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Agua Tratada',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AguaTPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Destino Final Del Agua Tratada',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DestinoFATPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Divider(height: 1),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          'Cerrar Sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blue[800], // fondo azul
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  "¿Desea cerrar sesión?",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                content: const Text(
                                  "Se cerrará su sesión actual y volverá al inicio.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text("No"),
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text("Sí"),
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                      ).pop(); // cerrar diálogo
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const LoginPage(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
      body: const Center(
        child: Text(
          'Selecciona una opción del menú',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
