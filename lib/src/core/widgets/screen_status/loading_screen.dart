import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
      // AppLottie.loadingPrimary.asLottieAssets(
      //   width: width ?? 75.w,
      //   height: height ?? 75.h,
      // ),
    );
  }
}
