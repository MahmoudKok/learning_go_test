extension EnumToStringExtension on Enum {
  String toReadableString() {
    // Converts enum name to a readable string by splitting on camel case
    return name.replaceAllMapped(
      RegExp(r'(?<=[a-z])(?=[A-Z])'),
      (match) => ' ',
    );
  }
}
