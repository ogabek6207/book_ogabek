import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {
  final String image;
  final String name;

  const ProductListWidget({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 24 * w,
        vertical: 8 * h,
      ),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8*o),
            ),
            height: 110 * o,
            width: 110 * o,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8*o),
              child: CachedNetworkImage(
                imageUrl: widget.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 110 * o,
                width: 110 * o,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 16 * w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4 * h,
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                    color: AppTheme.dark,
                    fontSize: 14 * o,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
