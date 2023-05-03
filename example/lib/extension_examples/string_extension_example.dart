import 'package:flutter/material.dart';
import 'package:super_extensions/super_extensions.dart';

class StringExtensionExample extends StatelessWidget {
  const StringExtensionExample({
    required this.data,
    required this.email,
    super.key,
  });

  final String data;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Extension Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Initial Data: $data'),
            Text('Capitalise First Char: ${data.capitaliseFirstChar}'),
            Text(
              'Capitalise Each Word First Char: ${data.capitaliseEachWordFirstChar}',
            ),
            ElevatedButton(
              child: Text('$data (click to copy to clipboard)'),
              onPressed: () => data.copyToClipboard(),
            ),
            Text('Is Valid Email: ${email.isValidEmail()}'),
            Text('Get initials of data: ${data.getInitials!}'),
            Text('Is Data Palindrome: ${data.isPalindrome.toString()}'),
            Text('Reversed Data: ${data.reversed.toString()}'),
          ].separator(20.hSizedBox).toList(),
        ),
      ),
    );
  }
}
