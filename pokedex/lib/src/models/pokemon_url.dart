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
