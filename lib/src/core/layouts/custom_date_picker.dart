import 'package:learning_go_test/src/resources/font_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_provider.dart';

Future<DateTime?> customDatePicker(
  BuildContext context,
  ColorProvider colorProvider, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  Color? mainColor,
}) {
  return showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      // Dev.logLine('JJSJJSJSJ');
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary:
                mainColor ?? colorProvider.primary, // Header background color
            onPrimary: colorProvider.onPrimary, // Header text color
            onSurface: mainColor ?? colorProvider.primary, // Body text color
          ),

          textTheme: const TextTheme().apply(fontFamily: AppFonts.nunito),

          // dropdownMenuTheme: DropdownMenuThemeData(
          //   inputDecorationTheme: InputDecorationTheme(
          //       labelStyle: TextStyle(
          //     color: Colors.red, // Set desired color
          //     fontSize: 16,
          //   )),
          //   textStyle: TextStyle(
          //     color: Colors.red, // Set desired color
          //     fontSize: 16,
          //   ),
          // ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: mainColor, // Button text color
            ),
          ), // Background color of the dialog
          datePickerTheme: DatePickerThemeData(
            backgroundColor: colorProvider
                .surface, // Background color of the date picker dialog
            headerBackgroundColor:
                mainColor ??
                colorProvider
                    .primary, // Header background color (month/year selector)
            headerForegroundColor:
                colorProvider.onPrimary, // Header text color (month/year text)
            weekdayStyle: TextStyle(
              fontFamily: AppFonts.nunito,
              color: mainColor ?? colorProvider.primary,
            ), // Weekday labels color (Sun, Mon, etc.)
            dayStyle: TextStyle(
              fontFamily: AppFonts.nunito,
              color: colorProvider.darkest,
            ), // Day numbers default color
            todayForegroundColor: WidgetStatePropertyAll(
              mainColor,
            ), // Today's date text color
            todayBackgroundColor: WidgetStatePropertyAll(
              mainColor == null
                  ? colorProvider.primary.withValues(alpha: 0.4)
                  : mainColor.withValues(alpha: 0.4),
            ), // Background color for today's date
            // selectedForegroundColor: colorProvider.onPrimary, // Selected date text color
            // selectedBackgroundColor: mainColor, // Selected date background color
            yearStyle: TextStyle(
              fontFamily: AppFonts.nunito,
              color: colorProvider.darkest,
              fontWeight: FontWeight.bold,
            ), // Year options text style
            dayOverlayColor: WidgetStateColor.resolveWith((states) {
              // Ripple effect color when day is pressed
              if (states.contains(WidgetState.pressed)) {
                return mainColor == null
                    ? colorProvider.primary.withValues(alpha: 0.4)
                    : mainColor.withValues(alpha: 1);
              }
              return Colors.transparent;
            }),
          ),
          dialogTheme: DialogThemeData(
            backgroundColor: colorProvider.onPrimary,
          ),
        ),
        child: child!,
      );
    },
  );
}
