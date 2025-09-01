import 'package:flutter/services.dart';

void changeStatusBarColor(Color color, Brightness? brightness) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness ?? Brightness.light,
    ),
  );
}
