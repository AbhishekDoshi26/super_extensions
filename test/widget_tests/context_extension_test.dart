import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/src/super_extensions_base.dart';

void main() {
  late final TestWidgetsFlutterBinding binding;
  setUpAll(() => binding = TestWidgetsFlutterBinding.ensureInitialized());

  testWidgets(
    'Check if snack bar is shown',
    (tester) async {
      const helloWorld = 'Hello World';
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
                      onPressed: () => context.showSnackBar(
                        const SnackBar(
                          content: Text(helloWorld),
                          duration: Duration(seconds: 5),
                        ),
                      ),
                      child: const Text('Show SnackBar'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));

      expect(find.text(helloWorld), findsNothing);
      await tester.pump(); // schedule animation
      expect(find.text(helloWorld), findsOneWidget);
    },
  );

  testWidgets(
    'Ensure newDialog is shown',
    (tester) async {
      const helloWorld = 'Hello World';
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
                      onPressed: () => context.showNewDialog(
                        Column(
                          children: const [
                            Text(helloWorld),
                          ],
                        ),
                      ),
                      child: const Text('Show New Dialog'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));

      expect(find.text(helloWorld), findsNothing);
      await tester.pump(); // schedule animation
      expect(find.text(helloWorld), findsOneWidget);
    },
  );

  testWidgets(
    'ScreenHeight getter test',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 600);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final screenHeight = context.screenHeight;
                expect(screenHeight, 600);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'ScreenWidth getter test',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(400, 600);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final screenWidth = context.screenWidth;
                expect(screenWidth, 400);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'AspectRatio getter test',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(450, 600);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final aspectRatio = context.aspectRatio;

                // aspectRatio = width/height
                expect(aspectRatio, 0.75);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'Check if device is mobile using size constraints',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(450, 600);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.isMobile, true);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'Check if device is tablet using size constraints',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(700, 900);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.isTablet, true);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'Check if device is desktop using size constraints',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 1500);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.isDesktop, true);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );
}
