import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/pages/pokemon_detail.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          Text(
            pokemon.id.toString(),
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Image.network(pokemon.imageUrl, width: 70, height: 70),
          Text(pokemon.name),
          ElevatedButton(
            child: const Text('Ver Pokemon'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetail(
                    pokemon: pokemon,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
