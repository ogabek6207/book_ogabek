import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'items/all_books.dart';
import 'items/genres_screen.dart';
import 'items/news_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 62 * h,
            ),
            Container(
              padding: EdgeInsets.only(left: 19 * w),
              height: 50 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                color: AppTheme.milk,
                borderRadius: BorderRadius.circular(8 * o),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/search.svg",
                  ),
                  SizedBox(
                    width: 8 * w,
                  ),
                  Text(
                    "Поиск",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.black9E,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontFamilyManrope,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24 * h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.milk,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TabBar(
                      unselectedLabelStyle:
                          const TextStyle(color: AppTheme.milk),
                      indicatorColor: AppTheme.orange,
                      unselectedLabelColor: AppTheme.black6A,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tabs: [
                        SizedBox(
                          height: 46 * h,
                          child: Center(
                            child: Text(
                              "Новинки",
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyManrope,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 46,
                          child: Center(
                            child: Text(
                              "Жанры",
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyManrope,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 46 * h,
                          child: Center(
                            child: Text(
                              "Все книги",
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyManrope,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 50 * h,
                    padding: EdgeInsets.all(2 * o),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32 * h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const TabBarView(
                children: [NewsScreen(), HomeScreen(), AllBooksScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
