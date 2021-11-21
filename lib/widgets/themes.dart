import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/color.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: CreateColor.createMaterialColor(
          primaryColor,
        ),
        primaryColor: primaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      );

  // Colors
  static Color primaryColor = const Color(0xFF6B62FF);
  static Color creamColor = const Color(0xFFf5f5f5);
}
