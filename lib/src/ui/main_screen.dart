import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'menu/category/category_screen.dart';
import 'menu/my_books/my_books_screen.dart';
import 'menu/player/player_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: [
        const CategoryScreen(),
        PlayerScreen(
          isMain: true,
          onBack: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        const MyBooksScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        unselectedLabelStyle: TextStyle(
          fontFamily: AppTheme.fontFamilyManrope,
          fontWeight: FontWeight.w600,
          fontSize: 12 * h,
          height: 21 / 8 * h,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: AppTheme.fontFamilyManrope,
          fontWeight: FontWeight.w600,
          fontSize: 12 * h,
          height: 21 / 8 * h,
        ),
        selectedFontSize: 12 * o,
        unselectedFontSize: 12 * o,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.orange,
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
