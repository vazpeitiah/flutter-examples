import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                pokemon.name.toUpperCase(),
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                pokemon.id.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Image.network(
                pokemon.imageUrl,
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
