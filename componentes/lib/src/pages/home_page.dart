import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import '../utils/icon_util.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _showList(),
    );
  }
}

Widget _showList() {
  return FutureBuilder(
    future: menuProvider.loadData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView(
          children: _crearItems(snapshot.data, context),
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}

List<Widget> _crearItems(data, context) {
  final List<Widget> options = [];

  if (data == null) return [];

  data.forEach((opt) {
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: const Icon(Icons.arrow_right, color: Colors.blue),
      onTap: () {
        Navigator.pushNamed(context, opt['ruta']);
      },
    );

    options.add(widgetTemp);
  });

  return options;
}
