import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/super_extensions.dart';

void main() {
  const helloWorld = 'Hello World';

  Future handler(MethodCall methodCall) async {
    if (methodCall.method == 'Clipboard.setData') {
      // ensure text passed is correct
      expect(methodCall.arguments['text'], helloWorld);
    }

    if (methodCall.method == 'Clipboard.getData') {
      return {'text': helloWorld};
    }

    return null;
  }

  testWidgets(
    'Check if text is successfully copied to clipboard',
    (tester) async {
      // ignore: deprecated_member_use
      SystemChannels.platform.setMockMethodCallHandler(handler);
      const Key tapTarget = Key('tap-target');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      key: tapTarget,
                      onPressed: () async {
                        await helloWorld.copyToClipboard();
                      },
                      child: const Text('Copy Hello World'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
      // text.copyToClipboard();

      await tester.tap(find.byKey(tapTarget));
      await tester.pump();

      final data = await Clipboard.getData(Clipboard.kTextPlain);

      // null check
      expect(data != null, true);

      // text check
      expect(data?.text, 'Hello World');
    },
  );
}
