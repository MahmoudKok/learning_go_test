import 'package:learning_go_test/src/core/extensions/assets_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';

class CustomEmptyListScreen extends StatelessWidget {
  const CustomEmptyListScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // AppImages.emptyScreen.asImageAssets(height: 100.h, width: 100.w),
        16.verticalSpace,
        Text(title, style: textTheme.titleLarge),
      ],
    );
  }
}
