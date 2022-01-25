import 'package:book_ogabek/src/ui/company/company_screen.dart';
import 'package:book_ogabek/src/ui/home/home_screen.dart';
import 'package:book_ogabek/src/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),

            ),
            tabs: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Text("dfgfv"),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Text("dfgfv"),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Text("dfgfv"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            SettingScreen(),
            ProductScreen(),
          ],
        ),
      ),
    );
  }
}
