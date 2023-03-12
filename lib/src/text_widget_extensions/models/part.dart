import 'package:flutter/material.dart';

class Part {
  String text;
  TextStyle? style;
  Function onClick;

  ///*[text]*: text that you want to make special.
  ///
  ///*[style]*: Style of special part(Optional).
  ///
  ///*[onClick]*: Action to perform when special part clicked.
  Part({required this.text, required this.onClick, this.style});
}
