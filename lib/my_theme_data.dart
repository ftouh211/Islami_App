import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    // textTheme: TextTheme(
    //   bodyLarge: GoogleFonts.elMessiri(
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     fontSize: 25,
    //     fontWeight: FontWeight.w500,
    //     color: Colors.white,
    //   ),
    //   bodySmall: GoogleFonts.elMessiri(
    //     fontSize: 20,
    //     fontWeight: FontWeight.normal,
    //     color: AppColors.PrimaryColor,
    //   ),
    // ),
    cardTheme: CardThemeData(color: Colors.white.withValues(alpha: 0.7)),
    colorScheme: ColorScheme.light(
      primary: AppColors.PrimaryColor,
      outline: AppColors.PrimaryColor,
      onSurface: AppColors.TextColor,
      onSecondary: AppColors.TextColor,
      onPrimaryContainer:Colors.white,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight(700),
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xffB7935F),
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: DividerThemeData(thickness: 3, color: AppColors.PrimaryColor),
    dataTableTheme: DataTableThemeData(
      decoration: BoxDecoration(color: AppColors.PrimaryColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(

    // textTheme: TextTheme(
    //   bodyLarge: GoogleFonts.elMessiri(
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white,
    //   ),
    //   bodyMedium: GoogleFonts.elMessiri(
    //     fontSize: 25,
    //     fontWeight: FontWeight.w500,
    //     color: Colors.white,
    //   ),
    //   bodySmall: GoogleFonts.elMessiri(
    //     fontSize: 20,
    //     fontWeight: FontWeight.normal,
    //     color: AppColors.PrimaryColor,
    //   ),
    // ),

    cardTheme: CardThemeData(color: Color(0xff141A2E)),
    colorScheme: ColorScheme.dark(
      primary: AppColors.DarkPrimaryColor,
      outline: AppColors.DarkYellowColor,
      onSurface: AppColors.DarkTextColor,
      onSecondary: AppColors.DarkYellowColor,
      onPrimaryContainer:AppColors.DarkPrimaryColor,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight(700),
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.DarkYellowColor,
      unselectedItemColor: Colors.white,
      backgroundColor: AppColors.DarkPrimaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: DividerThemeData(
      thickness: 3,
      color: AppColors.DarkYellowColor,
    ),
  );
}
