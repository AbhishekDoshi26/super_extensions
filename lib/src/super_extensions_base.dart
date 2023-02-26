import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

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

  ///Extension method on BuildContext to get the screenHeight.
  ///It returns MediaQuery.of(context).size.height
  ///
  double get screenHeight => MediaQuery.of(this).size.height;

  ///Extension method on BuildContext to get the screenWidth.
  ///It returns MediaQuery.of(context).size.width
  ///
  double get screenWidth => MediaQuery.of(this).size.width;

  ///Extension method on BuildContext to get the screen aspectRatio.
  ///It returns MediaQuery.of(context).size.aspectRatio
  ///
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of mobile or not.
  ///It returns true if MediaQuery.of(context).size.width<650, else returns false.
  ///
  bool get isMobile => MediaQuery.of(this).size.width < 650;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of tablet or not.
  ///It returns true if 1024>MediaQuery.of(context).size.width>=650, else returns false.
  ///
  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024 &&
      MediaQuery.of(this).size.width >= 650;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of desktop or not.
  ///It returns true if MediaQuery.of(context).size.width>=1024, else returns false.
  ///
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;

  ///Extension method on BuildContext to push to [className]
  ///using Navigator 1.0
  ///
  void push(Widget className) => Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => className),
      );

  ///Extension method on BuildContext to pushReplacement to [className]
  ///using Navigator 1.0
  ///
  void pushReplacement(Widget className) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(builder: (context) => className),
      );

  ///Extension method on BuildContext to pushNamed to [path]
  ///using Navigator 1.0
  ///
  void pushNamed(String path) => Navigator.of(this).pushNamed(path);

  ///Extension method on BuildContext to pushReplacementNamed to [path]
  ///using Navigator 1.0
  ///
  void pushReplacementNamed(String path) =>
      Navigator.of(this).pushReplacementNamed(path);

  ///Extension method on BuildContext to pushAndRemoveUntil to [className]
  ///using Navigator 1.0
  ///
  void pushAndRemoveUntil(Widget className) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => className,
        ),
        (route) => true,
      );

  ///Extension method on BuildContext to pushNamedAndRemoveUntil to [path]
  ///using Navigator 1.0
  ///
  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        path,
        (route) => true,
      );

  ///Extension method on BuildContext to pop the current screen
  ///using Navigator 1.0
  ///
  void pop() => Navigator.of(this).pop();

  ///Extension method on BuildContext to pop the current screen
  ///and push the [path] using Navigator 1.0
  ///
  void popAndPushNamed(String path) => Navigator.of(this).popAndPushNamed(path);
}

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
}

extension NumberExtension on num {
  /// Creates an empty SizedBox with height as the given number.
  ///
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  /// Creates an empty SizedBox with width as the given number.
  ///
  SizedBox get wSizedBox => SizedBox(width: toDouble());
}
