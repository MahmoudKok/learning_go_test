import 'package:learning_go_test/src/core/extensions/widget_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/color_provider.dart';

class CustomCardContent extends StatelessWidget {
  const CustomCardContent({super.key, required this.title, this.value});

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 0.14.sw),
        SizedBox(
          width: 140.w,
          child: Text(
            overflow: TextOverflow.ellipsis,
            title,
            style: textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            value ?? LocaleKeys.not_exist.tr(),
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 16.sp,
              color: colorProvider.grey,
            ),
          ).onlyPadding(end: 16.sp),
        ),
        // const Spacer(
        //   flex: 2,
        // ),
      ],
    ).symmetricPadding(vertical: 6.sp);
  }
}
