import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279463424),
      surfaceTint: Color(4279463424),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283348278),
      onPrimaryContainer: Color(4278262016),
      secondary: Color(4279332352),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286381917),
      onSecondaryContainer: Color(4278932480),
      tertiary: Color(4278209615),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279792502),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287692800),
      onError: Color(4294967295),
      errorContainer: Color(4291828496),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282599488),
      outline: Color(4285823343),
      outlineVariant: Color(4291086525),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4285849177),
      primaryFixed: Color(4287691634),
      onPrimaryFixed: Color(4278329600),
      primaryFixedDim: Color(4285849177),
      onPrimaryFixedVariant: Color(4278997760),
      secondaryFixed: Color(4286185306),
      onSecondaryFixed: Color(4278329600),
      secondaryFixedDim: Color(4281197824),
      onSecondaryFixedVariant: Color(4278932224),
      tertiaryFixed: Color(4288803059),
      onTertiaryFixed: Color(4278198305),
      tertiaryFixedDim: Color(4286960854),
      onTertiaryFixedVariant: Color(4278210386),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278930944),
      surfaceTint: Color(4279463424),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279863040),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278865408),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4279731968),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209357),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279792502),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365120),
      onError: Color(4294967295),
      errorContainer: Color(4291828496),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282336316),
      outline: Color(4284244312),
      outlineVariant: Color(4286020723),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4285849177),
      primaryFixed: Color(4279863040),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279397120),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4279731968),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279331584),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281041027),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216554),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278397184),
      surfaceTint: Color(4279463424),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278930944),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278397184),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278865408),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200104),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209357),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301888),
      onError: Color(4294967295),
      errorContainer: Color(4287365120),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362270),
      outline: Color(4282336316),
      outlineVariant: Color(4282336316),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4290117532),
      primaryFixed: Color(4278930944),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278531328),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278865408),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278531328),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209357),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203188),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4285849177),
      surfaceTint: Color(4285849177),
      onPrimary: Color(4278597888),
      primaryContainer: Color(4279863040),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294967295),
      onSecondary: Color(4278532352),
      secondaryContainer: Color(4281464064),
      onSecondaryContainer: Color(4278798848),
      tertiary: Color(4286960854),
      onTertiary: Color(4278204216),
      tertiaryContainer: Color(4278217068),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948008),
      onError: Color(4285071360),
      errorContainer: Color(4289265664),
      onErrorContainer: Color(4294963438),
      surface: Color(4279505683),
      onSurface: Color(4293255905),
      onSurfaceVariant: Color(4291086525),
      outline: Color(4287533704),
      outlineVariant: Color(4282599488),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4279463424),
      primaryFixed: Color(4287691634),
      onPrimaryFixed: Color(4278329600),
      primaryFixedDim: Color(4285849177),
      onPrimaryFixedVariant: Color(4278997760),
      secondaryFixed: Color(4286185306),
      onSecondaryFixed: Color(4278329600),
      secondaryFixedDim: Color(4281197824),
      onSecondaryFixedVariant: Color(4278932224),
      tertiaryFixed: Color(4288803059),
      onTertiaryFixed: Color(4278198305),
      tertiaryFixedDim: Color(4286960854),
      onTertiaryFixedVariant: Color(4278210386),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286177885),
      surfaceTint: Color(4285849177),
      onPrimary: Color(4278328064),
      primaryContainer: Color(4282230054),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4278532352),
      secondaryContainer: Color(4281464064),
      onSecondaryContainer: Color(4278330880),
      tertiary: Color(4287224027),
      onTertiary: Color(4278196763),
      tertiaryContainer: Color(4283276704),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949551),
      onError: Color(4281794560),
      errorContainer: Color(4294923585),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294900473),
      onSurfaceVariant: Color(4291349697),
      outline: Color(4288717978),
      outlineVariant: Color(4286612859),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4278998016),
      primaryFixed: Color(4287691634),
      onPrimaryFixed: Color(4278261248),
      primaryFixedDim: Color(4285849177),
      onPrimaryFixedVariant: Color(4278665216),
      secondaryFixed: Color(4286185306),
      onSecondaryFixed: Color(4278261248),
      secondaryFixedDim: Color(4281197824),
      onSecondaryFixedVariant: Color(4278599680),
      tertiaryFixed: Color(4288803059),
      onTertiaryFixed: Color(4278195221),
      tertiaryFixedDim: Color(4286960854),
      onTertiaryFixedVariant: Color(4278205759),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294115303),
      surfaceTint: Color(4285849177),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286177885),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4281464064),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293591039),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287224027),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949551),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507760),
      outline: Color(4291349697),
      outlineVariant: Color(4291349697),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4278530560),
      primaryFixed: Color(4288216955),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286177885),
      onPrimaryFixedVariant: Color(4278328064),
      secondaryFixed: Color(4288216955),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4281264640),
      onSecondaryFixedVariant: Color(4278262528),
      tertiaryFixed: Color(4289066231),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287224027),
      onTertiaryFixedVariant: Color(4278196763),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
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

  /// Warning
  static const warning = ExtendedColor(
    seed: Color(4294690646),
    value: Color(4294690646),
    light: ColorFamily(
      color: Color(4286208256),
      onColor: Color(4294967295),
      colorContainer: Color(4294954599),
      onColorContainer: Color(4283644928),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4286208256),
      onColor: Color(4294967295),
      colorContainer: Color(4294954599),
      onColorContainer: Color(4283644928),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4286208256),
      onColor: Color(4294967295),
      colorContainer: Color(4294954599),
      onColorContainer: Color(4283644928),
    ),
    dark: ColorFamily(
      color: Color(4294964193),
      onColor: Color(4282395904),
      colorContainer: Color(4294361682),
      onColorContainer: Color(4283053312),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294964193),
      onColor: Color(4282395904),
      colorContainer: Color(4294361682),
      onColorContainer: Color(4283053312),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294964193),
      onColor: Color(4282395904),
      colorContainer: Color(4294361682),
      onColorContainer: Color(4283053312),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    warning,
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
