// import "package:flutter/material.dart";

// class MaterialTheme {
//   final TextTheme textTheme;

//   const MaterialTheme(this.textTheme);

//   static ColorScheme lightScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(0xff855318),
//       surfaceTint: Color(0xff855318),
//       onPrimary: Color(0xffffffff),
//       primaryContainer: Color(0xffffdcbe),
//       onPrimaryContainer: Color(0xff2c1600),
//       secondary: Color(0xff745b0c),
//       onSecondary: Color(0xffffffff),
//       secondaryContainer: Color(0xffffdf92),
//       onSecondaryContainer: Color(0xff241a00),
//       tertiary: Color(0xff58633a),
//       onTertiary: Color(0xffffffff),
//       tertiaryContainer: Color(0xffdce8b4),
//       onTertiaryContainer: Color(0xff161f01),
//       error: Color(0xffba1a1a),
//       onError: Color(0xffffffff),
//       errorContainer: Color(0xffffdad6),
//       onErrorContainer: Color(0xff410002),
//       surface: Color(0xfffff8f5),
//       onSurface: Color(0xff211a14),
//       onSurfaceVariant: Color(0xff51453a),
//       outline: Color(0xff837468),
//       outlineVariant: Color(0xffd5c3b5),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xff372f28),
//       inversePrimary: Color(0xfffcb975), background: null,
//     );
//   }

//   ThemeData light() {
//     return theme(lightScheme());
//   }

//   static ColorScheme lightMediumContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(0xff643900),
//       surfaceTint: Color(0xff855318),
//       onPrimary: Color(0xffffffff),
//       primaryContainer: Color(0xff9f692c),
//       onPrimaryContainer: Color(0xffffffff),
//       secondary: Color(0xff544000),
//       onSecondary: Color(0xffffffff),
//       secondaryContainer: Color(0xff8c7123),
//       onSecondaryContainer: Color(0xffffffff),
//       tertiary: Color(0xff3c4721),
//       onTertiary: Color(0xffffffff),
//       tertiaryContainer: Color(0xff6e794e),
//       onTertiaryContainer: Color(0xffffffff),
//       error: Color(0xff8c0009),
//       onError: Color(0xffffffff),
//       errorContainer: Color(0xffda342e),
//       onErrorContainer: Color(0xffffffff),
//       surface: Color(0xfffff8f5),
//       onSurface: Color(0xff211a14),
//       onSurfaceVariant: Color(0xff4c4136),
//       outline: Color(0xff6a5d51),
//       outlineVariant: Color(0xff87786c),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xff372f28),
//       inversePrimary: Color(0xfffcb975),
//       primaryFixed: Color(0xff9f692c),
//       onPrimaryFixed: Color(0xffffffff),
//       primaryFixedDim: Color(0xff825115),
//       onPrimaryFixedVariant: Color(0xffffffff),
//       secondaryFixed: Color(0xff8c7123),
//       onSecondaryFixed: Color(0xffffffff),
//       secondaryFixedDim: Color(0xff725908),
//       onSecondaryFixedVariant: Color(0xffffffff),
//       tertiaryFixed: Color(0xff6e794e),
//       onTertiaryFixed: Color(0xffffffff),
//       tertiaryFixedDim: Color(0xff556038),
//       onTertiaryFixedVariant: Color(0xffffffff),
//       surfaceDim: Color(0xffe6d7cd),
//       surfaceBright: Color(0xfffff8f5),
//       surfaceContainerLowest: Color(0xffffffff),
//       surfaceContainerLow: Color(0xfffff1e7),
//       surfaceContainer: Color(0xfffaebe0),
//       surfaceContainerHigh: Color(0xfff4e6db),
//       surfaceContainerHighest: Color(0xffefe0d5),
//     );
//   }

//   ThemeData lightMediumContrast() {
//     return theme(lightMediumContrastScheme());
//   }

