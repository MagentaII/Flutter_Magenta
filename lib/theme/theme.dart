import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2c638b),
      surfaceTint: Color(0xff2c638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcce5ff),
      onPrimaryContainer: Color(0xff001d31),
      secondary: Color(0xff256a4b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffabf2c9),
      onSecondaryContainer: Color(0xff002112),
      tertiary: Color(0xff785a0b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdea0),
      onTertiaryContainer: Color(0xff261a00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c1f),
      onSurfaceVariant: Color(0xff4b454d),
      outline: Color(0xff7c757e),
      outlineVariant: Color(0xffcdc3ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff99ccf9),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001d31),
      primaryFixedDim: Color(0xff99ccf9),
      onPrimaryFixedVariant: Color(0xff064b72),
      secondaryFixed: Color(0xffabf2c9),
      onSecondaryFixed: Color(0xff002112),
      secondaryFixedDim: Color(0xff90d5ae),
      onSecondaryFixedVariant: Color(0xff005234),
      tertiaryFixed: Color(0xffffdea0),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xffd6dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00476d),
      surfaceTint: Color(0xff2c638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4579a3),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004d31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3e8160),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff573f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff917023),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c1f),
      onSurfaceVariant: Color(0xff474149),
      outline: Color(0xff645d66),
      outlineVariant: Color(0xff807882),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff99ccf9),
      primaryFixed: Color(0xff4579a3),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff296088),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3e8160),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff226848),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff917023),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff755708),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00243b),
      surfaceTint: Color(0xff2c638b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00476d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002818),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004d31),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e2000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff573f00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff27222a),
      outline: Color(0xff474149),
      outlineVariant: Color(0xff474149),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inversePrimary: Color(0xffdeeeff),
      primaryFixed: Color(0xff00476d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002f4b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004d31),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003420),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff573f00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3b2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff99ccf9),
      surfaceTint: Color(0xff99ccf9),
      onPrimary: Color(0xff003351),
      primaryContainer: Color(0xff064b72),
      onPrimaryContainer: Color(0xffcce5ff),
      secondary: Color(0xff90d5ae),
      onSecondary: Color(0xff003823),
      secondaryContainer: Color(0xff005234),
      onSecondaryContainer: Color(0xffabf2c9),
      tertiary: Color(0xffeac16c),
      onTertiary: Color(0xff402d00),
      tertiaryContainer: Color(0xff5c4300),
      onTertiaryContainer: Color(0xffffdea0),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffdfe3e7),
      onSurfaceVariant: Color(0xffcdc3ce),
      outline: Color(0xff968e98),
      outlineVariant: Color(0xff4b454d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff2c638b),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001d31),
      primaryFixedDim: Color(0xff99ccf9),
      onPrimaryFixedVariant: Color(0xff064b72),
      secondaryFixed: Color(0xffabf2c9),
      onSecondaryFixed: Color(0xff002112),
      secondaryFixedDim: Color(0xff90d5ae),
      onSecondaryFixedVariant: Color(0xff005234),
      tertiaryFixed: Color(0xffffdea0),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff5c4300),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9dd0fe),
      surfaceTint: Color(0xff99ccf9),
      onPrimary: Color(0xff001829),
      primaryContainer: Color(0xff6296c1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff94dab2),
      onSecondary: Color(0xff001b0e),
      secondaryContainer: Color(0xff5b9e7b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeec570),
      onTertiary: Color(0xff1f1400),
      tertiaryContainer: Color(0xffb08c3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1417),
      onSurface: Color(0xfff8fbff),
      onSurfaceVariant: Color(0xffd1c8d2),
      outline: Color(0xffa9a0aa),
      outlineVariant: Color(0xff88818a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff094c73),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001321),
      primaryFixedDim: Color(0xff99ccf9),
      onPrimaryFixedVariant: Color(0xff00395a),
      secondaryFixed: Color(0xffabf2c9),
      onSecondaryFixed: Color(0xff00150a),
      secondaryFixedDim: Color(0xff90d5ae),
      onSecondaryFixedVariant: Color(0xff003f27),
      tertiaryFixed: Color(0xffffdea0),
      onTertiaryFixed: Color(0xff191000),
      tertiaryFixedDim: Color(0xffeac16c),
      onTertiaryFixedVariant: Color(0xff473300),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff99ccf9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9dd0fe),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeefff2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff94dab2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeec570),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9fb),
      outline: Color(0xffd1c8d2),
      outlineVariant: Color(0xffd1c8d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inversePrimary: Color(0xff002d47),
      primaryFixed: Color(0xffd4e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9dd0fe),
      onPrimaryFixedVariant: Color(0xff001829),
      secondaryFixed: Color(0xffaff6cd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff94dab2),
      onSecondaryFixedVariant: Color(0xff001b0e),
      tertiaryFixed: Color(0xffffe4b1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeec570),
      onTertiaryFixedVariant: Color(0xff1f1400),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
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

  List<ExtendedColor> get extendedColors => [];
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
