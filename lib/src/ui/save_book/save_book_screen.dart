import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
