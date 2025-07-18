import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class MudWizardPage extends StatelessWidget {
  const MudWizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(
        selectedPage: "MudWizard",
      ), // Cambiado a MudWizard
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('MudWizard'), // Título cambiado
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de MudWizard')),
    );
  }
}
