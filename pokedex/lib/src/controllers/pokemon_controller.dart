import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/src/models/pokemon.dart';
import 'package:pokedex/src/models/pokemon_url.dart';

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
  final response = await client
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100'));
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

Future<Pokemon> fetchPokemonSpecie(http.Client client, int id) async {
  final response = await client
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokemon');
  }
}
