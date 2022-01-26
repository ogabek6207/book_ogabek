import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:book_ogabek/src/ui/widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50 * h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24 * w,
                              ),
                              SizedBox(
                                width: 240,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Психология",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppTheme.black,
                                        fontFamily: AppTheme.fontFamilyManrope,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16 * o,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4 * w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/arrow_right.svg",
                                      color: AppTheme.black,
                                      height: 18 * h,
                                      width: 11 * w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24 * h,
                            bottom: 32 * h,
                          ),
                          height: 266 * h,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 24 * w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, position) {
                              return ItemWidget(
                                title: "Джен Синсеро",
                                name:
                                    "НИ СЫ. Будь уверен в своих силах и не поз...",

                                image: "",
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
