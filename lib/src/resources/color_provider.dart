import 'dart:ui';

import 'color_manager.dart';
import 'theme_manager.dart';

class ColorProvider extends ColorsManager {
  final ColorsManager _lightColorsManager = LightColorsManager();
  final ColorsManager _darkColorsManager = DarkColorsManager();

  ColorsManager get _currentManager =>
      AppThemes.currentTheme.brightness == Brightness.light
      ? _lightColorsManager
      : _darkColorsManager;

  @override
  Color get primary => _currentManager.primary;

  @override
  Color get white => _currentManager.white;

  @override
  Color get black => _currentManager.black;

  @override
  Color get dark => _currentManager.dark;

  @override
  Color get darker => _currentManager.darker;

  @override
  Color get darkest => _currentManager.darkest;

  @override
  Color get lightPrimary => _currentManager.lightPrimary;

  @override
  Color get onLightesPrimary => _currentManager.onLightesPrimary;

  @override
  Color get onPrimary => _currentManager.onPrimary;

  @override
  Color get red => _currentManager.red;

  @override
  Color get scrim => _currentManager.scrim;

  @override
  Color get grey => _currentManager.grey;

  @override
  Color get green => _currentManager.green;

  @override
  Color get lightGreen => _currentManager.lightGreen;

  @override
  Color get greyStroke => _currentManager.greyStroke;

  @override
  Color get background => _currentManager.background;

  @override
  Color get lightGrey => _currentManager.lightGrey;

  @override
  Color get surface => _currentManager.surface;

  @override
  Color get shadow => _currentManager.shadow;

  // @override
  // Color get onLightPrimary => throw UnimplementedError();

  @override
  Color get textFieldFill => _currentManager.textFieldFill;

  @override
  Color get lightSecondary => _currentManager.lightSecondary;

  @override
  Color get onLightesSecondary => _currentManager.onLightesSecondary;

  @override
  Color get onSecondary => _currentManager.onSecondary;

  @override
  Color get secondary => _currentManager.secondary;

  @override
  Color get darkPrimary => _currentManager.darkPrimary;

  @override
  Color get warning => _currentManager.warning;

  @override
  Color get lightRed => _currentManager.lightRed;

  @override
  Color get darkRed => _currentManager.darkRed;
}
