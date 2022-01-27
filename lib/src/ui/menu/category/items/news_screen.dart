import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/ui/book_pages/book_pages_screen.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/ui/menu/player/player_screen.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: ListView.builder(
          padding: EdgeInsets.only(top: 24 * h),
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
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const BookPagesScreen();
                            }),
                          );
                        },
                        child: const ProductWidget()),
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
