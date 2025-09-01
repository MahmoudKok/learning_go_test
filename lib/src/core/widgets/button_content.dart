// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_go_test/src/core/enums/general_enums.dart';
import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_provider.dart';

class ButtonContent extends StatelessWidget {
  final RequestState state;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final double? iconSize;
  const ButtonContent({
    super.key,
    required this.state,
    required this.text,
    this.textColor,
    this.fontSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    switch (state) {
      case RequestState.init:
        return Text(
          text,
          style: textTheme.displayMedium!.copyWith(
            color: textColor ?? colorProvider.onPrimary,
            fontSize: fontSize ?? 20.sp,
          ),
        );

      case RequestState.loading:
        return AppLottie.loadingIcon.asLottieAssets(width: 30.w, height: 30.h);

      case RequestState.success:
        return AppLottie.successIcon.asLottieAssets(
          width: iconSize ?? 30.w,
          height: iconSize ?? 30.h,
        );

      case RequestState.error:
        return Icon(Icons.close, color: colorProvider.onPrimary, size: 30.sp);
    }
  }
}
