import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../no_animation.dart';
import 'color_constants.dart';

ThemeData theme() {
  final builder = NoAnimationPageTransitionBuilder();
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Inter',
    textTheme: textTheme(),
    cardColor: Colors.white,
    primaryColor: const Color.fromRGBO(67, 54, 255, 1),
    splashColor: const Color(0xA34336FF),
    primaryColorLight: const Color(0xA34336FF),
    primaryColorDark: const Color.fromRGBO(0, 37, 234, 1),
    // accentColor: const Color(0x7A1C1C1E),
    hintColor: const Color.fromRGBO(28, 28, 30, 0.72),
    bottomAppBarColor: const Color.fromRGBO(201, 32, 106, 1),
    backgroundColor: Colors.grey.shade100,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: builder,
        TargetPlatform.fuchsia: builder,
        TargetPlatform.iOS: builder,
        TargetPlatform.linux: builder,
        TargetPlatform.macOS: builder,
        TargetPlatform.windows: builder,
      },
    ),
  );
}

TextTheme textTheme() {
  Colors.transparent;
  return TextTheme(
    bodyLarge: GoogleFonts.outfit(
      fontSize: 16.sp,
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 16.sp,
      color: ColorConstants.textColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.outfit(
      fontSize: 12.sp,
      color: const Color.fromRGBO(28, 28, 30, 0.72),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.outfit(
      fontSize: 16.sp,
      color: const Color.fromRGBO(28, 28, 30, 0.72),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 16.sp,
      color: ColorConstants.primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 18.sp,
      color: const Color.fromRGBO(5, 4, 48, 1),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    ),
    // labelLarge: GoogleFonts.inter(
    //   // textStyle: Theme.of(context).textTheme.headline4,
    //   fontSize: 14.sp,
    //   color: const Color.fromRGBO(39, 39, 39, 1),
    //   letterSpacing: 0.4,
    //   fontStyle: FontStyle.normal,
    //   fontWeight: FontWeight.w700,
    // ),
    labelMedium: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 14.sp,
      color: ColorConstants.primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
      color: const Color(0xFFEA2894),
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 16.sp,
      color: ColorConstants.textColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 16.sp,
      color: ColorConstants.primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
    displayLarge: GoogleFonts.outfit(
      // textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 18.sp,
      color: ColorConstants.textColorBlack,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    ),
  );
}