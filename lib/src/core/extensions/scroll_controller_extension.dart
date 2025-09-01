import 'package:flutter/widgets.dart';

extension ScrollControllerExtension on ScrollController {
  /// Animate to the top of the list
  void animToTop({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeIn,
  }) {
    animateTo(0.0, duration: duration, curve: curve);
  }

  /// Animate to the bottom of the list
  void animToBottom({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeIn,
  }) {
    animateTo(position.maxScrollExtent, duration: duration, curve: curve);
  }

  /// Animate to a specific position
  void animateToPosition(
    double position, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeIn,
  }) {
    animateTo(position, duration: duration, curve: curve);
  }

  /// Jump to the start of the list without animation
  void jumpToTop() {
    jumpTo(0.0);
  }

  /// Jump to the end of the list without animation
  void jumpToBottom() {
    jumpTo(position.maxScrollExtent);
  }
}
