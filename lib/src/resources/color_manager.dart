import 'package:flutter/material.dart';

abstract class ColorsManager {
  // Primary Colors
  Color get primary;
  Color get lightPrimary;
  Color get darkPrimary;
  Color get onLightesPrimary;
  Color get onPrimary;

  // Secondary Colors
  Color get secondary;
  Color get lightSecondary;
  Color get onLightesSecondary;
  Color get onSecondary;

  // Neutral & Core Colors
  Color get white;
  Color get black;
  Color get dark;
  Color get darker;
  Color get darkest;

  // Other Colors
  Color get scrim;
  Color get green;
  Color get lightGreen;
  Color get red;
  Color get darkRed;
  Color get lightRed;
  Color get warning;
  Color get background;
  Color get surface;
  Color get lightGrey;
  Color get grey;
  Color get greyStroke;
  Color get shadow;
  Color get textFieldFill;

  // Green colors
  Color get forestGreen;
  Color get tealGreen;
  Color get sage;
  Color get mediumSeaGreen;
  Color get camouflageGreen;
  Color get deepForestGreen;
}

class LightColorsManager extends ColorsManager {
  // Primary Colors
  @override
  Color get primary => const Color(0xFF50705D); // Updated main primary color
  @override
  Color get lightPrimary =>
      const Color(0xFF478b63); // Lighter shade for highlights
  @override
  Color get onPrimary => const Color(0xFFFFFFFF); // White text on primary

  @override
  Color get onLightesPrimary => const Color(
        0xFFFFFFFF,
      ); // Use primary as text on lightest primary background

  @override
  Color get darkPrimary => const Color(
        0xFF1D1B20,
      ).withValues(alpha: 0.9); // Updated Dark primary color

  // Neutral & Core Colors
  @override
  Color get white => const Color(0xFFFFFFFF); // Standard white
  @override
  Color get black => const Color(0xFF000000); // Standard black
  @override
  Color get dark => const Color(0xFF444444); // Slightly lighter dark shade
  @override
  Color get darker =>
      const Color(0xFF333333); // Dark grey for shadows or inactive items
  @override
  Color get darkest =>
      const Color(0xFF222222); // Deepest grey for primary text or shadows

  // Secondary Colors
  @override
  Color get scrim => const Color(0xFF111111)
      .withValues(alpha: 0.8); // Slight opacity for dark overlays

  // Success & Error Colors
  @override
  Color get green => const Color(0xFF4CAF50); // Standard success green
  @override
  Color get lightGreen =>
      const Color(0xFF81C784); // Light variant of green for highlights
  @override
  Color get red => const Color(0xFFE53935); // Slightly muted error red
  @override
  Color get darkRed => const Color(0xFF7D0023);

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFFFAFAFA); // Soft light grey background
  @override
  Color get surface =>
      const Color(0xFFFFFFFF); // White surface for cards, dialogs, etc.

  // Additional Shades
  @override
  Color get lightGrey =>
      const Color(0xFFE0E0E0); // Very light grey for subtle backgrounds
  @override
  Color get grey =>
      const Color(0xFF9E9E9E); // Medium grey for icons, borders, etc.
  @override
  Color get greyStroke => const Color(0xFFBDBDBD); // Border grey

  // Shadows
  @override
  Color get shadow => const Color(0xFF000000)
      .withValues(alpha: 0.15); // Light grey with a soft look for input fields.
// Light shadow for depth

  @override
  Color get textFieldFill => const Color(0xFFF2F2F2);

  @override
  Color get lightSecondary => const Color(0xFF49654F);

  @override
  Color get onLightesSecondary => const Color(0xFF000000);

  @override
  Color get onSecondary => const Color(0xFF000000);

  @override
  Color get secondary => const Color(0xFF49454F);

  @override
  Color get warning => const Color(0xFFffa100);
  @override
  Color get forestGreen => const Color(0xFF547460); // Light theme Forest Green

  @override
  Color get tealGreen => const Color(0xFF1F6761); // Light theme Teal Green

  @override
  Color get sage => const Color(0xFF5D806A); // Light theme Sage

  @override
  Color get mediumSeaGreen =>
      const Color(0xFF258B4B); // Light theme Medium Sea Green

  @override
  Color get camouflageGreen =>
      const Color(0xFF48855F); // Light theme Camouflage Green

  @override
  Color get deepForestGreen => const Color(0xFF2A3E31);

  @override
  Color get lightRed => const Color(0xFFE36961);
}

