import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
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
      height: 170 * h,
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
                      width: 144,
                      decoration: BoxDecoration(
                        color: AppTheme.milk,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 110 * o,
              width: (MediaQuery.of(context).size.width - 64) / 2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Text(
              "guigyugygy",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                color: const Color(0xFF1C1C1E),
                fontWeight: FontWeight.bold,
                fontSize: 13 * o,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
