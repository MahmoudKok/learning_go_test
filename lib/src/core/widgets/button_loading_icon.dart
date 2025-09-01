// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:learning_go_test/src/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLoadingIcon extends StatelessWidget {
  const ButtonLoadingIcon({super.key, this.width, this.height, this.color});
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppLottie.loadingWhite.asLottieAssets(
      width: width ?? 40.w,
      height: height ?? 40.h,
    );
  }
}
