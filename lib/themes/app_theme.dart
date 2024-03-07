import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static const backColor = Colors.white;
  static const mainColor = Color.fromRGBO(0, 183, 255, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(scaffoldBackgroundColor: backColor,
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      fontSize: 100.5,
      fontWeight: FontWeight.bold,
    )
  )
  );
}