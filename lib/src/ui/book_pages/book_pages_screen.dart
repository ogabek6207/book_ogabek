import 'package:book_ogabek/src/ui/menu/player/player_screen.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookPagesScreen extends StatefulWidget {
  const BookPagesScreen({Key? key}) : super(key: key);

  @override
  _BookPagesScreenState createState() => _BookPagesScreenState();
}

class _BookPagesScreenState extends State<BookPagesScreen> {
  bool save = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 428 * h,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/book.png",
                          fit: BoxFit.cover,
                        ),
                        height: 370 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 24 * h),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20 * h,
                            left: 20 * w,
                          ),
                          height: 54 * o,
                          width: 54 * o,
                          child:
                              SvgPicture.asset("assets/icons/arrow_left.svg"),
                        ),
                      ),
                    ],
                  ),
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
                      SizedBox(
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            save = !save;
                          });
                        },
                        child: save
                            ? SvgPicture.asset(
                                "assets/icons/my_books.svg",
                              )
                            : SvgPicture.asset(
                                "assets/icons/mark.svg",
                              ),
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
                  height: 22 * h,
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlayerScreen(
                            onBack: () {},
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 56 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        bottom: 40 * h,
                        top: 40 * h,
                        left: 16 * w,
                        right: 16 * w),
                    decoration: BoxDecoration(
                      color: AppTheme.orange,
                      borderRadius: BorderRadius.circular(8 * o),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/play.svg",
                        ),
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
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17 * w,
                    right: 26 * w,
                  ),
                  height: 32 * h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8 * h,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17 * w,
                    right: 26 * w,
                  ),
                  height: 32 * h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8 * h,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17 * w,
                    right: 26 * w,
                  ),
                  height: 32 * h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 122 * w,
                        decoration: BoxDecoration(
                          color: AppTheme.whiteF5,
                          borderRadius: BorderRadius.circular(100 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Джен Синсеро",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              color: AppTheme.black6A,
                              letterSpacing: 0.08,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 11 * o,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
