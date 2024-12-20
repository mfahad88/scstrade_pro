import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282476597),
      surfaceTint: Color(4282476597),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290965422),
      onPrimaryContainer: Color(4278329600),
      secondary: Color(4282476597),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290899886),
      onSecondaryContainer: Color(4278329600),
      tertiary: Color(4278217068),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288475636),
      onTertiaryContainer: Color(4278198305),
      error: Color(4287646528),
      onError: Color(4294967295),
      errorContainer: Color(4294957780),
      onErrorContainer: Color(4281993477),
      background: Color(4294507248),
      onBackground: Color(4279835927),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      surfaceVariant: Color(4293321681),
      onSurfaceVariant: Color(4282926906),
      outline: Color(4286150761),
      outlineVariant: Color(4291479478),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inverseOnSurface: Color(4293718771),
      inversePrimary: Color(4289123220),
      primaryFixed: Color(4290965422),
      onPrimaryFixed: Color(4278329600),
      primaryFixedDim: Color(4289123220),
      onPrimaryFixedVariant: Color(4280962847),
      secondaryFixed: Color(4290899886),
      onSecondaryFixed: Color(4278329600),
      secondaryFixedDim: Color(4289123220),
      onSecondaryFixedVariant: Color(4280962847),
      tertiaryFixed: Color(4288475636),
      onTertiaryFixed: Color(4278198305),
      tertiaryFixedDim: Color(4286633175),
      onTertiaryFixedVariant: Color(4278210386),
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
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280699676),
      surfaceTint: Color(4282476597),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283924297),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280699676),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283858761),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209357),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280516996),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411367),
      onError: Color(4294967295),
      errorContainer: Color(4289355860),
      onErrorContainer: Color(4294967295),
      background: Color(4294507248),
      onBackground: Color(4279835927),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      surfaceVariant: Color(4293321681),
      onSurfaceVariant: Color(4282663734),
      outline: Color(4284571729),
      outlineVariant: Color(4286413676),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inverseOnSurface: Color(4293718771),
      inversePrimary: Color(4289123220),
      primaryFixed: Color(4283924297),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282344754),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283858761),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282279219),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280516996),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216554),
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
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278397184),
      surfaceTint: Color(4282476597),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280699676),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278397184),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280699676),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200104),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209357),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650634),
      onError: Color(4294967295),
      errorContainer: Color(4285411367),
      onErrorContainer: Color(4294967295),
      background: Color(4294507248),
      onBackground: Color(4279835927),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293321681),
      onSurfaceVariant: Color(4280624153),
      outline: Color(4282663734),
      outlineVariant: Color(4282663734),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4291557815),
      primaryFixed: Color(4280699676),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279186439),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280699676),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279186439),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209357),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203188),
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
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289123220),
      surfaceTint: Color(4289123220),
      onPrimary: Color(4279449610),
      primaryContainer: Color(4280962847),
      onPrimaryContainer: Color(4290965422),
      secondary: Color(4289123220),
      onSecondary: Color(4279449610),
      secondaryContainer: Color(4280962847),
      onSecondaryContainer: Color(4290899886),
      tertiary: Color(4286633175),
      onTertiary: Color(4278204216),
      tertiaryContainer: Color(4278210386),
      onTertiaryContainer: Color(4288475636),
      error: Color(4294948008),
      onError: Color(4283833878),
      errorContainer: Color(4285740075),
      onErrorContainer: Color(4294957780),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279112725),
      onSurface: Color(4292797413),
      surfaceVariant: Color(4282926906),
      onSurfaceVariant: Color(4291479478),
      outline: Color(4287861121),
      outlineVariant: Color(4282926906),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inverseOnSurface: Color(4281020723),
      inversePrimary: Color(4282476597),
      primaryFixed: Color(4290965422),
      onPrimaryFixed: Color(4278329600),
      primaryFixedDim: Color(4289123220),
      onPrimaryFixedVariant: Color(4280962847),
      secondaryFixed: Color(4290899886),
      onSecondaryFixed: Color(4278329600),
      secondaryFixedDim: Color(4289123220),
      onSecondaryFixedVariant: Color(4280962847),
      tertiaryFixed: Color(4288475636),
      onTertiaryFixed: Color(4278198305),
      tertiaryFixedDim: Color(4286633175),
      onTertiaryFixedVariant: Color(4278210386),
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
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289386392),
      surfaceTint: Color(4289123220),
      onPrimary: Color(4278328064),
      primaryContainer: Color(4285701219),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289386392),
      onSecondary: Color(4278262528),
      secondaryContainer: Color(4285701219),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4286896348),
      onTertiary: Color(4278196763),
      tertiaryContainer: Color(4282883489),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949551),
      onError: Color(4281533698),
      errorContainer: Color(4291591023),
      onErrorContainer: Color(4278190080),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279112725),
      onSurface: Color(4294376701),
      surfaceVariant: Color(4282926906),
      onSurfaceVariant: Color(4291742650),
      outline: Color(4289110931),
      outlineVariant: Color(4287005812),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inverseOnSurface: Color(4280625964),
      inversePrimary: Color(4281028896),
      primaryFixed: Color(4290965422),
      onPrimaryFixed: Color(4278261248),
      primaryFixedDim: Color(4289123220),
      onPrimaryFixedVariant: Color(4279844368),
      secondaryFixed: Color(4290899886),
      onSecondaryFixed: Color(4278261248),
      secondaryFixedDim: Color(4289123220),
      onSecondaryFixedVariant: Color(4279844368),
      tertiaryFixed: Color(4288475636),
      onTertiaryFixed: Color(4278195221),
      tertiaryFixedDim: Color(4286633175),
      onTertiaryFixedVariant: Color(4278205759),
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
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294115303),
      surfaceTint: Color(4289123220),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289386392),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294115303),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289386392),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293591039),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4286896348),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949551),
      onErrorContainer: Color(4278190080),
      background: Color(4279309327),
      onBackground: Color(4292994266),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282926906),
      onSurfaceVariant: Color(4294966249),
      outline: Color(4291742650),
      outlineVariant: Color(4291742650),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278989061),
      primaryFixed: Color(4291228850),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289386392),
      onPrimaryFixedVariant: Color(4278328064),
      secondaryFixed: Color(4291228850),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289386392),
      onSecondaryFixedVariant: Color(4278262528),
      tertiaryFixed: Color(4288738808),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4286896348),
      onTertiaryFixedVariant: Color(4278196763),
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
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0)
      )
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  /// Special Headline
  static const specialHeadline = ExtendedColor(
    seed: Color(4278463842),
    value: Color(4278463842),
    light: ColorFamily(
      color: Color(4282605201),
      onColor: Color(4294967295),
      colorContainer: Color(4292338431),
      onColorContainer: Color(4278196800),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4282605201),
      onColor: Color(4294967295),
      colorContainer: Color(4292338431),
      onColorContainer: Color(4278196800),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4282605201),
      onColor: Color(4294967295),
      colorContainer: Color(4292338431),
      onColorContainer: Color(4278196800),
    ),
    dark: ColorFamily(
      color: Color(4289513471),
      onColor: Color(4279185248),
      colorContainer: Color(4280960632),
      onColorContainer: Color(4292338431),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4289513471),
      onColor: Color(4279185248),
      colorContainer: Color(4280960632),
      onColorContainer: Color(4292338431),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4289513471),
      onColor: Color(4279185248),
      colorContainer: Color(4280960632),
      onColorContainer: Color(4292338431),
    ),
  );

  /// Darker
  static const darker = ExtendedColor(
    seed: Color(4281216558),
    value: Color(4281216558),
    light: ColorFamily(
      color: Color(4278216820),
      onColor: Color(4294967295),
      colorContainer: Color(4288606205),
      onColorContainer: Color(4278198052),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4278216820),
      onColor: Color(4294967295),
      colorContainer: Color(4288606205),
      onColorContainer: Color(4278198052),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4278216820),
      onColor: Color(4294967295),
      colorContainer: Color(4288606205),
      onColorContainer: Color(4278198052),
    ),
    dark: ColorFamily(
      color: Color(4286764000),
      onColor: Color(4278203965),
      colorContainer: Color(4278210392),
      onColorContainer: Color(4288606205),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4286764000),
      onColor: Color(4278203965),
      colorContainer: Color(4278210392),
      onColorContainer: Color(4288606205),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4286764000),
      onColor: Color(4278203965),
      colorContainer: Color(4278210392),
      onColorContainer: Color(4288606205),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    specialHeadline,
    darker,
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
