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
      backgroundColor: AppTheme.milk,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.milk,
        title: GestureDetector(
          onTap: () {

          },
          child: Container(
            height: 50 * h,
            margin: EdgeInsets.only(
              left: 8 * w,
              right: 8 * w,
            ),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 12 * w,
                ),
                SvgPicture.asset(
                  "assets/icons/search7.svg",
                ),
                SizedBox(
                  width: 8 * w,
                ),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      "to_start_searching",
                      style: TextStyle(
                        color: AppTheme.grey,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppTheme.fontFamilyManrope,
                        height: 22 / 16,
                        fontWeight: FontWeight.w500,
                        fontSize: 16 * o,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24 * w,
                              ),
                              SizedBox(
                                width: 240,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "jjjbbjbjh",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppTheme.primary,
                                        fontFamily:
                                        AppTheme.fontFamilyManrope,
                                        height: 25 / 18,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18 * o,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "all",
                                    style: TextStyle(
                                        fontSize: 14 * o,
                                        height: 19 / 14 * h,
                                        fontFamily:
                                        AppTheme.fontFamilyManrope,
                                        color: AppTheme.grey,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              SizedBox(
                                width: 24 * w,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 12 * h,
                            bottom: 24 * h,
                          ),
                          height: 208 * h,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 24 * w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, position) {
                              return ItemWidget(
                                title: "jhhjjh",
                                name:
                                "jhhjjh",
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
