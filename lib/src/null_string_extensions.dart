extension NullStringExtension on String? {
  ///Extension method on String? to return empty string if String value is null
  String emptyStringIfNull() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}
