import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:movieapp_clean_arch/page/favorite/favorite_page.dart';
import 'package:movieapp_clean_arch/page/favorite/favorite_page_binding.dart';
import 'package:movieapp_clean_arch/page/home/home_binding.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page_binding.dart';
import 'package:movieapp_clean_arch/page/moviedetail/movie_detail_binding.dart';
import 'package:movieapp_clean_arch/page/moviedetail/movie_detail_page.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_binding.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_page.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page.dart';

class NavHostHelper {
  static final NavHostHelper _instance = NavHostHelper._internal();

  static NavHostHelper get instance => _instance;

  factory NavHostHelper() {
    return _instance;
  }

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> favoriteNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> movieNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static late final GoRouter router;

  static const String homePath = '/home';
  static const String favoritePath = '/favorite';
  static const String profilePath = '/profile';
  static const String moviePath = '/movie';

  static const String detailPath = '/detail';
  static const String listingPath = '/listing';

  NavHostHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  HomeBinding().dependencies();
                  return getPage(
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: favoriteNavigatorKey,
            routes: [
              GoRoute(
                path: favoritePath,
                pageBuilder: (context, state) {
                  FavoritePageBinding().dependencies();
                  return getPage(
                    child: const FavoritePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: movieNavigatorKey,
            routes: [
              GoRoute(
                path: moviePath,
                pageBuilder: (context, state) {
                  MoviePageBinding().dependencies();
                  return getPage(
                    child: const MoviePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileNavigatorKey,
            routes: [
              GoRoute(
                path: profilePath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ProfilePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: NavHostPage(child: navigationShell),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: "$detailPath/:id",
        onExit: (context, state) => MovieDetailBinding().dispose(),
        pageBuilder: (context, state) {
          MovieDetailBinding().dependencies();
          var id = state.pathParameters['id'].toIntOrNull() ?? 0;
          return getPage(
            child: MovieDetailPage(movieId: id),
            state: state,
          );
        },
      ),
      GoRoute(
        path: listingPath,
        onExit: (context, state) => MovieListingBinding().dispose(),
        pageBuilder: (context, state) {
          MovieListingBinding().dependencies();
          return getPage(
            child: const MovieListingPage(),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: homePath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}