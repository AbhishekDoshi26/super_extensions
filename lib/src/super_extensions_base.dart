import 'package:flutter/material.dart';

/// Extension methods on BuildContext
extension ContextExtension on BuildContext {
  ///Extension method on BuildContext to show a snackbar.
  ///It takes [snackBar] as the parameter of type SnackBar.
  ///If you are creating your own SnackBar, it's suggested to extend the class with SnackBar.
  ///Example to create your own SnackBar class:
  ///```
  ///class CustomSnackBar extends SnackBar {
  ///CustomSnackBar({
  ///  super.key,
  ///  required this.message,
  ///}) : super(
  ///        content: Text(message),
  ///         backgroundColor: Colors.black,
  ///      );
  ///  final String message;
  ///}
  ///```
  ///
  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  ///Extension method on BuildContext to show a dialog.
  ///It takes [child] as the parameter of type Widget.
  ///
  void showNewDialog(Widget child) => showDialog(
        context: this,
        builder: (context) => child,
      );

  double screenHeight() => MediaQuery.of(this).size.height;

  double screenWidth() => MediaQuery.of(this).size.width;

  bool isMobile() => MediaQuery.of(this).size.width < 650;

  bool isTablet() =>
      MediaQuery.of(this).size.width < 1024 &&
      MediaQuery.of(this).size.width >= 650;

  bool isDesktop() => MediaQuery.of(this).size.width >= 1024;

  void push(Widget className) => Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => className),
      );
  void pushReplacement(Widget className) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(builder: (context) => className),
      );
  void pushNamed(String path) => Navigator.of(this).pushNamed(path);

  void pushReplacementNamed(String path) =>
      Navigator.of(this).pushReplacementNamed(path);

  void pushAndRemoveUntil(Widget className) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => className,
        ),
        (route) => true,
      );

  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        path,
        (route) => true,
      );

  void pop() => Navigator.of(this).pop();

  void popAndPushNamed(String path) => Navigator.of(this).popAndPushNamed(path);
}

extension StringExtension on String {
  String capitaliseFirstChar() =>
      isEmpty ? this : this[0].toUpperCase() + substring(0, length);

  String capitaliseEachWordFirstChar() => isEmpty
      ? this
      : replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.capitaliseFirstChar())
          .join(' ');
}

extension NumberExtension on num {
  /// creates a Empty [SizedBox] with height as the given number
  /// 
  SizedBox get pH => SizedBox(height: toDouble());

  /// creates a Empty [SizedBox] with width as the given number
  /// 
  SizedBox get pW => SizedBox(width: toDouble());
}
