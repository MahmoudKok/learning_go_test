import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:learning_go_test/src/core/router/custom_navigation_observer.dart';
import 'package:learning_go_test/src/core/router/fallback_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custome_transition_builders.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter() : goRouter = _getRouter;
  final GoRouter goRouter;

  static late AppRouter _appRouter;

  static init() {
    _appRouter = AppRouter();
  }

  static GoRouter get getRouter => _appRouter.goRouter;
  //? Use for bottomNavigation bar
  // static final _shellKey = GlobalKey<NavigatorState>();

  static get _getRouter => GoRouter(
    navigatorKey: rootKey,
    initialLocation: AppRoutes.splash,
    observers: [CustomNavigationObserver()],
    errorBuilder: (context, state) => const FallbackScreen(),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        parentNavigatorKey: rootKey,
        builder: (BuildContext context, GoRouterState state) {
          return Container();
          // return const SplashScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.home,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildSlideTransition(
            name: AppRoutes.home,
            state: state,
            context: context,
            //Home
            child: Container(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildSlideTransition(
            name: AppRoutes.main,
            state: state,
            context: context,
            //MainScreen
            // child: MainScreen(),
            child: Container(),
          );
        },
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required String name,
}) {
  return CustomTransitionPage<T>(
    name: name,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
