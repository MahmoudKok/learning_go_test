// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_go_test/src/core/constants/messages/general_messages.dart';
import 'package:learning_go_test/src/core/enums/roundnes_level.dart';
import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:learning_go_test/src/core/extensions/widget_extensions.dart';
import 'package:learning_go_test/src/resources/assets_manager.dart';
import 'package:learning_go_test/src/resources/color_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../resources/app_gradients.dart';
import '../defualt_button.dart';

class ErrorScreen extends StatelessWidget {
  final String? error;
  final Function()? onTap;
  final double? imageWidth;
  final double? imageHeight;
  const ErrorScreen({
    super.key,
    this.error,
    this.onTap,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          24.verticalSpace,
          AppImages.errorScreen.asImageAssets(
            width: imageWidth ?? 150.w,
            height: imageHeight ?? 150.h,
          ),
          8.verticalSpace,
          Text(
            'Oops....',
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 24.sp),
          ),
          8.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            error != null && error!.isNotEmpty
                ? error!
                : GeneralMessages().someThingWentWrong,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 16.sp),
          ).symmetricPadding(horizontal: 32.sp),
          32.verticalSpace,
          DefaultButton(
            width: 0.4.sw,
            height: 35.h,
            roundnessLevel: RoundnessLevel.low,
            isHavingError: true,
            gradient: AppGradients.primaryGradient,
            onTap: onTap ?? () {},
            content: Text(
              LocaleKeys.retry.tr(),
              style: textTheme.displayLarge!.copyWith(
                color: colorProvider.onPrimary,
                fontSize: 16.sp,
              ),
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
