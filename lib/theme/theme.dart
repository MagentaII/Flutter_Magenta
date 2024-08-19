import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281033611),
      surfaceTint: Color(4281033611),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291618303),
      onPrimaryContainer: Color(4278197809),
      secondary: Color(4280511052),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4289393355),
      onSecondaryContainer: Color(4278198547),
      tertiary: Color(4286077451),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294959007),
      onTertiaryContainer: Color(4280687104),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282468429),
      outline: Color(4285626493),
      outlineVariant: Color(4290824141),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4288204025),
      primaryFixed: Color(4291618303),
      onPrimaryFixed: Color(4278197809),
      primaryFixedDim: Color(4288204025),
      onPrimaryFixedVariant: Color(4278537073),
      secondaryFixed: Color(4289393355),
      onSecondaryFixed: Color(4278198547),
      secondaryFixedDim: Color(4287616432),
      onSecondaryFixedVariant: Color(4278211126),
      tertiaryFixed: Color(4294959007),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4293575020),
      onTertiaryFixedVariant: Color(4284236544),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278208364),
      surfaceTint: Color(4281033611),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282677666),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278209843),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282155361),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283907840),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287655971),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282205257),
      outline: Color(4284047461),
      outlineVariant: Color(4285824129),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4288204025),
      primaryFixed: Color(4282677666),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280836232),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282155361),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280313930),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287655971),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285880072),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199611),
      surfaceTint: Color(4281033611),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208364),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200345),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278209843),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281212928),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283907840),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280165673),
      outline: Color(4282205257),
      outlineVariant: Color(4282205257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4292800255),
      primaryFixed: Color(4278208364),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202443),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278209843),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278203425),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283907840),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282067456),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797413),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288204025),
      surfaceTint: Color(4288204025),
      onPrimary: Color(4278203216),
      primaryContainer: Color(4278537073),
      onPrimaryContainer: Color(4291618303),
      secondary: Color(4287616432),
      onSecondary: Color(4278204452),
      secondaryContainer: Color(4278211126),
      onSecondaryContainer: Color(4289393355),
      tertiary: Color(4293575020),
      onTertiary: Color(4282395904),
      tertiaryContainer: Color(4284236544),
      onTertiaryContainer: Color(4294959007),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112725),
      onSurface: Color(4292797413),
      onSurfaceVariant: Color(4290824141),
      outline: Color(4287271575),
      outlineVariant: Color(4282468429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4281033611),
      primaryFixed: Color(4291618303),
      onPrimaryFixed: Color(4278197809),
      primaryFixedDim: Color(4288204025),
      onPrimaryFixedVariant: Color(4278537073),
      secondaryFixed: Color(4289393355),
      onSecondaryFixed: Color(4278198547),
      secondaryFixedDim: Color(4287616432),
      onSecondaryFixedVariant: Color(4278211126),
      tertiaryFixed: Color(4294959007),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4293575020),
      onTertiaryFixedVariant: Color(4284236544),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288467198),
      surfaceTint: Color(4288204025),
      onPrimary: Color(4278196265),
      primaryContainer: Color(4284651200),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4287879860),
      onSecondary: Color(4278197007),
      secondaryContainer: Color(4284063356),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293838192),
      onTertiary: Color(4280227072),
      tertiaryContainer: Color(4289694781),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294376701),
      onSurfaceVariant: Color(4291153106),
      outline: Color(4288521385),
      outlineVariant: Color(4286416010),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4278668403),
      primaryFixed: Color(4291618303),
      onPrimaryFixed: Color(4278194977),
      primaryFixedDim: Color(4288204025),
      onPrimaryFixedVariant: Color(4278204761),
      secondaryFixed: Color(4289393355),
      onSecondaryFixed: Color(4278195467),
      secondaryFixedDim: Color(4287616432),
      onSecondaryFixedVariant: Color(4278206249),
      tertiaryFixed: Color(4294959007),
      onTertiaryFixed: Color(4279832576),
      tertiaryFixedDim: Color(4293575020),
      onTertiaryFixedVariant: Color(4282856192),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294573055),
      surfaceTint: Color(4288204025),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288467198),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293853170),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4287879860),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966007),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293838192),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291153106),
      outlineVariant: Color(4291153106),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4278201671),
      primaryFixed: Color(4292143615),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288467198),
      onPrimaryFixedVariant: Color(4278196265),
      secondaryFixed: Color(4289656527),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4287879860),
      onSecondaryFixedVariant: Color(4278197007),
      tertiaryFixed: Color(4294960304),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293838192),
      onTertiaryFixedVariant: Color(4280227072),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704862),
      surfaceContainer: Color(4279968034),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
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
     scaffoldBackgroundColor: colorScheme.background,
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
