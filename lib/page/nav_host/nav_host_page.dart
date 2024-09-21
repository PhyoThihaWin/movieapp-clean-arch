import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';

import '../../resource/colors.dart';
import '../../resource/strings.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: widget.child,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(color: PRIMARY_COLOR)
                  : const TextStyle(color: Colors.white),
            ),
          ),
          child: NavigationBar(
              indicatorColor: Colors.white,
              backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
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
      ),
    );
  }
}

List<NavigationDestination> destinationItems() {
  return [
    const NavigationDestination(
      icon: SvgIcon("ic_home.svg"),
      selectedIcon: SvgIcon("ic_home_selected.svg"),
      label: MENU_MOVIE_TEXT,
    ),
    const NavigationDestination(
      icon: SvgIcon("ic_ticket.svg"),
      selectedIcon: SvgIcon("ic_ticket_selected.svg"),
      label: MENU_FAVORITE_TEXT,
    ),
    const NavigationDestination(
      icon: SvgIcon("ic_video.svg"),
      selectedIcon: SvgIcon("ic_video_selected.svg"),
      label: MENU_TICKET_TEXT,
    ),
    const NavigationDestination(
      icon: SvgIcon("ic_user.svg"),
      selectedIcon: SvgIcon("ic_user_selected.svg"),
      label: MENU_PROFILE_TEXT,
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