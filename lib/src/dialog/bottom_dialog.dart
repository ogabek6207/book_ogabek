import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomDialog {
  static Future<void> showGalleryDialog(
    BuildContext context,
  ) async {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    showModalBottomSheet(

      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height-54*h,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 50 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8 * o),
                    topRight: Radius.circular(8 * o),
                  ),

                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/arrow.svg"),
                    const Spacer(),
                    Text(
                      "Оглавление",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    const Spacer(),
                    SizedBox(width: 28*w,),
                  ],
                ),
              ),
              Container(height: 1,
              color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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
              Container(height: 1,
                color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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
              Container(height: 1,
                color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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
              Container(height: 1,
                color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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
              Container(height: 1,
                color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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
              Container(height: 1,
                color: AppTheme.black.withOpacity(0.1),),
              Container(
                padding: EdgeInsets.only(
                  left: 16 * w,
                ),
                height: 74 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,


                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Text(
                      "Часть 1. Как ты дошел до такой жизни",
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontSize: 16 * o,
                      ),

                    ),
                    Text(
                      "00:00:00",
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

            ],
          ),
        );
      },
    );
  }
}
