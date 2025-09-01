import 'dart:math';

String generateRandomColor() {
  final random = Random();

  final r = random.nextInt(150) + 50; // Range between 50 and 200
  final g = random.nextInt(130) + 50; // Range between 50 and 200
  final b = random.nextInt(130) + 50; // Range between 50 and 200

  // Convert the components to hex and return as a color string.
  return "0xFF${r.toRadixString(16).padLeft(2, '0')}"
      "${g.toRadixString(16).padLeft(2, '0')}"
      "${b.toRadixString(16).padLeft(2, '0')}";
}
