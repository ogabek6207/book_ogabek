import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveBookScreen extends StatefulWidget {
  const SaveBookScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SaveBookScreenState createState() => _SaveBookScreenState();
}

class _SaveBookScreenState extends State<SaveBookScreen> {
  bool isGrid = true;

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          SizedBox(
            height: 60 * h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20*w),
                height: 50 * h,
                width: 302 * w,
                margin: EdgeInsets.only(
                  left: 17 * w,
                  right: 16 * w,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.milk,
                  borderRadius: BorderRadius.circular(8 * o),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/search.svg")],
                ),
              ),
              Text(
                "Отменить",
                style: TextStyle(
                  color: AppTheme.black6A,
                  fontSize: 16 * o,
                  fontFamily: AppTheme.fontFamilyManrope,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
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
                            const Expanded(
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
        ],
      ),
    );
  }
}
