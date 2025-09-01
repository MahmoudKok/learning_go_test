import 'package:learning_go_test/src/core/extensions/numbers_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_provider.dart';

class CustomDatePickerCardWidget extends StatelessWidget {
  final String label;
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;
  final DateTime? lastDate;

  const CustomDatePickerCardWidget({
    super.key,
    required this.label,
    required this.initialDate,
    required this.onDateSelected,
    this.lastDate,
  });

  // final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  void _selectDate(BuildContext context) async {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            datePickerTheme: DatePickerThemeData(
              headerHeadlineStyle: textTheme.bodyMedium,
              headerHelpStyle: textTheme.bodyMedium,
              rangePickerHeaderHelpStyle: textTheme.bodyMedium,
              rangePickerHeaderHeadlineStyle: textTheme.bodyMedium,
              yearStyle: textTheme.bodyMedium,
              dayStyle: textTheme.bodyMedium,
              weekdayStyle: textTheme.bodyMedium,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(12.r.toRadius),
              ),
              cancelButtonStyle: TextButton.styleFrom(
                textStyle: textTheme.bodyMedium,
                foregroundColor: colorProvider.darker,
              ),
              confirmButtonStyle: TextButton.styleFrom(
                textStyle: textTheme.bodyMedium,
                foregroundColor: colorProvider.darker,
              ),
            ),
            primaryColor: colorProvider.primary, // Header background color
            hintColor: colorProvider.lightPrimary, // Highlight color
            // textTheme: theme.textTheme.apply(
            //   fontFamily:
            //       AppLanguages.isArabic ? AppFonts.rubik : AppFonts.nunito,
            // ),

            // textButtonTheme: TextButtonThemeData(
            //   style: TextButton.styleFrom(
            //     foregroundColor: colorProvider.darker, // Button text color
            //   ),
            // ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorProvider colorProvider = ColorProvider();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.titleLarge!.copyWith(
            fontSize: 18.sp,
            color: colorProvider.darker.withValues(alpha: 0.8),
          ),
        ),
        16.verticalSpace,
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(8.r.toRadius),
              side: const BorderSide(width: 0.5),
            ),
            child: ListTile(
              title: initialDate != null
                  ? Text(DateFormat('yyyy-MM-dd').format(initialDate!))
                  : Text(label),
              trailing: Icon(
                Icons.calendar_month_outlined,
                color: colorProvider.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
