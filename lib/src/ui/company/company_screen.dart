import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreen extends StatefulWidget {


  const ProductScreen({
    Key? key,

  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isGrid = true;

  @override


  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 24 * o,
            color: AppTheme.purple,
          ),
        ),
        title: Text(
          "bhvvhh",
          style: TextStyle(
            color: AppTheme.purple,
            fontSize: 16 * h,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
            child: Container(
              height: 24 * o,
              width: 24 * o,
              margin: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                isGrid
                    ? "assets/icons/icons77.svg"
                    : "assets/icons/category.svg",
              ),
            ),
          ),
        ],
      ),
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
                    child: ProductWidget(

                    ),
                  ),
                  SizedBox(width: 16 * w),
                  Expanded(
                    child:
                    ProductWidget(

                    ),
                  ),
                  SizedBox(width: 24 * w),
                ],
              ),
            );
          }),
    );
  }
}
