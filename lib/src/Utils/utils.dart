import 'package:flutter/cupertino.dart';

class Utils {
  static double windowHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 926;
  }

  static double windowWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 428;
  }
}
