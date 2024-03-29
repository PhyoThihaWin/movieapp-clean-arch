import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/data/network/apiclient/dio_client.dart';
import 'package:movieapp_clean_arch/domain/entities/actor_vo.dart';
import 'package:movieapp_clean_arch/initial_binding.dart';
import 'package:movieapp_clean_arch/page/nav_host_page.dart';

import 'data/cache/hive/entities/movie_favorite_entity.dart';
import 'data/cache/hive/hive_constants.dart';
import 'data/cache/hive/entities/movie_entity.dart';
import 'resource/colors.dart';

void main() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(MovieEntityAdapter())
    ..registerAdapter(MovieFavoriteEntityAdapter())
    ..registerAdapter(ActorEntityAdapter());

  await Hive.openBox<MovieEntity>(BOX_NAME_MOVIE);
  await Hive.openBox<MovieFavoriteEntity>(BOX_NAME_MOVIE_FAVORITE);
  await Hive.openBox<ActorEntity>(BOX_NAME_ACTOR);

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
