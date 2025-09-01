import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/data/models/user_local_settings.dart';
import 'package:learning_go_test/src/core/enums/user_auth.dart';
import 'package:learning_go_test/src/core/router/app_router.dart';
import 'package:learning_go_test/src/core/router/app_routes.dart';
import 'package:learning_go_test/src/core/services/local_storage.dart';
import 'package:learning_go_test/src/resources/assets_manager.dart';

// DI
import '../../../../../src/core/di/service_locator.dart';
import '../../../../../src/resources/color_provider.dart';
import '../bloc/splash_bloc.dart';

// Theme helpers (as per your rules)
/*
  ThemeData theme = Theme.of(context);
  TextTheme textTheme = theme.textTheme;
  ColorProvider colorProvider = ColorProvider();
*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.onFinished});

  final VoidCallback? onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorProvider = ColorProvider();

    return BlocProvider(
      create: (_) =>
          sl<SplashBloc>()..add(SplashStarted(appName: 'Learning-Go')),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen: (p, c) => p.isDone != c.isDone,
        listener: (_, state) {
          if (state.isDone) {
            widget.onFinished?.call();
          }
        },
        child: Scaffold(
          backgroundColor: colorProvider.white,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Logo(gifAsset: AppImages.appLogo),
                  SizedBox(height: 10.h),
                  _BrandName(
                    textTheme: textTheme,
                    colorProvider: colorProvider,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigate() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (sl<LocalStorage>().userSettings.userAuth == UserAuth.authorized) {
      AppRouter.getRouter.push(AppRoutes.home);
    } else {
      AppRouter.getRouter.push(AppRoutes.signin);
    }
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.gifAsset});
  final String gifAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      // decoration: BoxDecoration(
      //   color: colorProvider.white,
      //   borderRadius: BorderRadius.circular(24),
      //   boxShadow: [
      //     BoxShadow(
      //       color: colorProvider.shadow,
      //       blurRadius: 18,
      //       offset: const Offset(0, 8),
      //     ),
      //   ],
      // ),
      // clipBehavior: Clip.antiAlias,
      child: Image.asset(gifAsset, fit: BoxFit.cover),
    );
  }
}

class _BrandName extends StatelessWidget {
  const _BrandName({required this.textTheme, required this.colorProvider});

  final TextTheme textTheme;
  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 0.1.sw,
              height: 30.h,
              decoration: BoxDecoration(
                color: colorProvider.secondary,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  'Go',
                  style: textTheme.titleLarge!.copyWith(
                    color: colorProvider.white,
                  ),
                ),
              ),
            ),
            // "Learning"
            Text(
              '-',
              style: textTheme.displayLarge!.copyWith(
                color: colorProvider.primary,
              ),
            ),

            Text(
              'Learning',
              style: textTheme.displayLarge!.copyWith(
                color: colorProvider.primary,
              ),
            ),
          ],
        );
      },
    );
  }

  String takeChars(String input, int count) {
    final runes = input.runes.toList();
    final end = count.clamp(0, runes.length);
    return String.fromCharCodes(runes.take(end));
  }
}
