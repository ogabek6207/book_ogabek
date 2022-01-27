import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemWidget extends StatefulWidget {
  final String image;
  final String name;
  final String title;

  const ItemWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.title,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
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
      margin: EdgeInsets.only(
        right: 16 * w,
      ),
      width: 182 * w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
            ),
            child: Image.asset(
              "assets/images/book.png",
            ),
            width: 182 * w,
            height: 182 * h,
          ),
          Container(
            margin: EdgeInsets.only(right: 16 * w),
            child: widget.title.isEmpty
                ? Shimmer.fromColors(
                    child: Container(
                      width: 101 * w,
                      height: 18 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.white,
                      ),
                    ),
                    baseColor: AppTheme.shimmerBaseColor,
                    highlightColor: AppTheme.shimmerHighColor,
                  )
                : Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontFamilyManrope,
                      color: AppTheme.black6A,
                      fontWeight: FontWeight.w600,
                      fontSize: 14 * o,
                    ),
                  ),
          ),
          SizedBox(
            height: 48,
            child: widget.name.isEmpty
                ? Shimmer.fromColors(
                    child: Container(
                      height: 48,
                      width: 182,
                      decoration: BoxDecoration(
                        color: AppTheme.milk,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    baseColor: AppTheme.shimmerBaseColor,
                    highlightColor: AppTheme.shimmerHighColor)
                : Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
