// ignore_for_file: deprecated_member_use, unused_element, duplicate_ignore, prefer_ubuntupolation_to_compose_strings, prefer_const_constructors, depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecargo_app/constance/globle.dart' as globals;

class CoustomTheme {
  static ThemeData getThemeData() {
    if (globals.isLight) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      titleLarge: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.titleLarge!.color,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      titleMedium: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.titleMedium!.color,
          fontSize: 16,
        ),
      ),
      titleSmall: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.titleSmall!.color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyMedium: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.bodyMedium!.color,
          fontSize: 16,
        ),
      ),
      bodyLarge: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: 14,
          color: HexColor("#112950"),
        ),
      ),
      labelLarge: GoogleFonts.ubuntu(
        textStyle: TextStyle(
            color: base.labelLarge!.color,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
      bodySmall: GoogleFonts.ubuntu(
        textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 12),
      ),
      headlineMedium: GoogleFonts.ubuntu(
        textStyle: TextStyle(color: base.headlineMedium!.color, fontSize: 34),
      ),
      displaySmall: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.displaySmall!.color,
          fontSize: 16,
        ),
      ),
      displayMedium: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.displayMedium!.color,
          fontSize: 60,
        ),
      ),
      displayLarge: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.displayLarge!.color,
          fontSize: 96,
        ),
      ),
      headlineSmall: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.headlineSmall!.color,
          fontSize: 24,
        ),
      ),
      labelSmall: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          color: base.labelSmall!.color,
          fontSize: 10,
        ),
      ),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(globals.primary);
    Color secondaryColor = HexColor(globals.secondary);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: const AppBarTheme(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      primaryColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: HexColor("#0065FF"),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: primaryColor,
      disabledColor: HexColor("#D5D7D8"),
      dividerColor: Colors.black.withOpacity(0.8),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)), colorScheme: colorScheme.copyWith(background: Colors.white).copyWith(error: Colors.red),
    );
  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(globals.primary);
    Color secondaryColor = HexColor(globals.secondary);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
      dividerColor: Colors.white.withOpacity(0.8),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.5)),
      dialogBackgroundColor: Colors.black,
      dialogTheme: DialogTheme(
          titleTextStyle: GoogleFonts.sourceSans3(
            color: Colors.white,
            fontSize: 10,
          ),
          contentTextStyle: GoogleFonts.sourceSans3(
            color: Colors.white,
            fontSize: 10,
          ),
          backgroundColor: Colors.black), colorScheme: colorScheme.copyWith(background: Colors.black),
    );
  }

  // ignore: unused_element
  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8,
      margin: EdgeInsets.all(0),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
