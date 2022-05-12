import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  final _textStyle = const TextStyle(
    fontSize: 25,
  );
  int _conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: _textStyle),
            Text('$_conteo', style: _textStyle),
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 30),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _conteo = 0;
            });
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const Expanded(child: SizedBox()),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_conteo > 0) _conteo--;
            });
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _conteo++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
