// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:learning_go_test/src/resources/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatelessWidget {
  final bool isOn; // Current state of the switch
  final ValueChanged<bool> onChanged; // Callback when toggled
  final double width; // Width of the entire switch
  final double height; // Height of the switch track
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final Duration animationDuration;
  final bool isEnable;

  const CustomSwitch({
    super.key,
    required this.isOn, // External control of the switch state
    required this.onChanged,
    this.width = 40, // Default width
    this.height = 25, // Default height
    this.activeColor, // Replace with your color
    this.inactiveColor, // Replace with your color
    this.thumbColor,
    this.animationDuration = const Duration(milliseconds: 200),
    this.isEnable = true,
  });

  void toggleSwitch() {
    if (isEnable) {
      onChanged(!isOn); // Toggle value via callback
    }
  }

  @override
  Widget build(BuildContext context) {
    double thumbSize = height * 0.8; // Slightly smaller than track height
    double trackHeight = height;
    double trackWidth = width;

    return GestureDetector(
      onTap: toggleSwitch,
      child: SizedBox(
        width: trackWidth,
        height: trackHeight,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Track background
            AnimatedContainer(
              duration: animationDuration,
              width: trackWidth,
              height: trackHeight / 2,
              decoration: BoxDecoration(
                color: Colors.transparent,
                // isOn ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(trackHeight / 2),
                border: Border.all(
                  color: isOn
                      ? activeColor ?? ColorProvider().primary
                      : inactiveColor ?? ColorProvider().grey,
                  width: 4.w,
                ),
              ),
            ),
            // Thumb
            AnimatedPositioned(
              duration: animationDuration,
              left: isOn ? (trackWidth - thumbSize) : 0, // Thumb padding
              top: (trackHeight - thumbSize) / 2, // Center thumb vertically
              child: Container(
                width: thumbSize,
                height: thumbSize,
                decoration: BoxDecoration(
                  color: isOn
                      ? activeColor ?? ColorProvider().primary
                      : inactiveColor ?? ColorProvider().grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
