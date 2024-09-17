import 'package:flutter/material.dart';
import 'package:blue_collar_app/core/app_colors.dart';

class MainAppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Montserrat",
    //brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey, // Set the border color
          width: 1, // Set the border width
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.blue, // Border color when focused
          width: 1, // Border width when focused
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error border color
          width: 1,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error color when focused
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.lightColor,
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Montserrat",
    //brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(color: Colors.black12),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey, // Set the border color
          width: 1, // Set the border width
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.blue, // Border color when focused
          width: 1, // Border width when focused
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error border color
          width: 1,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.red, // Error color when focused
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.lightColor,
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
    scaffoldBackgroundColor: Colors.black12,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  );
}
