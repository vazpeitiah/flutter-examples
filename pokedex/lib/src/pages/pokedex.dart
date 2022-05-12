import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/pages/pokemon_list.dart';
import 'package:pokedex/src/controllers/pokemon_controller.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.catching_pokemon_outlined),
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: getPokemonsList(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return PokemonList(pokemons: snapshot.data!);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
