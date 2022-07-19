import 'package:flutter/material.dart';

class MyConstant {
  //field

  static var typeUsers = <String>['Buyer', 'Seller', 'Ridder', ];

  static Color primary = const Color.fromARGB(255, 228, 191, 23);
  static Color dark = const Color.fromARGB(255, 4, 17, 29);
  static Color light = const Color.fromARGB(255, 46, 130, 238);
  static Color active = const Color.fromARGB(255, 30, 77, 186);

  //method
  TextStyle h1Style() {
    return TextStyle(
      color: dark,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

   TextStyle h2Style() {
    return TextStyle(
      color: dark,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

   TextStyle h3Style() {
    return TextStyle(
      color: dark,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

   TextStyle h3ActiveStyle() {
    return TextStyle(
      color: active,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }


}
