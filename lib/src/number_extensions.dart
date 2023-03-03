import 'package:flutter/material.dart';

extension NumberExtension on num {
  /// Creates an empty SizedBox with height as the given number.
  ///
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  /// Creates an empty SizedBox with width as the given number.
  ///
  SizedBox get wSizedBox => SizedBox(width: toDouble());
}
