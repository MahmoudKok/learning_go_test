// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmptyScreen extends StatelessWidget {
  final String? text;
  final String? image;
  const EmptyScreen({super.key, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          24.verticalSpace,
          // image?.asImageAssets(width: 200.w, height: 200.h) ??
          //     AppImages.emptyScreen.asImageAssets(width: 150.w, height: 150.h),
          24.verticalSpace,
          Text(
            text ?? 'There is no items',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
