import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/src/widget_extention.dart';

void main() {
  group("widget_extention tests", () {
    testWidgets(
        'paddingDirectional should add directional padding to each widget',
        (WidgetTester tester) async {
      final List<Widget> originalList = [
        Container(),
        const Text('Hello'),
        const Icon(Icons.star),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: originalList.paddingDirectional(
                top: 8.0,
                bottom: 16.0,
                left: 4.0,
                right: 12.0,
              ),
            ),
          ),
        ),
      );

      for (int i = 0; i < originalList.length; i++) {
        final Finder paddingFinder = find.ancestor(
          of: find.byWidget(originalList[i]),
          matching: find.byType(Padding),
        );

        expect(paddingFinder, findsOneWidget);

        final Padding paddingWidget = tester.widget(paddingFinder);
        expect(
            paddingWidget.padding,
            const EdgeInsets.only(
              top: 8.0,
              bottom: 16.0,
              left: 4.0,
              right: 12.0,
            ));

        expect(find.byWidget(originalList[i]), findsOneWidget);
      }
    });
    testWidgets('paddingAll should be applied to all side of the Widget',
        (WidgetTester tester) async {
      final List<Widget> originalList = [
        Container(),
        const Text('Hello'),
        const Icon(Icons.star),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: originalList.paddingAll(20),
            ),
          ),
        ),
      );

      for (int i = 0; i < originalList.length; i++) {
        final Finder paddingFinder = find.ancestor(
          of: find.byWidget(originalList[i]),
          matching: find.byType(Padding),
        );

        expect(paddingFinder, findsOneWidget);

        final Padding paddingWidget = tester.widget(paddingFinder);
        expect(paddingWidget.padding, const EdgeInsets.all(20));

        expect(find.byWidget(originalList[i]), findsOneWidget);
      }
    });
    testWidgets(
        'paddingSymmetric should be applied  horizontally and/or vertically',
        (WidgetTester tester) async {
      final List<Widget> originalList = [
        Container(),
        const Text('Hello'),
        const Icon(Icons.star),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: originalList.paddingSymmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
          ),
        ),
      );

      for (int i = 0; i < originalList.length; i++) {
        final Finder paddingFinder = find.ancestor(
          of: find.byWidget(originalList[i]),
          matching: find.byType(Padding),
        );

        expect(paddingFinder, findsOneWidget);

        final Padding paddingWidget = tester.widget(paddingFinder);
        expect(
            paddingWidget.padding,
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ));

        expect(find.byWidget(originalList[i]), findsOneWidget);
      }
    });
  });
}
