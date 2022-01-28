import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatefulWidget {
  String image;
  String name;


  BookWidget({Key? key,
    required this.name,
    required this.image,

  }) : super(key: key);

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(8 * o),
      ),
      height: 274 * h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8 * o),
            child: Image.asset(
             widget.image,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Text(
              "Джен Синсеро",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyManrope,
                color: AppTheme.black6A,
                fontWeight: FontWeight.w600,
                fontSize: 14 * o,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Text(
              widget.name,
              maxLines: 2,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyManrope,
                overflow: TextOverflow.ellipsis,
                color: AppTheme.black,
                fontSize: 16 * o,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
