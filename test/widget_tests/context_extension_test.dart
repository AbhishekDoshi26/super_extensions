// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:super_extensions/super_extensions.dart';

// mock observer for testing navigations
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

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
                        const Column(
                          children: [
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
    'Ensure the edge-insets constraints are correct from padding getter',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(450, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      binding.window.viewPaddingTestValue = WindowPadding.zero;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.padding == EdgeInsets.zero, true);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'Ensure the edge-insets constraints are correct from viewPadding getter',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(450, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      binding.window.viewPaddingTestValue = WindowPadding.zero;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.viewPadding == EdgeInsets.zero, true);
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    },
  );

  testWidgets(
    'Ensure the edge-insets constraints are correct from viewInsets getter',
    (tester) async {
      binding.window.physicalSizeTestValue = const Size(450, 600);
      binding.window.devicePixelRatioTestValue = 1.0;
      binding.window.viewInsetsTestValue = WindowPadding.zero;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                expect(context.viewInsets == EdgeInsets.zero, true);
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

  testWidgets(
    'Ensure push extension method works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      key: tapTarget,
                      onPressed: () => context.push(
                        const _TestPageTwo(text: helloWorld),
                      ),
                      child: const Text('Navigate to second page'),
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
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);
    },
  );

  testWidgets(
    'Ensure pushReplacement extension method works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      key: tapTarget,
                      onPressed: () => context.pushReplacement(
                        _TestPageTwo(
                          text: helloWorld,
                          buttonKey: tapTarget2,
                          buttonOnTap: (context) async {
                            expect(
                                await Navigator.of(context).maybePop(), false);
                          },
                        ),
                      ),
                      child: const Text('Navigate to second page'),
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
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);

      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'Ensure pushNamed extension works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            TextButton(
                              key: tapTarget,
                              onPressed: () =>
                                  context.pushNamed(_TestPageTwo.routeName),
                              child: const Text('Navigate to second page'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              case _TestPageTwo.routeName:
                return MaterialPageRoute(
                  builder: (_) => const _TestPageTwo(text: helloWorld),
                );
            }
            return null;
          },
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));

      expect(find.text(helloWorld), findsNothing);
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);
    },
  );

  testWidgets(
    'Ensure pushReplacementNamed extension works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            TextButton(
                              key: tapTarget,
                              onPressed: () => context.pushReplacementNamed(
                                _TestPageTwo.routeName,
                              ),
                              child: const Text('Navigate to second page'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              case _TestPageTwo.routeName:
                return MaterialPageRoute(
                  builder: (_) => _TestPageTwo(
                    text: helloWorld,
                    buttonKey: tapTarget2,
                    buttonOnTap: (context) async {
                      expect(await Navigator.of(context).maybePop(), false);
                    },
                  ),
                );
            }
            return null;
          },
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));

      expect(find.text(helloWorld), findsNothing);
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);

      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'Ensure pushAndRemoveUntil works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      key: tapTarget,
                      onPressed: () => context.pushAndRemoveUntil(
                        _TestPageTwo(
                          text: helloWorld,
                          buttonKey: tapTarget2,
                          buttonOnTap: (context) async {
                            expect(
                                await Navigator.of(context).maybePop(), false);
                          },
                        ),
                      ),
                      child: const Text('Navigate to second page'),
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
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);

      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'Ensure pushNamedAndRemoveUntil works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            TextButton(
                              key: tapTarget,
                              onPressed: () => context.pushNamedAndRemoveUntil(
                                _TestPageTwo.routeName,
                              ),
                              child: const Text('Navigate to second page'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              case _TestPageTwo.routeName:
                return MaterialPageRoute(
                  builder: (_) => _TestPageTwo(
                    text: helloWorld,
                    buttonKey: tapTarget2,
                    buttonOnTap: (context) async {
                      expect(await context.maybePop(), false);
                    },
                  ),
                );
            }
            return null;
          },
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));

      expect(find.text(helloWorld), findsNothing);
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);

      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'Ensure pop extension works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    TextButton(
                      key: tapTarget,
                      onPressed: () => context.push(
                        _TestPageTwo(
                          text: helloWorld,
                          buttonKey: tapTarget2,
                          buttonOnTap: (context) async {
                            context.pop();
                          },
                        ),
                      ),
                      child: const Text('Navigate to second page'),
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
      await tester.pumpAndSettle(); // schedule animation

      expect(find.text(helloWorld), findsOneWidget);

      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();

      // back on first page
      expect(find.text(helloWorld), findsNothing);
      expect(find.byKey(tapTarget), findsOneWidget);
    },
  );

  testWidgets(
    'Ensure popAndPushNamed extension works',
    (tester) async {
      final mockObserver = MockNavigatorObserver();
      const helloWorld = 'Hello World';
      const helloWorld2 = 'Hello World 2';
      const Key tapTarget = Key('tap-target');
      const Key tapTarget2 = Key('tap-target-1');
      const Key tapTarget3 = Key('tap-target-2');

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            TextButton(
                              key: tapTarget,
                              onPressed: () => context.pushNamed(
                                _TestPageTwo.routeName,
                              ),
                              child: const Text('Navigate to second page'),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              case _TestPageTwo.routeName:
                return MaterialPageRoute(
                  builder: (_) => _TestPageTwo(
                    text: helloWorld,
                    buttonKey: tapTarget2,
                    buttonOnTap: (context) {
                      context.popAndPushNamed(_TestPageTwo.routeNameTwo);
                    },
                  ),
                );
              case _TestPageTwo.routeNameTwo:
                return MaterialPageRoute(
                  builder: (_) => _TestPageTwo(
                    text: helloWorld2,
                    buttonKey: tapTarget3,
                    buttonOnTap: (context) {
                      context.pop();
                    },
                  ),
                );
            }
            return null;
          },
        ),
      );

      expect(find.text(helloWorld), findsNothing);
      await tester.tap(find.byKey(tapTarget));
      expect(find.text(helloWorld), findsNothing);
      await tester.pumpAndSettle(); // schedule animation

      // navigate to next page
      expect(find.text(helloWorld), findsOneWidget);
      await tester.tap(find.byKey(tapTarget2));
      await tester.pumpAndSettle();

      // navigate to 3rd page
      expect(find.text(helloWorld2), findsOneWidget);
      await tester.tap(find.byKey(tapTarget3));
      await tester.pumpAndSettle();
      expect(find.text(helloWorld2), findsNothing);

      // back on first page
      expect(find.text(helloWorld), findsNothing);
      expect(find.byKey(tapTarget), findsOneWidget);
    },
  );
}

class _TestPageTwo extends StatelessWidget {
  static const routeName = '/test-page-two';
  static const routeNameTwo = '/test-page-three';

  const _TestPageTwo({
    required this.text,
    this.buttonKey,
    this.buttonOnTap,
  });
  final String text;
  final Key? buttonKey;
  final Function(BuildContext)? buttonOnTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(text),
          TextButton(
            key: buttonKey,
            onPressed: () => buttonOnTap?.call(context),
            child: const Text('Pop Page'),
          ),
        ],
      ),
    );
  }
}
