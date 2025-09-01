import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_go_test/src/core/di/app_initializer.dart';

import 'app/features/init_app/presentation/bloc/init_app_bloc.dart';
import 'generated/codegen_loader.g.dart';
import 'src/core/di/service_locator.dart';
import 'src/core/enums/app_theme_types.dart';
import 'src/core/router/app_router.dart';
import 'src/resources/theme_manager.dart';

void main() async {
  await AppInitializer.init();
  runApp(
    BlocProvider<InitAppBloc>(
      create: (context) => sl<InitAppBloc>()..add(LoadUserSettingsEvent()),
      child: const MainApp(),
    ),
    // ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<InitAppBloc, InitAppState>(
            bloc: context.read<InitAppBloc>(),
            buildWhen: (previous, current) =>
                previous.userSettings != current.userSettings,
            builder: (context, state) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp.router(
                  // useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  supportedLocales: context.supportedLocales,
                  builder: (context, child) {
                    // Chain BotToastInit with AppLock
                    Widget app = BotToastInit()(context, child);
                    return app;
                  },
                  localizationsDelegates: context.localizationDelegates,
                  locale: EasyLocalization.of(context)!.locale,
                  routerConfig: AppRouter.getRouter,

                  theme: state.userSettings.theme == AppThemeType.light
                      ? AppThemes.lightTheme
                      : AppThemes.darkTheme,
                  darkTheme: AppThemes.darkTheme,
                  themeMode: state.userSettings.theme == AppThemeType.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  title: 'Learning-Go',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
