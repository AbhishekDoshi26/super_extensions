import 'package:example/extension_examples/context_extension_example.dart';
import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.push(const ContextExtensionExample());
              },
              child: const Text('BuildContext Extensions'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Number Extensions'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('String Extensions'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Widget Extensions'),
            ),
          ].separator(const SizedBox(height: 8.0)).toList(),
        ),
      ),
    );
  }
}
