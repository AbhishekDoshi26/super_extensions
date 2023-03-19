import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/super_extensions.dart';

void main() {
  testWidgets(
    'Check special part with valid data',
    (tester) async {
      var buffer = StringBuffer();
      var text = "Accept terms & conditions and privacy policy to continue";
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SafeArea(
              child: Text(text).withClickableParts([
                Part(
                    text: "terms & conditions",
                    onClick: () {},
                    style: const TextStyle(color: Colors.blue)),
                Part(
                    text: "privacy policy",
                    onClick: () {},
                    style: const TextStyle(color: Colors.blue)),
              ]),
            ),
          ),
        ),
      );

      expect(find.text(text, findRichText: true), findsOneWidget);

      RichText richText =
          tester.widget(find.text(text, findRichText: true)) as RichText;
      (richText.text as TextSpan).computeToPlainText(buffer);
      expect(buffer.toString(), text);

      expect((richText.text as TextSpan).children?.length, 5);

      (richText.text as TextSpan).children?.forEach((element) {
        buffer.clear();
        (element as TextSpan).computeToPlainText(buffer);

        if (buffer.toString() == "terms & conditions") {
          expect(element.style?.color, Colors.blue);
        } else if (buffer.toString() == "privacy policy") {
          expect(element.style?.color, Colors.blue);
        } else {
          expect(element.style?.color, null);
        }
      });
    },
  );

  testWidgets('Check if parts are not given', (tester) async {
    var text = "Accept terms & conditions and privacy policy";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Text(text).withClickableParts([]),
          ),
        ),
      ),
    );
    expect(find.text(text), findsOneWidget);
  });

  testWidgets('Check if parts are not in order', (tester) async {
    var buffer = StringBuffer();
    var text = "Accept terms & conditions and privacy policy";
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Text(text).withClickableParts([
              Part(
                  text: "and",
                  onClick: () {},
                  style: const TextStyle(color: Colors.grey)),
              Part(
                  text: "privacy policy",
                  onClick: () {},
                  style: const TextStyle(color: Colors.blue)),
              Part(
                  text: "terms & conditions",
                  onClick: () {},
                  style: const TextStyle(color: Colors.blue)),
            ]),
          ),
        ),
      ),
    );

    expect(find.text(text, findRichText: true), findsOneWidget);

    RichText richText =
        tester.widget(find.text(text, findRichText: true)) as RichText;
    (richText.text as TextSpan).computeToPlainText(buffer);
    expect(buffer.toString(), text);
  });

  testWidgets(
    'Check error is shown with invalid data',
    (tester) async {
      var text = "Accept terms & conditions and privacy policy";
      expect(
          () => Text(text).withClickableParts([
                Part(
                    text: "terms & conditions",
                    onClick: () {},
                    style: const TextStyle(color: Colors.blue)),
                Part(
                    text: "privacy policy to",
                    onClick: () {},
                    style: const TextStyle(color: Colors.blue)),
              ]),
          throwsA(isA<AssertionError>()));
    },
  );
}
