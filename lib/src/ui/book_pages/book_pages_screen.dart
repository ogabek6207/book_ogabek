import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookPagesScreen extends StatefulWidget {
  const BookPagesScreen({Key? key}) : super(key: key);

  @override
  _BookPagesScreenState createState() => _BookPagesScreenState();
}

class _BookPagesScreenState extends State<BookPagesScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 472 * h,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              child: Image.asset(
                "assets/images/book.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 84 * h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: 16 * w,
              right: 18 * w,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "НИ СЫ. Будь уверен в своих силах и не позволяй сомнениям мешать двигаться тебе вперед",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * o,
                      height: 28 / 20 * h,
                    ),
                  ),
                  height: 84 * h,
                  width: MediaQuery.of(context).size.width - 83 * w,
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/mark.svg",
                ),
              ],
            ),
          ),
          Container(
            height: 25 * h,
            width: 135 * h,
            margin: EdgeInsets.only(top: 16 * h, left: 16 * w),
            child: Row(
              children: [
                Text(
                  "Джен Синсеро",
                  style: TextStyle(
                    color: AppTheme.black6A,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16 * o,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow_right.svg"),
              ],
            ),
          ),
          SizedBox(
            height: 24 * h,
          ),
          Container(
            height: 24 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/more.svg",
                ),
                SizedBox(
                  width: 8 * w,
                ),
                Text(
                  "Содержание",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    color: AppTheme.black6A,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16 * o,
                  ),
                ),
                const Spacer(),
                Text(
                  "Длительность: 06:29:08",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    color: AppTheme.black9E,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16 * o,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 40 * h,
              left: 17 * h,
              right: 20 * w,
            ),
            decoration: BoxDecoration(
              color: AppTheme.orange,
              borderRadius: BorderRadius.circular(8 * o),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/play.svg"),
                  SizedBox(
                    width: 10 * w,
                  ),
                  Text(
                    "Слушать",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      color: AppTheme.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16 * o,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
