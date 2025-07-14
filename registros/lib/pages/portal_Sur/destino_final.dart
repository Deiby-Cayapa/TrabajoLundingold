import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/template/menus.dart';

class DestinoFATPage extends StatelessWidget {
  const DestinoFATPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppMenuDrawer(selectedPage: "Destino Final Del Agua"),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Destino Final Del Agua'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      body: const Center(child: Text('Contenido de Destino Final Del Agua')),
    );
  }
}
