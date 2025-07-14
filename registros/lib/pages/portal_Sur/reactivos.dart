import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class ReactivosPage extends StatelessWidget {
  const ReactivosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Reactivos"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Reactivos'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de Reactivos')),
    );
  }
}
