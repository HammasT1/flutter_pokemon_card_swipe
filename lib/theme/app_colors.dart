import 'package:flutter/material.dart';

class AppColors {
  static const yellowGradient = [Color(0xFFFFEA00), Color(0xFFFFD54F)];
  static const redGradient = [Color(0xFFFF7043), Color(0xFFD32F2F)];
  static const blueGradient = [Color(0xFF4FC3F7), Color(0xFF0288D1)];
  static const greenGradient = [Color(0xFF81C784), Color(0xFF388E3C)];

  static const typeColors = {
    "Electric": Color(0xFFF9A825),
    "Fire": Color(0xFFE64A19),
    "Water": Color(0xFF1565C0),
    "Grass": Color(0xFF2E7D32),
    "Poison": Color(0xFF7B1FA2),
  };

  static Color typeColor(String type) => typeColors[type] ?? Colors.grey;
}
