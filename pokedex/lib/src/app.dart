import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/pokedex.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Podedex App',
      home: Pokedex(),
      debugShowCheckedModeBanner: false,
    );
  }
}
