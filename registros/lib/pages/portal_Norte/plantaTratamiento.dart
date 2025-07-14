import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class PlantatratamientoPage extends StatelessWidget {
  const PlantatratamientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Planta De Tratamiento"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Planta De Tratamiento'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de Planta De Tratamiento')),
    );
  }
}
