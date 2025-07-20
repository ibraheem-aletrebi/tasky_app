import 'package:flutter/material.dart';
import 'package:tasky/core/styles/app_assets.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/styles/app_styles.dart';

var darktheme = ThemeData(
  fontFamily: AppAssets.poppinsFontFamily,

  scaffoldBackgroundColor: Color(0xFF181818),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF181818),
    foregroundColor: AppColors.primaryTextDarkColor,
  ),

  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryDarkColor,
    surface: AppColors.secondaryDarkColor,
  ),

  textTheme: TextTheme(
    displayLarge: AppStyles.textStyle32.copyWith(
      color: AppColors.primaryTextDarkColor,
    ),
    titleLarge: AppStyles.textStyle20.copyWith(
      color: AppColors.primaryTextDarkColor,
      overflow: TextOverflow.ellipsis,
    ),
    displaySmall: AppStyles.textStyle20.copyWith(
      color: AppColors.secondaryTextDarkColor,
    ),
    titleMedium: AppStyles.textStyle16.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextDarkColor,
      overflow: TextOverflow.ellipsis,
    ),
    titleSmall: AppStyles.textStyle14.copyWith(
      color: AppColors.secondaryTextDarkColor,
      letterSpacing: .5,
      overflow: TextOverflow.ellipsis,
    ),
  ),

  iconTheme: IconThemeData(color: Colors.white),

  dividerTheme: DividerThemeData(color: AppColors.borderLightColor),

  listTileTheme: ListTileThemeData(
    titleTextStyle: AppStyles.textStyle16.copyWith(
      color: AppColors.primaryTextDarkColor,
      fontWeight: FontWeight.w500,
    ),
  ),

  switchTheme: SwitchThemeData(
    padding: EdgeInsets.zero,
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return Color(0xFF181818);
      return Color(0xFF9E9E9E);
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return Color(0xFFFFFFFF);
      return Color(0xFF9E9E9E);
    }),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryDarkColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.borderLightColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.redColor, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    ),
    hintStyle: AppStyles.textStyle14.copyWith(
      color: AppColors.tertiaryTextDarkColor,
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

  popupMenuTheme: PopupMenuThemeData(
    textStyle: AppStyles.textStyle16.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.primaryTextDarkColor,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFF181818),
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.tertiaryTextDarkColor,
    selectedLabelStyle: AppStyles.textStyle12,
  ),

  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    side: BorderSide(color: Color(0xFF6E6E6E), width: 2),
  ),

  splashFactory: NoSplash.splashFactory,
);
