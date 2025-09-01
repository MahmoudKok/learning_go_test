import 'package:flutter/material.dart';

import 'color_provider.dart';

class AppGradients {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [
      ColorProvider().primary,
      ColorProvider().lightPrimary,
      ColorProvider().lightPrimary,
      ColorProvider().primary,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static LinearGradient backgroundGradient = LinearGradient(
    colors: [
      ColorProvider().primary,
      ColorProvider().darkPrimary,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static LinearGradient errorGradient = LinearGradient(
    colors: [
      ColorProvider().red,
      ColorProvider().red.withValues(alpha: 0.8),
      // ColorProvider().warning.withValues(alpha:  0.5),
      ColorProvider().red,

      // Color(0XFFF5515F),
      // Color(0XFFA1051D),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
