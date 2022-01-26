import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isGrid = true;

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
