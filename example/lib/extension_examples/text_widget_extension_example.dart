import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class TextWidgetExtensionExample extends StatelessWidget {
  const TextWidgetExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Widget Extension Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Accept term & conditions to continue",
              style: TextStyle(color: Colors.black),
            ).withClickableParts(
              [
                Part(
                  text: "term & conditions",
                  onClick: () {
                    log("term & condition clicked");
                  },
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            )
          ].separator(8.hSizedBox).toList(),
        ),
      ),
    );
  }
}
