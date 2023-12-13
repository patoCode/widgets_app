import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink,
  Colors.deepPurple,
  Colors.orange,
  Colors.indigo,
  Colors.amberAccent
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(
          selectedColor >= 0,
          "Selected color must be greater then 0",
        ),
        assert(
          selectedColor < colorList.length,
          "Selected color must be less or equal then ${colorList.length - 1}",
        );
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        //** Aca podemos definir los estilos generales para todos los appBar
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );
}
