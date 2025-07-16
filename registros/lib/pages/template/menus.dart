import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/portal_Norte/dragflow.dart';
import 'package:flutter_application_1/pages/portal_Norte/mudwizard.dart';
import 'package:flutter_application_1/pages/portal_Norte/piscinas.dart';
import 'package:flutter_application_1/pages/portal_Norte/plantaTratamiento.dart';
import 'package:flutter_application_1/pages/portal_Norte/polishing.dart';
import 'package:flutter_application_1/pages/portal_Norte/tsf.dart';
import 'package:flutter_application_1/pages/portal_Sur/agua_tratada.dart';
import 'package:flutter_application_1/pages/portal_Sur/destino_final.dart';
import 'package:flutter_application_1/pages/portal_Sur/ingreso.dart';
import 'package:flutter_application_1/pages/portal_Sur/reactivos.dart';

class AppMenuDrawer extends StatelessWidget {
  final String selectedPage;

  const AppMenuDrawer({super.key, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      child: Icon(Icons.person, size: 40, color: Colors.black),
                    ),
                    decoration: BoxDecoration(color: Colors.blue[800]),
                  ),
                  _buildSection(
                    context,
                    title: "TRATAMIENTO DE AGUAS - PORTAL NORTE",
                    tiles: [
                      _buildNavTile(
                        context,
                        "Piscinas",
                        PiscinasPage(),
                        selectedPage == "Piscinas",
                      ),
                      _buildNavTile(
                        context,
                        "Dragflow",
                        DragflowPage(),
                        selectedPage == "Dragflow",
                      ),
                      _buildNavTile(
                        context,
                        "MudWizard",
                        MudwizardPage(),
                        selectedPage == "MudWizard",
                      ),
                      _buildNavTile(
                        context,
                        "Planta de Tratamiento",
                        PlantatratamientoPage(),
                        selectedPage == "Planta",
                      ),
                      _buildNavTile(
                        context,
                        "Polishing",
                        PolishingPage(),
                        selectedPage == "Polishing",
                      ),
                      _buildNavTile(
                        context,
                        "TSF",
                        TSfgPage(),
                        selectedPage == "TSF",
                      ),
                    ],
                  ),
                  _buildSection(
                    context,
                    title: "TRATAMIENTO DE AGUAS - PORTAL SUR",
                    tiles: [
                      _buildNavTile(
                        context,
                        "Ingresos",
                        IngresosPage(),
                        selectedPage == "Ingresos",
                      ),
                      _buildNavTile(
                        context,
                        "Reactivos",
                        ReactivosPage(),
                        selectedPage == "Reactivos",
                      ),
                      _buildNavTile(
                        context,
                        "Agua Tratada",
                        AguaTPage(),
                        selectedPage == "Agua",
                      ),
                      _buildNavTile(
                        context,
                        "Destino Final Del Agua Tratada",
                        DestinoFATPage(),
                        selectedPage == "Destino",
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
                              backgroundColor: Colors.blue[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text(
                                "¿Desea cerrar sesión?",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 126, 157),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              content: const Text(
                                "Se cerrará su sesión actual y volverá al inicio.",
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text("No"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text("Sí"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
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
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> tiles,
  }) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 249, 199, 0),
          fontSize: 12,
          letterSpacing: 1.2,
        ),
      ),
      children: tiles,
    );
  }

  Widget _buildNavTile(
    BuildContext context,
    String title,
    Widget page,
    bool selected,
  ) {
    return ListTile(
      selected: selected,
      selectedTileColor: Colors.blue[900],
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.amber : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // cerrar el drawer
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
