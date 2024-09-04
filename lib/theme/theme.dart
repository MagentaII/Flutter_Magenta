import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2b638b),
      surfaceTint: Color(0xff2b638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcce5ff),
      onPrimaryContainer: Color(0xff001e31),
      secondary: Color(0xff236a4c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffaaf2cb),
      onSecondaryContainer: Color(0xff002113),
      tertiary: Color(0xff785a0b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdf9f),
      onTertiaryContainer: Color(0xff261a00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff41484d),
      outline: Color(0xff71787d),
      outlineVariant: Color(0xffc0c7cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff98ccf9),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001e31),
      primaryFixedDim: Color(0xff98ccf9),
      onPrimaryFixedVariant: Color(0xff054b71),
      secondaryFixed: Color(0xffaaf2cb),
      onSecondaryFixed: Color(0xff002113),
      secondaryFixedDim: Color(0xff8fd5b0),
      onSecondaryFixedVariant: Color(0xff005236),
      tertiaryFixed: Color(0xffffdf9f),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00476c),
      surfaceTint: Color(0xff2b638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4479a2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004d33),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3c8161),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff573f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff907023),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3d4449),
      outline: Color(0xff596065),
      outlineVariant: Color(0xff747c81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff98ccf9),
      primaryFixed: Color(0xff4479a2),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff286088),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3c8161),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff20684a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff907023),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff755708),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00253b),
      surfaceTint: Color(0xff2b638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00476c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002819),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004d33),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e2000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff573f00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1e2529),
      outline: Color(0xff3d4449),
      outlineVariant: Color(0xff3d4449),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffdeeeff),
      primaryFixed: Color(0xff00476c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00304b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004d33),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003421),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff573f00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3b2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff98ccf9),
      surfaceTint: Color(0xff98ccf9),
      onPrimary: Color(0xff003350),
      primaryContainer: Color(0xff054b71),
      onPrimaryContainer: Color(0xffcce5ff),
      secondary: Color(0xff8fd5b0),
      onSecondary: Color(0xff003824),
      secondaryContainer: Color(0xff005236),
      onSecondaryContainer: Color(0xffaaf2cb),
      tertiary: Color(0xffeac16c),
      onTertiary: Color(0xff402d00),
      tertiaryContainer: Color(0xff5c4300),
      onTertiaryContainer: Color(0xffffdf9f),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffc0c7cd),
      outline: Color(0xff8a9297),
      outlineVariant: Color(0xff41484d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff2b638b),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001e31),
      primaryFixedDim: Color(0xff98ccf9),
      onPrimaryFixedVariant: Color(0xff054b71),
      secondaryFixed: Color(0xffaaf2cb),
      onSecondaryFixed: Color(0xff002113),
      secondaryFixedDim: Color(0xff8fd5b0),
      onSecondaryFixedVariant: Color(0xff005236),
      tertiaryFixed: Color(0xffffdf9f),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9cd0fe),
      surfaceTint: Color(0xff98ccf9),
      onPrimary: Color(0xff001829),
      primaryContainer: Color(0xff6296c0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff93dab4),
      onSecondary: Color(0xff001b0f),
      secondaryContainer: Color(0xff599e7c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeec570),
      onTertiary: Color(0xff1f1500),
      tertiaryContainer: Color(0xffaf8c3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfd),
      onSurfaceVariant: Color(0xffc5ccd2),
      outline: Color(0xff9da4a9),
      outlineVariant: Color(0xff7d848a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff074c73),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001321),
      primaryFixedDim: Color(0xff98ccf9),
      onPrimaryFixedVariant: Color(0xff003959),
      secondaryFixed: Color(0xffaaf2cb),
      onSecondaryFixed: Color(0xff00150b),
      secondaryFixedDim: Color(0xff8fd5b0),
      onSecondaryFixedVariant: Color(0xff003f29),
      tertiaryFixed: Color(0xffffdf9f),
      onTertiaryFixed: Color(0xff191000),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff473300),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff98ccf9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9cd0fe),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeefff2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff93dab4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeec570),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff8fbff),
      outline: Color(0xffc5ccd2),
      outlineVariant: Color(0xffc5ccd2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff002d47),
      primaryFixed: Color(0xffd4e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9cd0fe),
      onPrimaryFixedVariant: Color(0xff001829),
      secondaryFixed: Color(0xffaef6cf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff93dab4),
      onSecondaryFixedVariant: Color(0xff001b0f),
      tertiaryFixed: Color(0xffffe4b0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeec570),
      onTertiaryFixedVariant: Color(0xff1f1500),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
