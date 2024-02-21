import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/page/nav_host_page.dart';

import 'resource/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          primaryColor: PRIMARY_COLOR,
          primarySwatch: PRIMARY_COLOR_MATERIAL,
          fontFamily: "Poppins"),
      home: const NavHostPage(),
    );
  }
}
