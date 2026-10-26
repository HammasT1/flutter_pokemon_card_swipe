import 'package:flutter/material.dart';
import '../dialogs/pokemon_dialog.dart';
import '../models/pokemon_model.dart';
import 'type_badge.dart';

class PokemonPage extends StatefulWidget {
  final PokemonModel pokemon;
  final bool isActive;

  const PokemonPage({
    super.key,
    required this.pokemon,
    required this.isActive,
  });

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    if (widget.isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant PokemonPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _controller.reset();
      _controller.forward();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameAnimation = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    final imageAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    final buttonAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.pokemon.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/pokemon.png",
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 150,
            child: SlideTransition(
              position: nameAnimation,
              child: FadeTransition(
                opacity: _controller,
                child: Text(
                  widget.pokemon.name,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Colors.black.withValues(alpha: 0.6),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 210,
            child: FadeTransition(
              opacity: _controller,
              child: Row(
                children: widget.pokemon.types
                    .map((type) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: TypeBadge(type: type),
                        ))
                    .toList(),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 250, bottom: 120),
              child: SlideTransition(
                position: imageAnimation,
                child: FadeTransition(
                  opacity: _controller,
                  child: Image.asset(
                    widget.pokemon.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SlideTransition(
              position: buttonAnimation,
              child: FadeTransition(
                opacity: _controller,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    PokemonDialog.show(context, widget.pokemon);
                  },
                  child: Text(
                    widget.pokemon.buttonText,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
