import 'package:flutter/material.dart';

// Esto es una manera de manejar el tema dinamicamente, incluyendo si quiero implementar tamaño de letras iconos y demás.
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool
      isDarkmode; // Esto lo creo para poder recibir el velor del Darkmode de provider **Riverpod

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode
            ? Brightness.dark
            : Brightness.light, // Aqui hago la configuracion del DarkMode
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith(
          { // Este método se crea para no tener que cambiar la variable isDarkmode puesto que ella es final y queremos que se mantenga inmutable, sirve para crear un nuevo estado que esta basado en el anterior. **Dart **Riverpod
          int? selectedColor,
          bool? isDarkmode}) =>
      AppTheme(
        selectedColor: selectedColor ??
            this.selectedColor, // si no envian valor entonces uso el valor de la clase con this.
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
