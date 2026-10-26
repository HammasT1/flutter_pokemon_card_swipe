import '../models/pokemon_model.dart';
import '../theme/app_colors.dart';

final List<PokemonModel> pokemons = [
  PokemonModel(
    name: "Pikachu",
    image: "assets/images/pikachu.png",
    type: "Electric",
    ability: "Static",
    height: "0.4 m",
    weight: "6.0 kg",
    description:
    "Pikachu, an Electric-type Pokémon. It stores electricity in its cheeks and releases it in lightning bolts.",
    gradient: AppColors.yellowGradient,
    stats: {"HP": 35, "Attack": 55, "Defense": 40, "Speed": 90},
  ),
  PokemonModel(
    name: "Charmander",
    image: "assets/images/charmander.png",
    type: "Fire",
    ability: "Blaze",
    height: "0.6 m",
    weight: "8.5 kg",
    description:
    "Charmander, the Fire-type Pokémon. The flame on its tail shows the strength of its life force.",
    gradient: AppColors.redGradient,
    stats: {"HP": 39, "Attack": 52, "Defense": 43, "Speed": 65},
  ),
  PokemonModel(
    name: "Squirtle",
    image: "assets/images/squirtle.png",
    type: "Water",
    ability: "Torrent",
    height: "0.5 m",
    weight: "9.0 kg",
    description:
    "Squirtle, a Water-type Pokémon. It shoots water at prey while in the water using its jet-like shell.",
    gradient: AppColors.blueGradient,
    stats: {"HP": 44, "Attack": 48, "Defense": 65, "Speed": 43},
  ),
  PokemonModel(
    name: "Bulbasaur",
    image: "assets/images/bulbasaur.png",
    type: "Grass/Poison",
    ability: "Overgrow",
    height: "0.7 m",
    weight: "6.9 kg",
    description:
    "Bulbasaur, the Seed Pokémon. It carries a seed on its back since birth, which grows as it does.",
    gradient: AppColors.greenGradient,
    stats: {"HP": 45, "Attack": 49, "Defense": 49, "Speed": 45},
  ),
];
