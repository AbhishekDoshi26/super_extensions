import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/src/super_extensions_base.dart';

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
        },
      );
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
}
