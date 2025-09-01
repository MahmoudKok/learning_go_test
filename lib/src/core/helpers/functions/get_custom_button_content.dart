import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:learning_go_test/src/core/extensions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_provider.dart';
import '../../enums/general_enums.dart';
// ignore: unused_import
import '../../layouts/app_messages.dart';

Widget getCustomButtonContent({
  required RequestState state,
  required BuildContext context,
  String? message,
  required String buttonTitle,
  TextStyle? buttonTitleStyle,
}) {
  ThemeData theme = Theme.of(context);
  TextTheme textTheme = theme.textTheme;
  ColorProvider colorProvider = ColorProvider();
  switch (state) {
    case RequestState.init:
      return Text(
        // LocaleKeys.update.tr(),
        buttonTitle,
        style: buttonTitleStyle,
      ).centered();
    case RequestState.loading:
      return AppLottie.loadingWhite.asLottieAssets(height: 20.h).centered();
    case RequestState.success:
      // Navigator.pop(context);
      // if (message != null) {
      //   AppMessages.showMessage(
      //     message: message,
      //   );
      // }

      return AppLottie.successWhite.asLottieAssets(height: 20.h).centered();
    case RequestState.error:
      return Container(
        // width: 0.2.sw,
        // height: 60.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorProvider().red,
              const Color.fromARGB(255, 222, 31, 31),
              const Color.fromARGB(255, 222, 31, 31),
              ColorProvider().red,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.error.tr(),
              style: textTheme.displaySmall!.copyWith(
                color: colorProvider.onPrimary,
                fontSize: 18.sp,
              ),
            ).centered(),
            5.horizontalSpace,
            Icon(Icons.close, color: colorProvider.onPrimary, size: 22.sp),
            // AppLottie.error.asLottieAssets(height: 20.h).centered(),
          ],
        ),
      );
  }
}
