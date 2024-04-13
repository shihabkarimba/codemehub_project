import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  fontFamily: GoogleFonts.robotoFlex().fontFamily,
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    prefixIconColor: Colors.purple,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF004f52), width: 0.5),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 1.5),
        borderRadius: BorderRadius.circular(30)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.red),
    ),
    filled: true,
    fillColor: Colors.white,
    labelStyle: const TextStyle(
      color: Color(0xFF004f52),
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      color: Color(0xFF004f52),
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: const MaterialStatePropertyAll(Size(100, 40)),
      backgroundColor: MaterialStateProperty.all(
        Colors.purple,
      ),
      foregroundColor: MaterialStateProperty.all(
        const Color(0xfff0e8cd),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
      ),
    ),
  ),
);
