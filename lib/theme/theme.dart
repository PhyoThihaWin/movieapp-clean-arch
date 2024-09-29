import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Poppins",
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: PRIMARY_COLOR,
    surface: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: "Poppins",
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: PRIMARY_COLOR,
    surface: Colors.black,
  ),
);
