import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/src/iterator_extension.dart';

void main() {
  group('Widget Separator', () {
    test('No separator if widget list is empty', () async {
      final widgets = <Widget>[];
      final result = widgets.separator(const SizedBox()).toList();
      expect(result.isEmpty, true);
    });

    test('No separator on one widget', () async {
      final widgets = [const Text('T1')];
      final result = widgets.separator(const SizedBox()).toList();
      expect(result.length, 1);
      expect(result[0].runtimeType, Text);
    });

    test('One separator in between two widgets', () async {
      final widgets = [const Text('T1'), const Text('T2')];
      final result = widgets.separator(const SizedBox()).toList();
      expect(result.length, 3);
      expect(result[0].runtimeType, Text);
      expect(result[1].runtimeType, SizedBox);
      expect(result[2].runtimeType, Text);
    });

    test('Two separator in between three widgets', () async {
      final widgets = [const Text('T1'), const Text('T2'), const Text('T3')];
      final result = widgets.separator(const SizedBox()).toList();
      expect(result.length, 5);
      expect(result[0].runtimeType, Text);
      expect(result[1].runtimeType, SizedBox);
      expect(result[2].runtimeType, Text);
      expect(result[3].runtimeType, SizedBox);
      expect(result[4].runtimeType, Text);
    });
  });
}
