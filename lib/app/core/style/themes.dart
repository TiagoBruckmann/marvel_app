// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:teste_softdesign/app/core/style/app_colors.dart';

class Themes {
  Themes._();

  // light colors
  static const Color _onSecondaryColorLight = AppColors.veryLightGrey;
  static const Color _backgroundColorLight = AppColors.whiteSmoke;
  static const Color _tertiaryColorLight = AppColors.darkGrey;
  static const Color _primaryColorLight = AppColors.alizarin;
  static const Color _secondaryColorLight = AppColors.nero;

  // .****************
  // Theme - Light
  // .****************
  static const DividerThemeData _dividerThemeDataLight = DividerThemeData(
    color: _onSecondaryColorLight,
    indent: 16,
    endIndent: 16,
    thickness: 2,
  );

  static const TextStyle _headlineLargeTextLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: _backgroundColorLight,
    fontSize: 21,
  );

  static const TextStyle _displayLargeTextLight = TextStyle(
    fontWeight: FontWeight.w600,
    color: _secondaryColorLight,
    fontSize: 18,
  );

  static const TextStyle _displayMediumTextLight = TextStyle(
    fontWeight: FontWeight.w500,
    color: _backgroundColorLight,
    fontSize: 17,
  );

  static const TextStyle _labelMediumTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 14,
  );

  static const TextTheme _textThemeLight = TextTheme(
    headlineLarge: _headlineLargeTextLight,
    displayLarge: _displayLargeTextLight,
    displayMedium: _displayMediumTextLight,
    labelMedium: _labelMediumTextLight,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorLight,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorLight,
      ),
      iconTheme: IconThemeData(
        color: _backgroundColorLight,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      indicatorColor: _secondaryColorLight,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryColorLight,
      surfaceTintColor: _secondaryColorLight,
    ),
    textTheme: _textThemeLight,
    colorScheme: const ColorScheme.light(
      background: _backgroundColorLight,
      primary: _primaryColorLight,
      secondary: _secondaryColorLight,
      tertiary: _tertiaryColorLight,
      onSecondary: _onSecondaryColorLight,
    ),
    cardTheme: CardTheme(
      color: _secondaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 10 ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primaryColorLight,
      size: 18,
    ),
    dividerTheme: _dividerThemeDataLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColorLight,
        padding: const EdgeInsets.all(12),
        side: const BorderSide(
          color: _secondaryColorLight,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _secondaryColorLight,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30 ),
      ),
    ),
  );
}