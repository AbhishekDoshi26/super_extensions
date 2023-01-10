import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  double screenHeight() {
    return MediaQuery.of(this).size.height;
  }

  double screenWidth() {
    return MediaQuery.of(this).size.width;
  }
}
