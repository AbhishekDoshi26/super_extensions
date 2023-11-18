import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class ContextExtensionExample extends StatelessWidget {
  const ContextExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Extension Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.showSnackBar(
                    const SnackBar(
                      content: Text('Snackbar'),
                    ),
                  );
                },
                child: const Text('Show Snackbar'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.showNewDialog(
                    const AlertDialog(
                      title: Text('Dialog'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
              Text('Screen Height: ${context.screenHeight}'),
              Text('Screen Width: ${context.screenWidth}'),
              Text('Screen AspectRatio: ${context.aspectRatio}'),
              Padding(
                padding: context.padding,
                child: const Text('Text wrapped with Screen Padding'),
              ),
              Padding(
                padding: context.viewInsets,
                child: const Text('Text wrapped with ViewInsets'),
              ),
              Padding(
                padding: context.viewPadding,
                child: const Text('Text wrapped with View Padding'),
              ),
              Text('Is the device mobile?: ${context.isMobile}'),
              Text('Is the device tablet?: ${context.isTablet}'),
              Text('Is the device desktop?: ${context.isDesktop}'),
            ].paddingSymmetric(horizontal: 20, vertical: 10)

            // Separator from iterator extension and hSizedBox from number extension
            ),
      ),
    );
  }
}
