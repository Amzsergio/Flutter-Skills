import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F); // !Así se pone el color en hexadecimal en flutter **Style

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {// !Aplicar multiples temas **Style
  final int selectedColor;

  AppTheme({this.selectedColor = 0}) // !Esto controla que el int vaya del 0 al 6 para que lea la cantidad de colores en _colorThemes **AppExp
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: _colorThemes[selectedColor],
        // brightness: Brightness.dark // !Aplicar el tema dark **Style
      );
  }
}
