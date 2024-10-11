import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';

import '../../generated/locale_keys.g.dart';
import '../../theme/resource/colors.dart';

class NavHostPage extends StatefulWidget {
  final StatefulNavigationShell child;
  const NavHostPage({super.key, required this.child});

  @override
  State<NavHostPage> createState() => _NavHostPageState();
}

class _NavHostPageState extends State<NavHostPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: context.getColorScheme().surface,

      /// for iOS
      statusBarBrightness: context.getTheme().brightness,

      /// for Android
      statusBarIconBrightness: context.getTheme().brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
    ));

    return Scaffold(
      backgroundColor: context.getColorScheme().surface,
      body: widget.child,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? const TextStyle(color: PRIMARY_COLOR)
                : const TextStyle(color: Colors.grey),
          ),
        ),
        child: NavigationBar(
            indicatorColor: context.getColorScheme().surfaceContainerHighest,
            backgroundColor: context.getColorScheme().surface,
            selectedIndex: pageIndex,
            onDestinationSelected: (index) {
              setState(() {
                pageIndex = index;
                widget.child.goBranch(
                  index,
                  initialLocation: index == widget.child.currentIndex,
                );
              });
            },
            destinations: destinationItems()),
      ),
    );
  }
}

List<NavigationDestination> destinationItems() {
  return [
    NavigationDestination(
      icon: const SvgIcon("ic_home.svg"),
      selectedIcon: const SvgIcon("ic_home_selected.svg"),
      label: LocaleKeys.navTitleHome.tr(),
    ),
    NavigationDestination(
      icon: const SvgIcon("ic_ticket.svg"),
      selectedIcon: const SvgIcon("ic_ticket_selected.svg"),
      label: LocaleKeys.navTitleFavorite.tr(),
    ),
    NavigationDestination(
      icon: const SvgIcon("ic_video.svg"),
      selectedIcon: const SvgIcon("ic_video_selected.svg"),
      label: LocaleKeys.navTitleMovie.tr(),
    ),
    NavigationDestination(
      icon: const SvgIcon("ic_user.svg"),
      selectedIcon: const SvgIcon("ic_user_selected.svg"),
      label: LocaleKeys.navTitleProfile.tr(),
    ),
  ];
}


/* BottomNavigationBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: TEXT_GREY_COLOR,
        selectedItemColor: PRIMARY_COLOR,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: bottomNavigationMenuItems(),
      ),

List<BottomNavigationBarItem> bottomNavigationMenuItems() {
  return <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: SvgIcon("ic_home.svg"),
      activeIcon: SvgIcon("ic_home_selected.svg"),
      label: MENU_MOVIE_TEXT,
    ),
    const BottomNavigationBarItem(
      icon: SvgIcon("ic_ticket.svg"),
      activeIcon: SvgIcon("ic_ticket_selected.svg"),
      label: MENU_CINEMA_TEXT,
    ),
    const BottomNavigationBarItem(
      icon: SvgIcon("ic_video.svg"),
      activeIcon: SvgIcon("ic_video_selected.svg"),
      label: MENU_TICKET_TEXT,
    ),
    const BottomNavigationBarItem(
      icon: SvgIcon("ic_user.svg"),
      activeIcon: SvgIcon("ic_user_selected.svg"),
      label: MENU_PROFILE_TEXT,
    ),
  ];
} */