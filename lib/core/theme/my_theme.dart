import 'package:flutter/material.dart';

class MyTheme {
  static const Color mainColor = Color(0xff004182);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff2F2929);




  static ThemeData lightTheme = ThemeData(
   primaryColor: mainColor,
   textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: MyTheme.whiteColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: MyTheme.whiteColor,
    ),
   ),
  );
}
