import 'package:example/extension_examples/extension_examples.dart';
import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Extensions'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push(const ContextExtensionExample());
                },
                child: const Text('BuildContext Extensions'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(
                    const StringExtensionExample(
                      data: 'super extensions',
                      email: 'abc@gmail.com',
                    ),
                  );
                },
                child: const Text('String Extensions'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(const TextWidgetExtensionExample());
                },
                child: const Text('Text Widget Extensions'),
              ),
            ].separator(const SizedBox(height: 8.0)).toList(),
          ),
        ),
      ),
    );
  }
}
