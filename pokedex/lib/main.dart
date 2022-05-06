import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Pokedex(),
    );
  }
}

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  /* late Future<List<Pokemon>> _future;

  @override
  void initState() {
    super.initState();
    _future = getPokemonsList(http.Client());
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Column(
        children: [
          Text(pokemon.id.toString()),
          Image.network(pokemon.imageUrl),
          Text(pokemon.name),
        ],
      ),
    );
  }
}

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
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(pokemons[index].id.toString()),
              Image.network(pokemons[index].imageUrl, width: 70, height: 70),
              Text(pokemons[index].name),
              ElevatedButton(
                child: const Text('Ver Pokemon'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetail(
                        pokemon: pokemons[index],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

List<PokemonURL> parsePokemonsURL(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<PokemonURL>((json) => PokemonURL.fromJson(json)).toList();
}

Future<List<Pokemon>> getPokemonsList(http.Client client) async {
  List<PokemonURL> pokemonsURL = await fetchPokemonURL(client);
  List<Pokemon> pokemons = [];

  for (var i = 0; i < pokemonsURL.length; i++) {
    var pokemon = await fetchPokemon(client, pokemonsURL[i].url);
    pokemons.add(pokemon);
  }

  return pokemons;
}

Future<List<PokemonURL>> fetchPokemonURL(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));
  return compute(parsePokemonsURL, response.body);
}

Future<Pokemon> fetchPokemon(http.Client client, String url) async {
  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokemon');
  }
}

class PokemonURL {
  final String name;
  final String url;

  const PokemonURL({
    required this.name,
    required this.url,
  });

  factory PokemonURL.fromJson(Map<String, dynamic> json) {
    return PokemonURL(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}

class Pokemon {
  final int id;
  final String name;
  final int weight;
  final String imageUrl;

  const Pokemon({
    required this.id,
    required this.name,
    required this.weight,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
      imageUrl: json['sprites']['other']['official-artwork']['front_default']
          as String,
    );
  }
}
