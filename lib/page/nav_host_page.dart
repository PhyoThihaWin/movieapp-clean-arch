import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/page/home/payment_page.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page.dart';
import 'package:movieapp_clean_arch/page/profile/profile_page.dart';
import 'package:movieapp_clean_arch/page/ticket/ticket_page.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';

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
}
