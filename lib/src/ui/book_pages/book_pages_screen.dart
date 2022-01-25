import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

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
                  height: 84*h,
                  width: MediaQuery.of(context).size.width-83*w,

                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
