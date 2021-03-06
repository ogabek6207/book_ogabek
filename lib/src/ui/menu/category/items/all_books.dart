import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/ui/widget/book_widget.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/ui/menu/player/player_screen.dart';
import 'package:flutter/material.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({Key? key}) : super(key: key);

  @override
  _AllBooksScreenState createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  @override
  // void initState() {
  //   bookBloc.getBook();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16 * h),
        itemCount: (10 + 1) ~/ 2,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 30 * h,
            ),
            child: Row(
              children: [
                SizedBox(width: 16 * w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PlayerScreen(
                              onBack: () {},
                            );
                          },
                        ),
                      );
                    },
                    child: const BookWidget(
                      name: "НИ СЫ. Будь уверен в своих силах и не позв...",
                      image: "assets/images/book.png",
                    ),
                  ),
                ),
                SizedBox(width: 16 * w),
                const Expanded(
                  child: BookWidget(
                    name: "НИ СЫ. Будь уверен в своих силах и не позв...",
                    image: "assets/images/book.png",
                  ),
                ),
                SizedBox(width: 16 * w),
              ],
            ),
          );
        },
      ),
    );
  }
}
