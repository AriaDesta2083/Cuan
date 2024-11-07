import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff14193F);
Color greyColor = const Color(0xffA4A9AE);
Color lightGreyColor = const Color(0xffF1F1F9);
Color lightBackgroundColor = const Color(0xffF6F8FB);
Color darkBackgroundColor = const Color(0xff020518);
Color blueColor = const Color(0xff53C1F9);
Color orangeColor = const Color(0xffF99819);
Color yellowColor = const Color(0xffFDD670);
Color greenColor = const Color(0xff22B07D);
Color numberBackgroundColor = const Color(0xff1A1D2E);
Color redColor = const Color(0xffFF2566);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

List<BoxShadow> lightShadow = [
  const BoxShadow(
    blurRadius: 8,
    spreadRadius: 0.1,
    color: Colors.black12,  
    offset: Offset(-2, 5),
  )
];


ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xffffbe7c),
      surfaceTint: const Color(0xfffcb975),
      onPrimary: const Color(0xff251200),
      primaryContainer: const Color(0xffc08445),
      onPrimaryContainer: const Color(0xff000000),
      secondary: const Color(0xffe9c770),
      onSecondary: const Color(0xff1e1500),
      secondaryContainer: const Color(0xffab8d3d),
      onSecondaryContainer: const Color(0xff000000),
      tertiary: const Color(0xffc4d09e),
      onTertiary: const Color(0xff111900),
      tertiaryContainer: const Color(0xff8a9668),
      onTertiaryContainer: const Color(0xff000000),
      error: const Color(0xffffbab1),
      onError: const Color(0xff370001),
      errorContainer: const Color(0xffff5449),
      onErrorContainer: const Color(0xff000000),
      surface: const Color(0xff19120c),
      onSurface: const Color(0xfffffaf8),
      onSurfaceVariant: const Color(0xffd9c8b9),
      outline: const Color(0xffb0a093),
      outlineVariant: const Color(0xff8f8074),
      shadow: const Color(0xff000000),
      scrim: const Color(0xff000000),
      inverseSurface: const Color(0xffefe0d5),
      inversePrimary: const Color(0xff6b3d01),
      background: darkBackgroundColor, 
      onBackground: darkBackgroundColor,
    );

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

TextStyle blueTextStyle = GoogleFonts.poppins(
  color: blueColor,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);
TextStyle orangeTextStyle = GoogleFonts.poppins(
  color: orangeColor,
);
TextStyle yellowTextStyle = GoogleFonts.poppins(
  color: yellowColor,
);