import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_clean_arch/data/cache/datasource/app_config_datasource.dart';
import 'package:movieapp_clean_arch/data/cache/hive/entities/actor_entity.dart';
import 'package:movieapp_clean_arch/data/repository/app_config_repository_impl.dart';
import 'package:movieapp_clean_arch/domain/general/localization.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'data/cache/hive/entities/movie_entity.dart';
import 'data/cache/hive/hive_constants.dart';
import 'initial_binding.dart';
import 'page/nav_host/nav_host_helper.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  NavHostHelper.instance;

  await Hive.initFlutter();
  Hive
    ..registerAdapter(MovieEntityAdapter())
    ..registerAdapter(ActorEntityAdapter());
  await Hive.openBox<MovieEntity>(BOX_NAME_MOVIE);
  await Hive.openBox<ActorEntity>(BOX_NAME_ACTOR);

  var themeProvider = ThemeProvider();
  await themeProvider.setInitialTheme();

  var localizationProvider = LocalizationProvider();
  await localizationProvider.setInitialLocalization();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(Localization.ENGLISH),
        Locale(Localization.MYANMAR),
      ],
      path: 'assets/translations',
      // assetLoader: const CodegenLoader(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LocalizationProvider>(
            create: (BuildContext context) => localizationProvider,
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (BuildContext context) => themeProvider,
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

/// MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const cacheSize200Mb = 1000 * 1024 * 1024;
    PaintingBinding.instance.imageCache.maximumSizeBytes = cacheSize200Mb;

    // set init localeCode
    var code = Provider.of<LocalizationProvider>(context).localeCode;
    context.setLocale(Locale(code));
    debugPrint("Locale: $code , ${context.locale}");

    return GetMaterialApp.router(
      initialBinding: InitialBinding(),
      title: 'MovieCleanArchitecture',
      debugShowCheckedModeBanner: false,
      routerDelegate: NavHostHelper.router.routerDelegate,
      routeInformationParser: NavHostHelper.router.routeInformationParser,
      routeInformationProvider: NavHostHelper.router.routeInformationProvider,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

/// Theme Provider
class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;

  final AppConfigRepository _repository =
      AppConfigRepositoryImpl(AppConfigDatasource());

  setInitialTheme() async {
    currentTheme = await _repository.getThemeMode();
    notifyListeners();
  }

  changeCurrentTheme() {
    currentTheme =
        currentTheme == ThemeMode.system ? ThemeMode.dark : ThemeMode.system;
    _repository.storeThemeMode(currentTheme);
    notifyListeners();
  }
}

class LocalizationProvider extends ChangeNotifier {
  String localeCode = Localization.ENGLISH;

  final AppConfigRepository _repository =
      AppConfigRepositoryImpl(AppConfigDatasource());

  setInitialLocalization() async {
    localeCode = await _repository.getLocalization();
    notifyListeners();
  }

  Future<void> changeLocalization(
      BuildContext context, String localeCode) async {
    this.localeCode = localeCode;
    _repository.storeLocalization(localeCode);
    notifyListeners();

    await context.setLocale(Locale(localeCode));
    Get.updateLocale(Locale(localeCode));
  }
}
