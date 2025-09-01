import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
  Offset begin = const Offset(1.0, 0.0), // Slide from right to left
  Offset end = Offset.zero,
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

CustomTransitionPage buildBottomUpTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
          .chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

CustomTransitionPage buildFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

CustomTransitionPage buildScaleTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      var scaleAnimation = animation.drive(tween);

      return ScaleTransition(
        scale: scaleAnimation,
        child: child,
      );
    },
  );
}

CustomTransitionPage buildRotationTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      var rotationAnimation = animation.drive(tween);

      return RotationTransition(
        turns: rotationAnimation,
        child: child,
      );
    },
  );
}
