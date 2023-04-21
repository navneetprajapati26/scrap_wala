import 'package:flutter/material.dart';

class MyTheme {
  static Color color = const Color(0xFFffcc00);
  static ThemeData lightTheme = ThemeData(
    //fontFamily: 'Roboto',
    primaryColor: color,
    secondaryHeaderColor: Color(0xffe0b400),
    highlightColor:  Color(0xFFD9D8D8),
    disabledColor: Color(0xFFBABFC4),
    brightness: Brightness.light,
    hintColor: Color(0xFF9F9F9F),
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: color)),
    colorScheme: ColorScheme.light(primary: color, secondary: color).copyWith(background: Color(0xFFF3F3F3)).copyWith(error: Color(0xFFE84D4F)),
  );

                                                                                                                         

  static ThemeData darkTheme = ThemeData(
    //fontFamily: 'Roboto',
    primaryColor: color,
    secondaryHeaderColor: Color(0xffe0b400),
    highlightColor:  Color(0xff363333),
    disabledColor: Color(0xffa2a7ad),
    brightness: Brightness.dark,
    hintColor: Color(0xFFbebebe),
    cardColor: Colors.black,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: color)),
    colorScheme: ColorScheme.dark(primary: color, secondary: color).copyWith(background: Color(0xFF343636)).copyWith(error: Color(0xFFdd3135)),
    // add more properties here
  );


}