//   static ColorScheme lightHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(0xff361c00),
//       surfaceTint: Color(0xff855318),
//       onPrimary: Color(0xffffffff),
//       primaryContainer: Color(0xff643900),
//       onPrimaryContainer: Color(0xffffffff),
//       secondary: Color(0xff2c2100),
//       onSecondary: Color(0xffffffff),
//       secondaryContainer: Color(0xff544000),
//       onSecondaryContainer: Color(0xffffffff),
//       tertiary: Color(0xff1c2504),
//       onTertiary: Color(0xffffffff),
//       tertiaryContainer: Color(0xff3c4721),
//       onTertiaryContainer: Color(0xffffffff),
//       error: Color(0xff4e0002),
//       onError: Color(0xffffffff),
//       errorContainer: Color(0xff8c0009),
//       onErrorContainer: Color(0xffffffff),
//       surface: Color(0xfffff8f5),
//       onSurface: Color(0xff000000),
//       onSurfaceVariant: Color(0xff2c2219),
//       outline: Color(0xff4c4136),
//       outlineVariant: Color(0xff4c4136),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xff372f28),
//       inversePrimary: Color(0xffffe8d5),
//       primaryFixed: Color(0xff643900),
//       onPrimaryFixed: Color(0xffffffff),
//       primaryFixedDim: Color(0xff442500),
//       onPrimaryFixedVariant: Color(0xffffffff),
//       secondaryFixed: Color(0xff544000),
//       onSecondaryFixed: Color(0xffffffff),
//       secondaryFixedDim: Color(0xff392b00),
//       onSecondaryFixedVariant: Color(0xffffffff),
//       tertiaryFixed: Color(0xff3c4721),
//       onTertiaryFixed: Color(0xffffffff),
//       tertiaryFixedDim: Color(0xff27300d),
//       onTertiaryFixedVariant: Color(0xffffffff),
//       surfaceDim: Color(0xffe6d7cd),
//       surfaceBright: Color(0xfffff8f5),
//       surfaceContainerLowest: Color(0xffffffff),
//       surfaceContainerLow: Color(0xfffff1e7),
//       surfaceContainer: Color(0xfffaebe0),
//       surfaceContainerHigh: Color(0xfff4e6db),
//       surfaceContainerHighest: Color(0xffefe0d5),
//     );
//   }

//   ThemeData lightHighContrast() {
//     return theme(lightHighContrastScheme());
//   }

//   static ColorScheme darkScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(0xfffcb975),
//       surfaceTint: Color(0xfffcb975),
//       onPrimary: Color(0xff4a2800),
//       primaryContainer: Color(0xff693c00),
//       onPrimaryContainer: Color(0xffffdcbe),
//       secondary: Color(0xffe5c36c),
//       onSecondary: Color(0xff3e2e00),
//       secondaryContainer: Color(0xff594400),
//       onSecondaryContainer: Color(0xffffdf92),
//       tertiary: Color(0xffc0cc9a),
//       onTertiary: Color(0xff2a3410),
//       tertiaryContainer: Color(0xff404b24),
//       onTertiaryContainer: Color(0xffdce8b4),
//       error: Color(0xffffb4ab),
//       onError: Color(0xff690005),
//       errorContainer: Color(0xff93000a),
//       onErrorContainer: Color(0xffffdad6),
//       surface: Color(0xff19120c),
//       onSurface: Color(0xffefe0d5),
//       onSurfaceVariant: Color(0xffd5c3b5),
//       outline: Color(0xff9d8e81),
//       outlineVariant: Color(0xff51453a),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xffefe0d5),
//       inversePrimary: Color(0xff855318),
//       primaryFixed: Color(0xffffdcbe),
//       onPrimaryFixed: Color(0xff2c1600),
//       primaryFixedDim: Color(0xfffcb975),
//       onPrimaryFixedVariant: Color(0xff693c00),
//       secondaryFixed: Color(0xffffdf92),
//       onSecondaryFixed: Color(0xff241a00),
//       secondaryFixedDim: Color(0xffe5c36c),
//       onSecondaryFixedVariant: Color(0xff594400),
//       tertiaryFixed: Color(0xffdce8b4),
//       onTertiaryFixed: Color(0xff161f01),
//       tertiaryFixedDim: Color(0xffc0cc9a),
//       onTertiaryFixedVariant: Color(0xff404b24),
//       surfaceDim: Color(0xff19120c),
//       surfaceBright: Color(0xff403830),
//       surfaceContainerLowest: Color(0xff130d07),
//       surfaceContainerLow: Color(0xff211a14),
//       surfaceContainer: Color(0xff261e18),
//       surfaceContainerHigh: Color(0xff302921),
//       surfaceContainerHighest: Color(0xff3c332c),
//     );
//   }

//   ThemeData dark() {
//     return theme(darkScheme());
//   }

//   static ColorScheme darkMediumContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(0xffffbe7c),
//       surfaceTint: Color(0xfffcb975),
//       onPrimary: Color(0xff251200),
//       primaryContainer: Color(0xffc08445),
//       onPrimaryContainer: Color(0xff000000),
//       secondary: Color(0xffe9c770),
//       onSecondary: Color(0xff1e1500),
//       secondaryContainer: Color(0xffab8d3d),
//       onSecondaryContainer: Color(0xff000000),
//       tertiary: Color(0xffc4d09e),
//       onTertiary: Color(0xff111900),
//       tertiaryContainer: Color(0xff8a9668),
//       onTertiaryContainer: Color(0xff000000),
//       error: Color(0xffffbab1),
//       onError: Color(0xff370001),
//       errorContainer: Color(0xffff5449),
//       onErrorContainer: Color(0xff000000),
//       surface: Color(0xff19120c),
//       onSurface: Color(0xfffffaf8),
//       onSurfaceVariant: Color(0xffd9c8b9),
//       outline: Color(0xffb0a093),
//       outlineVariant: Color(0xff8f8074),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xffefe0d5),
//       inversePrimary: Color(0xff6b3d01),
//       primaryFixed: Color(0xffffdcbe),
//       onPrimaryFixed: Color(0xff1e0d00),
//       primaryFixedDim: Color(0xfffcb975),
//       onPrimaryFixedVariant: Color(0xff522d00),
//       secondaryFixed: Color(0xffffdf92),
//       onSecondaryFixed: Color(0xff181000),
//       secondaryFixedDim: Color(0xffe5c36c),
//       onSecondaryFixedVariant: Color(0xff453400),
//       tertiaryFixed: Color(0xffdce8b4),
//       onTertiaryFixed: Color(0xff0d1300),
//       tertiaryFixedDim: Color(0xffc0cc9a),
//       onTertiaryFixedVariant: Color(0xff303a15),
//       surfaceDim: Color(0xff19120c),
//       surfaceBright: Color(0xff403830),
//       surfaceContainerLowest: Color(0xff130d07),
//       surfaceContainerLow: Color(0xff211a14),
//       surfaceContainer: Color(0xff261e18),
//       surfaceContainerHigh: Color(0xff302921),
//       surfaceContainerHighest: Color(0xff3c332c),
//     );
//   }

