import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                            const Expanded(
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
          Container(
            height: 76 * h,
            color: AppTheme.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    right: 12 * w,
                  ),
                  height: 44 * o,
                  width: 44 * w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.black.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 234 * w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Часть 1. Как ты дошел до такой жизни",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppTheme.black,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppTheme.fontFamilyManrope,
                          fontSize: 16 * o,
                        ),
                      ),
                      Text(
                        "Осталось: 06:12:59 ",
                        style: TextStyle(
                          color: AppTheme.black9E,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppTheme.fontFamilyManrope,
                          fontSize: 14 * o,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30 * w,
                ),
                SvgPicture.asset(
                  "assets/icons/play.svg",
                  color: AppTheme.orange,
                ),
                SizedBox(
                  width: 32 * w,
                ),
                SvgPicture.asset("assets/icons/error.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
