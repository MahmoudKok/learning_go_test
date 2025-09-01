import 'package:learning_go_test/src/resources/color_provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMessages {
  static showSuccess({
    required String message,
    Color color = const Color(0xFF222222),
  }) {
    BotToast.showText(
      align: Alignment.bottomCenter,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      duration: const Duration(seconds: 3),
      text: message,
      contentColor: ColorProvider().green,
      onlyOne: true,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  static showError({
    required String message,
    Color color = const Color(0xFFF91717),
  }) {
    BotToast.showText(
      text: message,
      contentColor: color,
      onlyOne: true,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorProvider().onPrimary,
      ),
    );
  }

  static showMessage({
    required String message,
    Color color = const Color(0xFF222222),
    Color textColor = Colors.white,
  }) {
    BotToast.showCustomText(
      align: Alignment.bottomCenter,
      toastBuilder: (context) => Padding(
        padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 30.h),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: color,
            boxShadow: [
              BoxShadow(
                color: ColorProvider().black.withValues(alpha: 0.3),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ),
      onlyOne: true,
    );
  }
}
