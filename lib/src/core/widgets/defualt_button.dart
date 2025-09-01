// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_go_test/src/core/helpers/functions/null_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learning_go_test/src/core/enums/roundnes_level.dart';
import 'package:learning_go_test/src/core/helpers/functions/calculation_functions.dart';
import 'package:learning_go_test/src/resources/app_gradients.dart';
import 'package:learning_go_test/src/resources/color_provider.dart';

class DefaultButton extends StatelessWidget {
  final Widget? content;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final Function() onTap;
  final Function()? onDisableTap;
  final RoundnessLevel roundnessLevel;
  final bool isEnable;
  final Gradient? gradient;
  final bool isHavingError;
  final Color? borderColor;

  const DefaultButton({
    super.key,
    this.content,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    required this.onTap,
    this.onDisableTap,
    this.roundnessLevel = RoundnessLevel.medium,
    this.isEnable = true,
    this.gradient,
    this.isHavingError = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.8.sw,
      height: height ?? 60.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isHavingError
              ? AppGradients.errorGradient
              : gradient, // Apply the passed gradient if provided
          color: gradient == null
              ? (backgroundColor ?? ColorProvider().primary)
              : null,
          borderRadius: BorderRadius.circular(
            calculateRoundness(width ?? 0.8.sw, height ?? 60.h, roundnessLevel),
          ),
          border: borderColor != null
              ? Border.all(
                  color: borderColor ?? ColorProvider().primary,
                  width: 1,
                )
              : null,
        ),
        child: MaterialButton(
          onPressed: isEnable ? onTap : (onDisableTap),
          elevation: 0,
          color: isNull(onDisableTap)
              ? null
              : (isEnable ? backgroundColor : ColorProvider().grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              calculateRoundness(
                width ?? 0.8.sw,
                height ?? 60.h,
                roundnessLevel,
              ),
            ),
          ),
          disabledColor: gradient != null
              ? Colors
                    .transparent // Show gradient even when disabled
              : ColorProvider().grey,
          child: content,
        ),
      ),
    );
  }
}
