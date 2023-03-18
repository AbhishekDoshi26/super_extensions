import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/super_extensions.dart';

void main() {
  group(
    'String-extension tests',
    () {
      test(
        'Ensure only the first character of a string is capitalized',
        () {
          // ensure empty string returns empty
          final text0 = ''.capitaliseFirstChar();
          expect(text0.isEmpty, true);

          // operation on single word
          final text1 = 'test'.capitaliseFirstChar();
          expect(text1, 'Test');

          // operation on a group of words/sentence
          final text2 = 'hello world'.capitaliseFirstChar();
          expect(text2, 'Hello world');

          // returns back capitalized string
          final text3 = 'Test'.capitaliseFirstChar();
          expect(text3, 'Test');
        },
      );

      test(
        'Ensure first letter of a group of string(s), also known as sentences, are capitalized',
        () {
          // ensure empty string returns empty
          final text0 = ''.capitaliseFirstChar();
          expect(text0.isEmpty, true);

          // operation on single word
          final text1 = 'test'.capitaliseEachWordFirstChar();
          expect(text1, 'Test');

          // operation on a group of words/sentence
          final text2 = 'hello world'.capitaliseEachWordFirstChar();
          expect(text2, 'Hello World');

          // returns back capitalized string
          final text3 = 'Hello   World'.capitaliseEachWordFirstChar();
          expect(text3, 'Hello World');
        },
      );

      test(
        'Ensure valid emails are valid',
        () {
          const email0 = 'test@gmail.com';
          expect(email0.isValidEmail(), true);

          const email1 = 'test.1234@test.co';
          expect(email1.isValidEmail(), true);
        },
      );

      test(
        'Ensure appropriate initials from strings',
        () {
          const text0 = 'first test ';
          expect(text0.getInitials, 'ft');

          const text1 = 'John Harry Doe';
          expect(text1.getInitials, 'JHD');

          const text2 = 'John';
          expect(text2.getInitials, 'J');
        },
      );

      test('Ensure valid palindroms returned correct', () {
        // palindrom check on empty string
        final isPalindrom0 = ''.isPalindrom;
        // An empty string is also a palindrome, since it "reads" the same forward and backward.
        expect(isPalindrom0, true);

        // palindrom check on odd number of characters
        final isPalindrom1 = 'abcba'.isPalindrom;
        expect(isPalindrom1, true);

        // palindrom check on even number of characters
        final isPalindrom2 = 'abccba'.isPalindrom;
        expect(isPalindrom2, true);
      });

      test('Ensure non valid palindroms returned correct', () {
        final isPalindrom0 = 'abcd'.isPalindrom;
        expect(isPalindrom0, false);
      });
    },
  );

  group(
    'Number-extension tests',
    () {
      test(
        'Ensure the height sizing of the SizedBox returned are correct',
        () {
          final box0 = 50.hSizedBox;
          expect(box0.height, 50.0);
          expect(box0.width, null);
        },
      );

      test(
        'Ensure the width sizing of the SizedBox returned are correct',
        () {
          final box0 = 50.wSizedBox;
          expect(box0.width, 50.0);
          expect(box0.height, null);
        },
      );
    },
  );

  group(
    'Null-String-extension tests',
    () {
      test(
        'Ensure that it will return the same string or empty if string is null',
        () {
          const String? str0 = null;
          expect(str0.orEmptyStringIfNull(), "");

          const String str1 = "test";
          expect(str1.orEmptyStringIfNull(), "test");
        },
      );
    },
  );
}
