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

  ///Extension method on BuildContext to get the screenHeight.
  ///It returns MediaQuery.of(context).size.height
  ///
  double get screenHeight => MediaQuery.sizeOf(this).height;

  ///Extension method on BuildContext to get the screenWidth.
  ///It returns MediaQuery.of(context).size.width
  ///
  double get screenWidth => MediaQuery.sizeOf(this).width;

  ///Extension method on BuildContext to get the screen aspectRatio.
  ///It returns MediaQuery.of(context).size.aspectRatio
  ///
  double get aspectRatio => MediaQuery.sizeOf(this).aspectRatio;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of mobile or not.
  ///It returns true if MediaQuery.of(context).size.width<650, else returns false.
  ///
  bool get isMobile => MediaQuery.sizeOf(this).width < 650;

  /// Extension method on BuildContext for getting padding
  /// return `EdgeInsets`
  ///
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Extension method on BuildContext to for getting viewPadding
  /// return `EdgeInsets`
  ///
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Extension method on BuildContext for viewInsets
  /// returns `EdgeInsets`
  ///
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  ///Extension method on BuildContext that returns whether the screen
  ///size is of tablet or not.
  ///It returns true if 1024=>MediaQuery.of(context).size.width>=650, else returns false.
  ///
  bool get isTablet =>
      MediaQuery.sizeOf(this).width <= 1024 &&
      MediaQuery.sizeOf(this).width >= 650;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of desktop or not.
  ///It returns true if MediaQuery.of(context).size.width>=1024, else returns false.
  ///
  bool get isDesktop => MediaQuery.sizeOf(this).width > 1024;

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
        (route) => false,
      );

  ///Extension method on BuildContext to pushNamedAndRemoveUntil to [path]
  ///using Navigator 1.0
  ///
  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        path,
        (route) => false,
      );

  ///Extension method on BuildContext to pop the current screen
  ///using Navigator 1.0
  ///
  void pop() => Navigator.of(this).pop();

  ///Extension method on BuildContext to pop the current and return true
  /// if a popping event is possible and false if it's not using Navigator 1.0
  Future<bool> maybePop() => Navigator.of(this).maybePop();

  ///Extension method on BuildContext to pop the current screen
  ///and push the [path] using Navigator 1.0
  ///
  void popAndPushNamed(String path) => Navigator.of(this).popAndPushNamed(path);
}
