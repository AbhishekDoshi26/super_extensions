import 'package:flutter/widgets.dart';

/// Extension on [Iterable] to add a separator between each widget using generators.
extension IterableExt on Iterable<Widget> {
  Iterable<Widget> separator(Widget element) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}
