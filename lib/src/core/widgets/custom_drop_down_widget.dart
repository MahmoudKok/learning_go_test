import 'package:learning_go_test/src/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_provider.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.hint,
    this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.textTheme,
    required this.colorProvider,
    this.onPressClose,
    this.isSelected = false,
  });
  final String hint;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final TextTheme textTheme;
  final ColorProvider colorProvider;
  final bool isSelected;
  final void Function()? onPressClose;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(16.r),
            dropdownColor: colorProvider.surface,
            hint: Text(
              hint,
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 16.sp,
                color: colorProvider.grey,
              ),
            ),
            icon: const Icon(Icons.expand_more),
            underline: Container(height: 1.5.h, color: colorProvider.grey),
            isExpanded: true,
            value: selectedValue,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    // color: colorProvider.grey,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ).symmetricPadding(vertical: 6.sp),
        ),
        4.horizontalSpace,
        if (isSelected)
          IconButton(
            icon: Icon(Icons.close, color: colorProvider.red),
            onPressed: onPressClose,
          ),
      ],
    );
  }
}
