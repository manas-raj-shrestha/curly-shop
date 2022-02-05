import 'package:flutter/material.dart';
import 'package:unit_test/core/extensions/hex_color_extension.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.purple[100],
      ));

  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: HexColor.fromHex('#2D4263')),
        primaryColor: Colors.grey[600],
        scaffoldBackgroundColor: HexColor.fromHex('#191919'),
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        cardTheme: CardTheme(color: HexColor.fromHex('#2D4263')),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: HexColor.fromHex('#C84B31'))));
  }
}
