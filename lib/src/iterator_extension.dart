import 'package:flutter/widgets.dart';

/// Extension on Iterable to add a separator between each widget using generators.
extension IterableExt on Iterable<Widget> {
  ///Add separator widget in between the items.
  ///It takes [element] as the parameter of type Widget.
  ///Example to use these in the Column class:
  ///```
  ///Column(
  ///  children: [
  ///    const Text('T1'),
  ///    const Text('T2'),
  ///    const Text('T3'),
  ///    const Text('T4'),
  ///  ].separator(const SizedBox(height: 8.0)).toList(),
  ///);
  ///```
  ///
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
