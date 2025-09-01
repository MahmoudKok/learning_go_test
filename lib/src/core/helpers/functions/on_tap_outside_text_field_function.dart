import 'package:flutter/material.dart';

void onTapOutsideTextField() {
  FocusManager.instance.primaryFocus?.unfocus();
}
