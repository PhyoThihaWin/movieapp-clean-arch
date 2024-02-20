import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page.dart';
import 'package:movieapp_clean_arch/page/ticket/ticket_page.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../resource/colors.dart';
import '../resource/strings.dart';

class NavHostPage extends StatefulWidget {
  const NavHostPage({super.key});

  @override
  State<NavHostPage> createState() => _NavHostPageState();
}

class _NavHostPageState extends State<NavHostPage> {
  int pageIndex = 0;
  final int _tabIndex = 0;

  late final List<Widget> _pageBody = [
    const HomePage(),
    const TicketPage(),
    const MoviePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _pageBody[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

List<BottomNavigationBarItem> bottomNavigationMenuItems() {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: "ic_home.svg".toSvgIcon(),
      activeIcon: "ic_home_selected.svg".toSvgIcon(),
      label: MENU_MOVIE_TEXT,
    ),
    BottomNavigationBarItem(
      icon: "ic_ticket.svg".toSvgIcon(),
      activeIcon: "ic_ticket_selected.svg".toSvgIcon(),
      label: MENU_CINEMA_TEXT,
    ),
    BottomNavigationBarItem(
      icon: "ic_video.svg".toSvgIcon(),
      activeIcon: "ic_video_selected.svg".toSvgIcon(),
      label: MENU_TICKET_TEXT,
    ),
    BottomNavigationBarItem(
      icon: "ic_user.svg".toSvgIcon(),
      activeIcon: "ic_user_selected.svg".toSvgIcon(),
      label: MENU_PROFILE_TEXT,
    ),
  ];
}
