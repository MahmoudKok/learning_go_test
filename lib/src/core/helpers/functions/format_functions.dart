String formatPhoneNumber(String value) {
  if (value.isEmpty) return "";

  // Remove non-digit characters
  value = value.replaceAll(RegExp(r'\D'), '');

  // Format according to the length of the input
  if (value.length <= 2) {
    // No formatting needed for lengths 1 and 2
    return value;
  } else if (value.length <= 5) {
    // Format as XX XXX for lengths 3 to 5
    return '${value.substring(0, 2)} ${value.substring(2)}';
  } else if (value.length <= 8) {
    // Format as XX XXX XXXX for lengths 6 to 8
    return '${value.substring(0, 2)} ${value.substring(2, 5)} ${value.substring(5)}';
  } else if (value.length <= 9) {
    // Format as XX XXX XXXX for lengths 9
    return '${value.substring(0, 2)} ${value.substring(2, 5)} ${value.substring(5)}';
  } else if (value.length <= 10) {
    // Format as XXX XXX XXXX for lengths 10
    return '${value.substring(0, 3)} ${value.substring(3, 6)} ${value.substring(6)}';
  } else {
    // Return the value unformatted if it exceeds expected lengths
    return value;
  }
}
/*
? Format phone number for Syrian 9 digit Number

  if (value.isEmpty) return "";

  int formattedLength = value.length;
  List<String> parts = [];
  for (int i = 0; i < formattedLength; i += 3) {
    int end = (i + 3) < formattedLength ? i + 3 : formattedLength;
    parts.add(value.substring(i, end));
  }
  return parts.join(' ');
*/
