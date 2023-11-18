import 'package:flutter/material.dart';

/// Extension to add padding to a list of widgets.
extension PaddingExtensions on List<Widget> {
  /// Adds directional padding to each widget in the list.
  /// Default value set to 0.0
  ///
  /// Parameters:
  ///
  /// - `top` (optional): The padding value for the top side.
  /// - `bottom` (optional): The padding value for the bottom side.
  /// - `left` (optional): The padding value for the left side.
  /// - `right` (optional): The padding value for the right side.

  List<Widget> paddingDirectional({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          left: left ?? 0,
          right: right ?? 0,
        ),
        child: e,
      ),
    ).toList();
  }

  /// Adds symmetric padding to each widget in the list.
  /// Default Value for all Params set to 0
  ///
  /// Parameters:
  ///
  /// - `vertical` (optional): The vertical padding value.
  /// - `horizontal` (optional): The horizontal padding value.

  List<Widget> paddingSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? 0,
          horizontal: horizontal ?? 0,
        ),
        child: e,
      ),
    ).toList();
  }

  /// Adds the same padding to all sides of each widget in the list.
  /// Default Value set to 0.
  /// Parameters:
  ///
  /// - `padding`: The padding value for all sides.
  List<Widget> paddingAll(double padding) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.all(padding),
        child: e,
      ),
    ).toList();
  }
}
