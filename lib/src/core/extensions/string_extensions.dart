import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }

  Text toText(TextStyle? style) {
    if (style != null) {
      return Text(
        this,
        style: style,
      );
    } else {
      return Text(
        this,
        style: TextStyle(color: Colors.black, fontSize: 18.sp),
      );
    }
  }

  bool isValidEmail() {
    final emailRegex = RegExp(
      r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[-a-zA-Z0-9]{0,61}[a-zA-Z0-9])?\.[a-zA-Z]{2,}",
    );

    return emailRegex.hasMatch(this);
  }

  bool isValidUsername() {
    // Regular expression pattern to match a valid username
    final RegExp usernameRegex =
        RegExp(r'^[a-zA-Z0-9](?!.*[._]{2})[a-zA-Z0-9._]{1,14}[a-zA-Z0-9]$');

    return usernameRegex.hasMatch(this);
  }

  bool isValidUrl() {
    // Regular expression pattern to match a valid URL
    // (basic check, may not cover all edge cases)
    final RegExp urlRegex = RegExp(
      r'^[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,}(\/\S*)?$',
    );

    return urlRegex.hasMatch(this);
  }

  bool isOnlyNumbers() {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  bool isKindNumber() {
    return RegExp(r'^[+-]?\d+(\.\d+)?$').hasMatch(this);
  }

  String formatMoney(String locale, {int decimals = 2}) {
    final formatter =
        NumberFormat.currency(locale: locale, decimalDigits: decimals);
    double? value = double.tryParse(this);
    if (value != null) {
      return formatter.format(value);
    }
    return this; // Return original string if parsing fails
  }

  File toFile() {
    return File(this);
  }

  DateTime toDateTime() {
    final parts = split('-');
    if (parts.length != 3) {
      throw const FormatException('Invalid date format, expected YYYY-MM-DD');
    }

    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);

    return DateTime(year, month, day);
  }

  bool isValidNumber({bool isGreaterThanZero = false}) {
    final double? value = double.tryParse(this);
    if (isGreaterThanZero) {
      return value != null && value > 0;
    } else {
      return value != null && value >= 0;
    }
  }
}

extension StringToAction on String {
  void get copyToClipboard => ClipboardData(text: this);

  Color stringToColor() {
    String colorString = this;

    // Remove the "0x" prefix if present
    if (colorString.startsWith("0X") || colorString.startsWith("0x")) {
      colorString = colorString.substring(2);
    } else {
      colorString = "ff$colorString";
    }

    // Ensure the string has the correct length for a hex color (8 characters)
    if (colorString.length != 8) {
      throw ArgumentError("Invalid hex color string: $colorString");
    }

    // Parse the hex string to an integer
    int colorValue = int.parse(colorString, radix: 16);

    // Create a Color object
    return Color(colorValue);
  }
}

extension StringTypeCases on String {
  String toSnakeCase() {
    return replaceAllMapped(
      RegExp(r'(?<!^)(?=[A-Z])'),
      (match) => '_${match.group(0)?.toLowerCase()}',
    ).toLowerCase();
  }

  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension NumberConverter on String {
  double toDouble() {
    final double result = double.tryParse(this) ?? -99;
    return result;
  }

  int toInt() {
    final int result = int.tryParse(this) ?? -99;
    return result;
  }
}
