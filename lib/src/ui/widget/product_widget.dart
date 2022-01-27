import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
            child: CachedNetworkImage(
              imageUrl: "",
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppTheme.shimmerBaseColor,
                highlightColor: AppTheme.shimmerHighColor,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        color: AppTheme.milk,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 190 * o,
              width: 190 * o,
              fit: BoxFit.cover,
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
              "НИ СЫ. Будь уверен в своих силах и не позв...",
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
