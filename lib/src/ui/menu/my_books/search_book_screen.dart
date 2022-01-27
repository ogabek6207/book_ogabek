import 'package:book_ogabek/src/ui/book_pages/book_pages_screen.dart';
import 'package:book_ogabek/src/ui/widget/product_widget.dart';
import 'package:book_ogabek/src/utils/app_theme.dart';
import 'package:book_ogabek/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBookScreen extends StatefulWidget {
  const SearchBookScreen({Key? key}) : super(key: key);

  @override
  _SearchBookScreenState createState() => _SearchBookScreenState();
}

class _SearchBookScreenState extends State<SearchBookScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60 * h,
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 19 * w, right: 16 * w),
                  width: 302 * w,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  decoration: BoxDecoration(
                    color: AppTheme.milk,
                    borderRadius: BorderRadius.circular(8 * o),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/search.svg",
                      ),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Поиск по моим книгам",
                            hintStyle: TextStyle(
                              color: AppTheme.black9E,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyManrope,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.text = "";
                    });
                  },
                  child:   Text(
                    "Отменить",
                    style: TextStyle(
                      color: AppTheme.black6A,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontFamilyManrope,
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 24*h,),
          Expanded(child: ListView.builder(
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
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return  const BookPagesScreen();
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
              }),)
        ],
      ),
    );
  }
}
