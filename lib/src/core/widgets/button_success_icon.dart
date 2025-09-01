// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:learning_go_test/src/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSuccesIcon extends StatelessWidget {
  final double? width;
  final double? height;
  const ButtonSuccesIcon({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return AppLottie.successWhite.asLottieAssets(
      width: width ?? 40.w,
      height: height ?? 40.h,
    );
  }
}
