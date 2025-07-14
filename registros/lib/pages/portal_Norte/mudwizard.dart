import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class MudwizardPage extends StatelessWidget {
  const MudwizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Mudwizard"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Mudwizard'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de Mudwizard')),
    );
  }
}