class DarkColorsManager extends ColorsManager {
  // Primary Colors
  @override
  Color get primary => const Color(0xFF50705D); // Updated main primary color
  @override
  Color get lightPrimary =>
      const Color(0xFF478b63); // Lighter shade for highlights
  @override
  Color get onPrimary => const Color(0xFFFFFFFF); // White text on primary

  @override
  Color get onLightesPrimary => const Color.fromARGB(
        255,
        237,
        247,
        255,
      ); // Use primary as text on lightest primary background

  @override
  Color get darkPrimary => const Color(
        0xFF1D1B20,
      ).withValues(alpha: 0.9); // Updated Dark primary color

  // Neutral & Core Colors
  @override
  Color get white =>
      const Color(0xFFFFFFFF); // Standard white for text or accents
  @override
  Color get black =>
      const Color(0xFF000000); // Standard black for text, borders
  @override
  Color get dark => const Color(0xFFCDCDCD); // Slightly muted dark grey
  @override
  Color get darker => const Color(0xFFE1E1E1); // Lighter than `dark`
  @override
  Color get darkest =>
      const Color(0xFFECECEC); // Lightest grey for text or backgrounds

  // Secondary Colors
  @override
  Color get scrim => const Color(0xFF000000)
      .withValues(alpha: 0.6); // Heavy opacity for dark backgrounds

  // Success & Error Colors
  @override
  Color get green => const Color(
        0xFF66BB6A,
      ); // Slightly lighter green for better contrast in dark mode
  @override
  Color get lightGreen =>
      const Color(0xFFA5D6A7); // Very light green for subtle highlights
  @override
  Color get red => const Color(
        0xFFE57373,
      ); // Muted red to reduce harshness on dark backgrounds
  @override
  Color get darkRed => const Color(0xFF7D0023);

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFF121212); // Dark grey background
  @override
  Color get surface =>
      const Color(0xFF1E1E1E); // Slightly lighter surface for cards

  // Additional Shades
  @override
  Color get lightGrey =>
      const Color(0xFF424242); // Dark grey for subtle accents
  @override
  Color get grey => const Color(0xFF9E9E9E); // Medium grey for icons, borders
  @override
  Color get greyStroke => const Color(0xFF616161); // Darker grey for borders

  // Shadows
  @override
  Color get shadow =>
      const Color(0xFF000000).withValues(alpha: 0.5); // Darker shadow for depth
  @override
  Color get textFieldFill => const Color(0xFF2C2C2C);

  @override
  Color get lightSecondary => const Color(0xFF49654F);

  @override
  Color get onLightesSecondary => const Color(0xFF000000);

  @override
  Color get onSecondary => const Color(0xFF000000);

  @override
  Color get secondary => const Color(0xFF49454F);
  @override
  Color get warning => const Color(0xFFffa100);
  // @override
  // Color get forestGreen => const Color(0xFF547460); // Light theme Forest Green

  // @override
  // Color get tealGreen => const Color(0xFF1F6761); // Light theme Teal Green

  // @override
  // Color get sage => const Color(0xFF5D806A); // Light theme Sage

  // @override
  // Color get mediumSeaGreen =>
  //     const Color(0xFF258B4B); // Light theme Medium Sea Green

  // @override
  // Color get camouflageGreen =>
  //     const Color(0xFF48855F); // Light theme Camouflage Green

  // @override
  // Color get deepForestGreen =>
  //     const Color(0xFF2A3E31); // Light theme Deep Forest Green

  @override
  Color get forestGreen => const Color.fromARGB(
        255,
        83,
        108,
        84,
      ); // Dark theme Forest Green (darker version)

  @override
  Color get tealGreen => const Color.fromARGB(
        255,
        30,
        111,
        104,
      ); // Dark theme Teal Green (darker version)

  @override
  Color get sage => const Color.fromARGB(
        255,
        87,
        120,
        104,
      ); // Dark theme Sage (darker version)

  @override
  Color get mediumSeaGreen => const Color.fromARGB(
        255,
        54,
        136,
        95,
      ); // Dark theme Medium Sea Green (darker version)

  @override
  Color get camouflageGreen => const Color.fromARGB(
        255,
        95,
        156,
        121,
      ); // Dark theme Camouflage Green (darker version)

  @override
  Color get deepForestGreen => const Color.fromARGB(
        255,
        77,
        100,
        86,
      ); // Dark theme Deep Forest Green (darker version)
  @override
  Color get lightRed => const Color(0xFFE36961);
}
