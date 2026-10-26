import 'dart:ui';

class PokemonModel {
  final String name;
  final String image;
  final String type;
  final String ability;
  final String height;
  final String weight;
  final String description;
  final List<Color> gradient;
  final Map<String, int> stats;

  PokemonModel({
    required this.name,
    required this.image,
    required this.type,
    required this.ability,
    required this.height,
    required this.weight,
    required this.description,
    required this.gradient,
    required this.stats,
  });

  List<String> get types => type.split("/");

  String get buttonText => "🔍 View $name in Pokédex";
}
