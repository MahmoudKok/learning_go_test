import 'package:learning_go_test/app/features/auth/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:learning_go_test/app/features/home/presentation/pages/home_screen.dart';
import 'package:learning_go_test/app/features/product_details/presentation/pages/product_details_screen.dart';
import 'package:learning_go_test/app/features/profile/presentation/pages/profile_screen.dart';
import 'package:learning_go_test/app/features/search_products/presentation/pages/search_products_screen.dart';
import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:learning_go_test/src/core/router/custom_navigation_observer.dart';
import 'package:learning_go_test/src/core/router/fallback_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/features/splash/presentation/pages/splash_screen.dart';
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
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signin,
        parentNavigatorKey: rootKey,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
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
            child: const HomeScreen(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.searchProducts,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildSlideTransition(
            name: AppRoutes.home,
            state: state,
            context: context,
            //Home
            child: const SearchProductsScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.productDetails,
        path: AppRoutes.productDetails,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return buildPageWithDefaultTransition(
            name: AppRoutes.productDetails,
            state: state,
            context: context,
            //Home
            child: ProductDetailsScreen(
              id: data['id'].toString(),
              thumbnail: data['thumbnail'],
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.profile,
        path: AppRoutes.profile,
        parentNavigatorKey: rootKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(
            name: AppRoutes.profile,
            state: state,
            context: context,
            //Home
            child: const ProfileScreen(),
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