//   ThemeData darkMediumContrast() {
//     return theme(darkMediumContrastScheme());
//   }

//   static ColorScheme darkHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(0xfffffaf8),
//       surfaceTint: Color(0xfffcb975),
//       onPrimary: Color(0xff000000),
//       primaryContainer: Color(0xffffbe7c),
//       onPrimaryContainer: Color(0xff000000),
//       secondary: Color(0xfffffaf6),
//       onSecondary: Color(0xff000000),
//       secondaryContainer: Color(0xffe9c770),
//       onSecondaryContainer: Color(0xff000000),
//       tertiary: Color(0xfff6ffd7),
//       onTertiary: Color(0xff000000),
//       tertiaryContainer: Color(0xffc4d09e),
//       onTertiaryContainer: Color(0xff000000),
//       error: Color(0xfffff9f9),
//       onError: Color(0xff000000),
//       errorContainer: Color(0xffffbab1),
//       onErrorContainer: Color(0xff000000),
//       surface: Color(0xff19120c),
//       onSurface: Color(0xffffffff),
//       onSurfaceVariant: Color(0xfffffaf8),
//       outline: Color(0xffd9c8b9),
//       outlineVariant: Color(0xffd9c8b9),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xffefe0d5),
//       inversePrimary: Color(0xff412300),
//       primaryFixed: Color(0xffffe2c8),
//       onPrimaryFixed: Color(0xff000000),
//       primaryFixedDim: Color(0xffffbe7c),
//       onPrimaryFixedVariant: Color(0xff251200),
//       secondaryFixed: Color(0xffffe4a5),
//       onSecondaryFixed: Color(0xff000000),
//       secondaryFixedDim: Color(0xffe9c770),
//       onSecondaryFixedVariant: Color(0xff1e1500),
//       tertiaryFixed: Color(0xffe0edb8),
//       onTertiaryFixed: Color(0xff000000),
//       tertiaryFixedDim: Color(0xffc4d09e),
//       onTertiaryFixedVariant: Color(0xff111900),
//       surfaceDim: Color(0xff19120c),
//       surfaceBright: Color(0xff403830),
//       surfaceContainerLowest: Color(0xff130d07),
//       surfaceContainerLow: Color(0xff211a14),
//       surfaceContainer: Color(0xff261e18),
//       surfaceContainerHigh: Color(0xff302921),
//       surfaceContainerHighest: Color(0xff3c332c),
//     );
//   }

//   ThemeData darkHighContrast() {
//     return theme(darkHighContrastScheme());
//   }


//   ThemeData theme(ColorScheme colorScheme) => ThemeData(
//      useMaterial3: true,
//      brightness: colorScheme.brightness,
//      colorScheme: colorScheme,
//      textTheme: textTheme.apply(
//        bodyColor: colorScheme.onSurface,
//        displayColor: colorScheme.onSurface,
//      ),
//      scaffoldBackgroundColor: colorScheme.background,
//      canvasColor: colorScheme.surface,
//   );


//   List<ExtendedColor> get extendedColors => [
//   ];
// }

// class ExtendedColor {
//   final Color seed, value;
//   final ColorFamily light;
//   final ColorFamily lightHighContrast;
//   final ColorFamily lightMediumContrast;
//   final ColorFamily dark;
//   final ColorFamily darkHighContrast;
//   final ColorFamily darkMediumContrast;

//   const ExtendedColor({
//     required this.seed,
//     required this.value,
//     required this.light,
//     required this.lightHighContrast,
//     required this.lightMediumContrast,
//     required this.dark,
//     required this.darkHighContrast,
//     required this.darkMediumContrast,
//   });
// }

// class ColorFamily {
//   const ColorFamily({
//     required this.color,
//     required this.onColor,
//     required this.colorContainer,
//     required this.onColorContainer,
//   });

//   final Color color;
//   final Color onColor;
//   final Color colorContainer;
//   final Color onColorContainer;
// }
