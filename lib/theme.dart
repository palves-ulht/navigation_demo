import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFA22522),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    primaryTextTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFFF3D9B1),
      unselectedItemColor: Color(0xFFC29979),
      selectedItemColor: Colors.black87,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFFC33149),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC33149),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
      labelStyle: TextStyle(color: Colors.black),
      prefixIconColor: Colors.black,
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    )
  );
}
