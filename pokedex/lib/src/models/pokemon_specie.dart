class PokemonSpecie {
  final int id;
  final String name;
  final String flavorText;
  final String color;
  final String evolutionChainUrl;

  const PokemonSpecie({
    required this.id,
    required this.name,
    required this.flavorText,
    required this.color,
    required this.evolutionChainUrl,
  });

  factory PokemonSpecie.fromJson(Map<String, dynamic> json) {
    return PokemonSpecie(
      id: json['id'] as int,
      name: json['name'] as String,
      flavorText: json['flavorText'] as String,
      color: json['color'] as String,
      evolutionChainUrl: json['evolutionChain'] as String,
    );
  }
}
