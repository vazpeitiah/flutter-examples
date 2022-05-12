import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/pokemon_item.dart';
import 'package:pokedex/src/models/pokemon.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        return PokemonItem(pokemon: pokemons[index]);
      },
    );
  }
}
