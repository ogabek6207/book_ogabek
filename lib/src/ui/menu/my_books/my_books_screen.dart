import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/ui/menu/my_books/search_book_screen.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({Key? key}) : super(key: key);

  @override
  _MyBooksScreenState createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70 * h,
          ),
          Text(
            "Мои книги",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontFamily: AppTheme.fontFamilyManrope,
              color: AppTheme.black,
              fontWeight: FontWeight.bold,
              fontSize: 32 * o,
            ),
          ),
          SizedBox(
            height: 32 * h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const SearchBookScreen()));
            },
            child: Container(
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
                    "Поиск по моим книгам",
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
          ),
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 16 * h),
                    itemCount: (10 + 1) ~/ 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 16 * h,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 24 * w),
                            Expanded(
                              child: ProductWidget(),
                            ),
                            SizedBox(width: 16 * w),
                             Expanded(
                              child: ProductWidget(),
                            ),
                            SizedBox(width: 24 * w),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
