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
