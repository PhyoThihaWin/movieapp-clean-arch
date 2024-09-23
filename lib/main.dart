import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/initial_binding.dart';

import 'data/cache/hive/entities/movie_entity.dart';
import 'data/cache/hive/hive_constants.dart';
import 'page/nav_host/nav_host_helper.dart';
import 'resource/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NavHostHelper.instance;

  await Hive.initFlutter();

  Hive
    ..registerAdapter(MovieEntityAdapter())
    ..registerAdapter(ActorEntityAdapter());

  await Hive.openBox<MovieEntity>(BOX_NAME_MOVIE);
  await Hive.openBox<ActorEntity>(BOX_NAME_ACTOR);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const cacheSize200Mb = 1000 * 1024 * 1024;
    PaintingBinding.instance.imageCache.maximumSizeBytes = cacheSize200Mb;

    return GetMaterialApp.router(
      initialBinding: InitialBinding(),
      title: 'MovieCleanArchitecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          primarySwatch: PRIMARY_COLOR_MATERIAL,
          fontFamily: "Poppins"),
      routerDelegate: NavHostHelper.router.routerDelegate,
      routeInformationParser: NavHostHelper.router.routeInformationParser,
      routeInformationProvider: NavHostHelper.router.routeInformationProvider,
    );
  }
}
