import 'dart:developer';
import 'dart:io';

import 'package:colorize/colorize.dart';
import 'package:flutter/cupertino.dart';

class Dev {
  Dev._();
  //TODO:Update this to use in DEBUG
  static const bool _isLoggerEnable = true;

  static void _output(String message) {
    debugPrint(message);
    // if (Platform.isIOS) {
    //   log(message);
    // } else {
    // }
  }

  static void logValue(dynamic value) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "The value is : ******  $value  ******",
    ).magenta().red().bold().italic().initial;
    _output(message);
  }

  static void logError(dynamic value) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "The Error is : ******  $value  ******",
    ).bgRed().white().bold().italic().initial;
    _output(message);
  }

  static void logLine(dynamic value) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "******  $value  ******",
    ).bgGreen().black().reverse().bold().italic().initial;
    _output(message);
  }

  static void logSuccess(dynamic value) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "--------   Success with : $value   --------",
    ).green().reverse().bold().italic().initial;
    _output(message);
  }

  static void logFaild(dynamic value, dynamic reason) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "++++++++   Faild with : $value  ||| Reason: $reason ++++++++",
    ).bgRed().white().bold().italic().initial;
    _output(message);
  }

  static void logList(List items, {String listName = 'Default'}) {
    if (!_isLoggerEnable) return;
    logLine('List with name $listName and size is ${items.length}');
    for (int i = 0; i < items.length; i++) {
      final message = Colorize(
        "******  Item with index $i ===> ${items[i].toString()}  ******",
      ).bgLightGray().black().bold().italic().initial;
      _output(message);
    }
  }

  static void logLineWithTag({dynamic tag, dynamic message}) {
    if (!_isLoggerEnable) return;
    final part1 = Colorize("******  [$tag]:").bgWhite().black().bold().initial;
    final part2 = Colorize(" $message  ******").bgBlue().black().bold().initial;
    _output(part1 + part2);
  }

  static void logLineWithTagError({
    dynamic tag,
    dynamic message,
    dynamic error,
  }) {
    if (!_isLoggerEnable) return;
    final part1 = Colorize("******  $tag: ").bgYellow().black().bold().initial;
    final part2 = Colorize(
      "$message >>>>> Error => $error  ******",
    ).bgLightRed().black().bold().initial;
    _output(part1 + part2);
  }

  static void logDivider({dynamic symbole = '*', dynamic length = 20}) {
    if (!_isLoggerEnable) return;
    final message = Colorize(
      "$symbole" * length,
    ).bgDarkGray().yellow().bold().initial;
    _output(message);
  }

  static void logWithLine({dynamic title}) {
    if (!_isLoggerEnable) return;
    final part1 = Colorize("*" * 25).bgYellow().black().bold().initial;
    final part2 = Colorize("$title").bgBlack().white().bold().initial;
    final part3 = Colorize("*" * 25).bgYellow().black().bold().initial;
    _output(part1 + part2 + part3);
  }

  static void logMap(Map<dynamic, dynamic> map) {
    if (!_isLoggerEnable) return;
    logLine('Map contains ${map.length} entries:');
    map.forEach((key, value) {
      final part1 = Colorize("Key: $key").bgBlue().white().bold().initial;
      final part2 = Colorize(
        " => Value: $value",
      ).bgYellow().black().bold().initial;
      _output(part1 + part2);
    });
  }

  static void logMapWithTag({
    String? tag,
    String? message,
    Map<dynamic, dynamic>? map,
  }) {
    if (!_isLoggerEnable) return;
    logLine('Map contains ${map!.length} entries:');
    map.forEach((key, value) {
      final part1 = Colorize(
        "******  $tag: ",
      ).bgYellow().black().bold().initial;
      final part2 = message != null
          ? Colorize(
              " ${message.toString()}  ******",
            ).bgBlue().black().bold().initial
          : '';
      final part3 = Colorize("Key: $key").bgBlue().white().bold().initial;
      final part4 = Colorize(
        " => Value: ${value.toString()}",
      ).black().bgCyan().bold().initial;
      _output(part1 + part2 + part3 + part4);
    });
  }

  static void logErrorWithStackTrace(dynamic value, StackTrace stackTrace) {
    if (!_isLoggerEnable) return;

    final errorMessage = Colorize(
      "The Error is : ******  $value  ******",
    ).bgRed().black().bold().italic().initial;

    final stackTraceMessage = Colorize(
      "Stack Trace:\n$stackTrace",
    ).bgBlue().white().italic().bold().initial;

    _output(errorMessage);
    _output(stackTraceMessage);
  }
}
