import 'package:barbershop/src/core/ui/constants/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: ColorsConstants.grey,
    ),
  );

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsConstants.brow),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.black,
          fontFamily: FontsConstants.fontFamily,
        )),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: ColorsConstants.grey,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(
          color: ColorsConstants.red,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorsConstants.brow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorsConstants.brow,
          width: 1
        ),
        foregroundColor: ColorsConstants.brow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: FontsConstants.fontFamily,
  );
}
