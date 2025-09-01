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
}

class LightColorsManager extends ColorsManager {
  // Primary Colors
  @override
  Color get primary => const Color(0xFF3764E5); // الأزرق الأساسي
  @override
  Color get lightPrimary => const Color(0xFF5A82EC); // أزرق أفتح للهوايات
  @override
  Color get onPrimary => const Color(0xFFFFFFFF); // أبيض فوق الأزرق

  @override
  Color get onLightesPrimary => const Color(0xFFFFFFFF);

  @override
  Color get darkPrimary => const Color(0xFF2C4EB8); // أزرق أغمق بدرجة للهيدر أو التمييز

  // Neutral & Core Colors
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF000000);
  @override
  Color get dark => const Color(0xFF444444);
  @override
  Color get darker => const Color(0xFF333333);
  @override
  Color get darkest => const Color(0xFF222222);

  // Secondary Colors
  @override
  Color get scrim => const Color(0xFF111111).withValues(alpha: 0.8);

  // Success & Error Colors
  @override
  Color get green => const Color(0xFF45C73B); // الأخضر الأساسي
  @override
  Color get lightGreen => const Color(0xFF7EEA73); // أخضر فاتح للهوايات
  @override
  Color get red => const Color(0xFFE53935);
  @override
  Color get darkRed => const Color(0xFF7D0023);

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFFFAFAFA);
  @override
  Color get surface => const Color(0xFFFFFFFF);

  // Additional Shades
  @override
  Color get lightGrey => const Color(0xFFE0E0E0);
  @override
  Color get grey => const Color(0xFF9E9E9E);
  @override
  Color get greyStroke => const Color(0xFFBDBDBD);

  // Shadows
  @override
  Color get shadow => const Color(0xFF000000).withValues(alpha: 0.15);
  @override
  Color get textFieldFill => const Color(0xFFF2F2F2);

  @override
  Color get lightSecondary => const Color(0xFF5AB34D); // أخضر أفتح
  @override
  Color get onLightesSecondary => const Color(0xFF000000);
  @override
  Color get onSecondary => const Color(0xFFFFFFFF); // أبيض فوق الأخضر
  @override
  Color get secondary => const Color(0xFF45C73B); // الأخضر الأساسي

  @override
  Color get warning => const Color(0xFFFFA100);

  @override
  Color get lightRed => const Color(0xFFE36961);
}

class DarkColorsManager extends ColorsManager {
  // Primary Colors
  @override
  Color get primary => const Color(0xFF3764E5); // الأزرق الأساسي
  @override
  Color get lightPrimary => const Color(0xFF5A82EC); // أزرق فاتح
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onLightesPrimary => const Color(0xFFEFF3FF); // أزرق فاتح جدًا

  @override
  Color get darkPrimary => const Color(0xFF2C4EB8); // أزرق أغمق للـ dark theme

  // Neutral & Core Colors
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF000000);
  @override
  Color get dark => const Color(0xFFCDCDCD);
  @override
  Color get darker => const Color(0xFFE1E1E1);
  @override
  Color get darkest => const Color(0xFFECECEC);

  // Secondary Colors
  @override
  Color get scrim => const Color(0xFF000000).withValues(alpha: 0.6);

  // Success & Error Colors
  @override
  Color get green => const Color(0xFF45C73B); // الأخضر الأساسي
  @override
  Color get lightGreen => const Color(0xFF7EEA73); // أخضر فاتح
  @override
  Color get red => const Color(0xFFE57373);
  @override
  Color get darkRed => const Color(0xFF7D0023);

  // Background & Surface Colors
  @override
  Color get background => const Color(0xFF121212);
  @override
  Color get surface => const Color(0xFF1E1E1E);

  // Additional Shades
  @override
  Color get lightGrey => const Color(0xFF424242);
  @override
  Color get grey => const Color(0xFF9E9E9E);
  @override
  Color get greyStroke => const Color(0xFF616161);

  // Shadows
  @override
  Color get shadow => const Color(0xFF000000).withValues(alpha: 0.5);
  @override
  Color get textFieldFill => const Color(0xFF2C2C2C);

  @override
  Color get lightSecondary => const Color(0xFF5AB34D);
  @override
  Color get onLightesSecondary => const Color(0xFF000000);
  @override
  Color get onSecondary => const Color(0xFFFFFFFF); // أبيض فوق الأخضر
  @override
  Color get secondary => const Color(0xFF45C73B); // الأخضر الأساسي

  @override
  Color get warning => const Color(0xFFFFA100);

  @override
  Color get lightRed => const Color(0xFFE36961);
}
