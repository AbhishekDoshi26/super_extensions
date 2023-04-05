import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

extension StringExtension on String {
  ///Extension method on String to capitalise first character of the string.
  ///
  String capitaliseFirstChar() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);

  ///Extension method on String to capitalise first character
  ///of each word of the string.
  ///
  String capitaliseEachWordFirstChar() => isEmpty
      ? this
      : replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.capitaliseFirstChar())
          .join(' ');

  /// Extension method to copy a string to clipboard.
  /// It takes no parameters.
  /// This is how you can use it:
  /// ```dart
  /// String text = "The beautiful thing with Dart is that you  can create your own extensions.";
  ///  TextButton(
  ///     child: const Text('Copy to clipboard'),
  ///     onPressed: () => text.copyToClipboard(),
  ///    );
  /// ```
  Future<void> copyToClipboard() =>
      Clipboard.setData(ClipboardData(text: this));

  /// Extension method to check if a string is a valid email.
  /// You can pass a custom [emailPattern] as a parameter.
  /// This is how you can use it:
  /// ```dart
  /// String email = 'email@example.com';
  ///   final bool isValidEmail = email.isEmailValid();
  ///
  /// or pass a custom pattern as a parameter like this:
  ///   final bool isValidEmail = email.isEmailValid(
  ///     emailPattern: r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  ///   );
  /// ```
  bool isValidEmail({Pattern? emailPattern}) {
    final Pattern pattern = emailPattern ??
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final RegExp regex = RegExp(pattern as String);
    return isNotEmpty && regex.hasMatch(trim());
  }

  /// Extension method to get the initials of a string.
  /// It takes no parameters.
  /// This is how you can use it:
  /// ```dart
  /// String text = "Example Name";
  /// TextButton(
  ///    child: const Text('Get initials'),
  ///    onPressed: () => text.getInitials(),
  ///    );
  ///    ```
  ///    It returns "En" in this case.
  ///    If the string is empty, it returns null.
  ///    If the string has only one word, it returns the first character of the word.
  ///    If the string has more than one word, it returns the first character of each word.
  ///    ```dart
  String? get getInitials {
    final trimmed = trim();
    if (trimmed.isEmpty) {
      return null;
    }
    final parts = trimmed.split(' ');
    if (parts.length == 1) {
      return parts.first.characters.first;
    } else {
      final firstLetters = parts.map((part) => part.characters.first).join();
      return firstLetters;
    }
  }

  /// Checks if string is a palindrome.
  bool get isPalindrome {
    final string = toLowerCase()
        .replaceAll(RegExp(r"\s+"), '')
        .replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");
    final len = string.length - 1;

    for (var i = 0; i <= len; i++) {
      if (string[i] != string[len - i]) return false;
    }

    return true;
  }

  /// Extension method to reverse a string.
  /// It takes no parameters.
  /// This is how you can use it:
  /// ```dart
  /// String text = "Hello world.";
  ///  TextButton(
  ///     child: Text(text.reversed),
  ///     onPressed: null,
  ///    );
  /// ```
  String get reversed => String.fromCharCodes(runes.toList().reversed);
}
