import 'package:book_ogabek/src/Utils/utils.dart';
import 'package:book_ogabek/src/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String language = "Русский";

  @override


  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.white,
          title: Text(
            "setting",
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              color: AppTheme.purple,
              fontSize: 16 * o,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 24 * h,
              ),


            ],
          ),
        ));
  }


}
