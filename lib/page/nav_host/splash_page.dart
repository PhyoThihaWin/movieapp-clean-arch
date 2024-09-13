import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
        duration: const Duration(seconds: 2),
        nextScreen: const NavHostPage(),
        childWidget: const FlutterLogo(
          size: 100,
        ));
  }
}
