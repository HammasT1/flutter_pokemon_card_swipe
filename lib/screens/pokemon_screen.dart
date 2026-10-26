import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../widgets/page_indicator.dart';
import '../widgets/pokemon_page.dart';
import '../data/pokemon_data.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final LiquidController liquidController = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: liquidController,
            pages: List.generate(
              pokemons.length,
                  (index) => PokemonPage(
                key: ValueKey(pokemons[index].name),
                pokemon: pokemons[index],
                isActive: currentPage == index,
              ),
            ),
            waveType: WaveType.liquidReveal,
            slideIconWidget: Image.asset(
              "assets/images/pokeball.png",
              height: 60,
              width: 60,
            ),
            onPageChangeCallback: (page) {
              setState(() => currentPage = page);
            },
          ),
          Positioned(
            bottom: 18,
            left: 0,
            right: 0,
            child: PageIndicator(
              count: pokemons.length,
              currentIndex: currentPage,
              onDotTap: (index) {
                if (index != currentPage) {
                  liquidController.animateToPage(page: index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
