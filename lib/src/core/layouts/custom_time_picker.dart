import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_provider.dart';

Future<TimeOfDay?> customTimePicker(
  BuildContext context,
  ColorProvider colorProvider,
  TextTheme textTheme,
  Color mainColor,
) {
  return showTimePicker(
    // ignore: use_build_context_synchronously
    context: context,

    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerThemeData(
            dayPeriodColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return mainColor; // Selected background color
              }
              return colorProvider.onPrimary; // Unselected background color
            }),
            timeSelectorSeparatorColor:
                WidgetStatePropertyAll(colorProvider.darkest),

            timeSelectorSeparatorTextStyle: WidgetStatePropertyAll(
              textTheme.displayLarge!.copyWith(fontSize: 70.sp),
            ),
            dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorProvider.surface; // Selected text color
              }
              return colorProvider.darkest; // Unselected text color
            }),
            hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorProvider.onPrimary;
              } else {
                return colorProvider.darkest;
              }
            }), // Teal color for hour and minute text
            hourMinuteTextStyle: textTheme.displayLarge!.copyWith(
              fontSize: 60.sp,
            ),
            hourMinuteColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return mainColor.withAlpha(
                  150,
                ); // Background color for hour and minute
              }
              return colorProvider.onPrimary;
            }),
            hourMinuteShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            dialHandColor: mainColor, // Color of the dial hand
            dialBackgroundColor: mainColor.withAlpha(
              50,
            ), // Light teal background for clock
            entryModeIconColor: mainColor, // Color of the keyboard icon
          ),
        ),
        child: child!,
      );
    },
  );
}
