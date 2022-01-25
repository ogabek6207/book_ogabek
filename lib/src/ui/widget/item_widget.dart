import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
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
      width: 140 * w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8 * o),
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  height: 128 * h,
                  width: 140 * w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            width: 144 * w,
            height: 128 * h,
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            margin: EdgeInsets.only(left: 16 * w, right: 16 * w),
            child: widget.title.isEmpty
                ? Shimmer.fromColors(
                    child: Container(
                      width: 70 * w,
                      height: 16 * h,
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
                      overflow: TextOverflow.ellipsis,
                      height: 4 / 3 * h,
                      fontFamily: AppTheme.fontFamilyManrope,
                      color: AppTheme.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12 * o,
                    ),
                  ),
          ),
          Container(
            height: 48,
            child: widget.name.isEmpty
                ? Shimmer.fromColors(
                    child: Container(
                      height: 20,
                      width: 80,
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
                      color: AppTheme.dark,
                      fontSize: 14 * o,
                      height: 19 / 14 * h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            margin: EdgeInsets.only(
              left: 16 * w,
              right: 16 * w,
            ),
          ),
        ],
      ),
    );
  }
}
