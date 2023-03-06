import 'package:flutter/material.dart';

extension NumberExtension on num {
  /// Creates an empty SizedBox with height as the given number.
  ///
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  /// Creates an empty SizedBox with width as the given number.
  ///
  SizedBox get wSizedBox => SizedBox(width: toDouble());

  /// Converts the number to currency format
  /// ```dart
  /// 123.toCurrency()  // '$123'
  /// 
  /// 123.toCurrency(currencyUnit: 'Rs.')  // 'Rs.123'
  /// ```
  String toCurrency({String currencyUnit = '\$'}) => '$currencyUnit$this';

}
