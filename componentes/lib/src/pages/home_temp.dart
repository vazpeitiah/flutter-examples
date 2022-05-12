import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  final _opciones = const ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    return _opciones
        .map((e) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.coffee)),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(e),
                  subtitle: Text('cualquier cosa'),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ))
        .toList();
  }
}
