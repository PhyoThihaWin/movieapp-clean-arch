import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/theme/resource/colors.dart';

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final tween =
        Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: Curves.ease));
    return ScaleTransition(
      scale: animation.drive(tween),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Poppins",
  brightness: Brightness.light,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CustomTransitionBuilder(),
  }),
  colorScheme: const ColorScheme.light(
    primary: PRIMARY_COLOR,
    onPrimary: Colors.white,
    secondary: Color(0xFF6F5B40),
    onSecondary: Colors.white,
    tertiary: Color(0xFF51643F),
    onTertiary: Colors.white,
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1F1B16),
    surfaceContainerHigh: Color.fromARGB(255, 244, 244, 244),
    surfaceContainerHighest: Color.fromARGB(255, 236, 234, 234),
    onSurfaceVariant: Color(0xFF4F4539),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Poppins",
  brightness: Brightness.dark,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CustomTransitionBuilder(),
  }),
  colorScheme: const ColorScheme.dark(
    primary: PRIMARY_COLOR,
    onPrimary: Colors.white,
    secondary: Color(0xFFDDC2A1),
    onSecondary: Color(0xFF3E2D16),
    tertiary: Color(0xFFB8CEA1),
    onTertiary: Color(0xFF243515),
    surface: Color(0xFF1D1C1C),
    onSurface: Color.fromARGB(255, 255, 255, 255),
    surfaceContainerHigh: Color.fromARGB(255, 36, 35, 35),
    surfaceContainerHighest: Color(0xFF3A3733),
    onSurfaceVariant: Color(0xFFF7F4F2),
  ),
);
