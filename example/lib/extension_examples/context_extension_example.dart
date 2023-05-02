import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class ContextExtensionExample extends StatelessWidget {
  const ContextExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.showSnackBar(
                const SnackBar(
                  content: Text('Snackbar'),
                ),
              );
            },
            child: const Text('Show Snackbar'),
          ),
          TextButton(
            onPressed: () {
              context.showNewDialog(
                const AlertDialog(
                  title: Text('Dialog'),
                ),
              );
            },
            child: const Text('Show Snackbar'),
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
        ],
      ),
    );
  }
}
