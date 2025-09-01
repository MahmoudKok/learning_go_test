import 'package:learning_go_test/src/core/enums/roundnes_level.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double calculateRoundness(
  double width,
  double height,
  RoundnessLevel roundness,
) {
  double borderRadius;

  switch (roundness) {
    case RoundnessLevel.none:
      borderRadius = 0.0;
      break;
    case RoundnessLevel.low:
      borderRadius =
          (width + height) / 30.r; // Adjust the divisor for desired roundness
      break;
    case RoundnessLevel.medium:
      borderRadius =
          (width + height) / 15.r; // Adjust the divisor for desired roundness
      break;
    case RoundnessLevel.high:
      borderRadius =
          (width + height) / 10.r; // Adjust the divisor for desired roundness
      break;
  }

  return borderRadius;
}
