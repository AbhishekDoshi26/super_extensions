extension NullStringExtension on String? {
  ///Extension method on String? to return empty string if string's value is null
  String emptyStringIfNull() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}
