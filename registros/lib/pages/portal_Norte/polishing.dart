import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class PolishingPage extends StatelessWidget {
  const PolishingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Polishing"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Polishing'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de Polishing')),
    );
  }
}
