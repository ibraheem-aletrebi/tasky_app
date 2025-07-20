import 'package:flutter/material.dart';

import 'package:tasky/core/styles/app_assets.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/styles/app_styles.dart';

var lightTheme = ThemeData(
  fontFamily: AppAssets.poppinsFontFamily,

  scaffoldBackgroundColor: Color(0xFFF6F7F9),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    foregroundColor: AppColors.primaryTextLightColor,
  ),

  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryTextLightColor,
    surface: AppColors.secondaryLightColor,
  ),

  textTheme: TextTheme(
    displayLarge: AppStyles.textStyle32.copyWith(
      color: AppColors.primaryTextLightColor,
    ),
    displaySmall: AppStyles.textStyle20.copyWith(
      color: AppColors.primaryTextLightColor,
    ),
    titleLarge: AppStyles.textStyle20.copyWith(
      color: AppColors.primaryTextLightColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleMedium: AppStyles.textStyle16.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextLightColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: AppStyles.textStyle14.copyWith(
      color: AppColors.secondaryTextLightColor,
      letterSpacing: .5,
      overflow: TextOverflow.ellipsis,
    ),
  ),

  iconTheme: IconThemeData(color: Colors.black),

  dividerTheme: DividerThemeData(color: AppColors.borderLightColor),

  listTileTheme: ListTileThemeData(
    titleTextStyle: AppStyles.textStyle16.copyWith(
      color: AppColors.primaryTextLightColor,
      fontWeight: FontWeight.w500,
    ),
  ),

  switchTheme: SwitchThemeData(
    padding: EdgeInsets.zero,
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return Color(0xFFFFFFFF);
      return Color(0xFF9E9E9E);
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return Color(0xFFFFFFFF);
      return Color(0xFF9E9E9E);
    }),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryLightColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.borderLightColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.redColor, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.borderLightColor, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    ),
    hintStyle: AppStyles.textStyle14.copyWith(
      color: AppColors.tertiaryTextLightColor,
      fontWeight: FontWeight.w400,
    ),
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor,
    selectionHandleColor: AppColors.primaryColor,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.secondaryLightColor,
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.secondaryLightColor,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFFF6F7F9),
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.tertiaryTextLightColor,
    selectedLabelStyle: AppStyles.textStyle12,
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: BorderSide(color: Color(0xFFD1DAD6), width: 2),
  ),
  splashFactory: NoSplash.splashFactory,
);
