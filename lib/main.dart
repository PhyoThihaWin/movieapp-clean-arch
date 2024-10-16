import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/local/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/domain/general/localization.dart';
import 'package:movieapp_clean_arch/theme/theme_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'data/local/hive/entities/movie_entity.dart';
import 'data/local/hive/hive_constants.dart';
import 'generated/codegen_loader.g.dart';
import 'page/nav_host/nav_host_helper.dart';
import 'theme/theme.dart';

Future<void> main() async {
  // splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const cacheSize200Mb = 1000 * 1024 * 1024;
  PaintingBinding.instance.imageCache.maximumSizeBytes = cacheSize200Mb;

  // Hive init
  await Hive.initFlutter();
  Hive
    ..registerAdapter(MovieEntityAdapter())
    ..registerAdapter(ActorEntityAdapter());
  await Hive.openBox<MovieEntity>(BOX_NAME_MOVIE);
  await Hive.openBox<ActorEntity>(BOX_NAME_ACTOR);

  // Localization
  await EasyLocalization.ensureInitialized();

  // dot env
  await dotenv.load(fileName: ".env");

  // GoRouter nav helper
  NavHostHelper.instance;

  runApp(
    ProviderScope(
      // observers: [ProvidersLogger()],
      child: EasyLocalization(
          supportedLocales: const [
            Locale(Localization.ENGLISH),
            Locale(Localization.MYANMAR),
          ],
          path: 'assets/translations',
          assetLoader: const CodegenLoader(),
          child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(currentThemeModeProvider, (previous, next) async {
      debugPrint("Theme: ${next.value}");
      await Future.delayed(const Duration(milliseconds: 500));
      FlutterNativeSplash.remove();
    });

    return MaterialApp.router(
      title: 'MovieCleanArchitecture',
      debugShowCheckedModeBanner: false,
      routerDelegate: NavHostHelper.router.routerDelegate,
      routeInformationParser: NavHostHelper.router.routeInformationParser,
      routeInformationProvider: NavHostHelper.router.routeInformationProvider,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(currentThemeModeProvider).value,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
