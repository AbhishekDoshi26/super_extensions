import 'package:flutter/material.dart';

extension PaddingExtentions on List<Widget> {
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

  List<Widget> paddingAll(double padding) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.all(padding),
        child: e,
      ),
    ).toList();
  }
}
