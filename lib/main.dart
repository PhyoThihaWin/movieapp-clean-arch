import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/dio_client.dart';
import 'package:movieapp_clean_arch/initial_binding.dart';
import 'package:movieapp_clean_arch/page/nav_host_page.dart';

import 'data/cache/hive/hive_constants.dart';
import 'data/cache/home/entities/movie_entity.dart';
import 'resource/colors.dart';

void main() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(MovieEntityAdapter());

  await Hive.openBox<MovieEntity>(BOX_NAME_MOVIE);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: InitialBinding(),
      title: 'MovieCleanArchitecture',
      debugShowCheckedModeBanner: false,
      navigatorKey: DioClient.chuck.getNavigatorKey(),
      theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          primarySwatch: PRIMARY_COLOR_MATERIAL,
          fontFamily: "Poppins"),
      home: const NavHostPage(),
    );
  }
}
