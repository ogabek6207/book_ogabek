import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/setting/setting_screen.dart';
import 'package:book_ogabek/src/ui/tab_bar/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'company/news_screen.dart';
import 'home/genres_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
    const TabBarScreen(),
    const NewsScreen(),
    const SettingScreen(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: AppTheme.purple,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset("assets/icons/catalog.svg")
                : SvgPicture.asset("assets/icons/catalog1.svg"),
            label: "Каталог",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
                    "assets/icons/player.svg",

                  )
                : SvgPicture.asset(
                    "assets/icons/player1.svg",
                  ),
            label: "Плеер",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/icons/my_books.svg",

                  )
                : SvgPicture.asset(
                    "assets/icons/my_books1.svg",
                  ),
            label: "Мои книги",
          ),
        ],
      ),
    );
  }
}
