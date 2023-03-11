import 'package:flutter_test/flutter_test.dart';
import 'package:super_extensions/super_extensions.dart';

void main() {
  group(
    'sortParts tests',
    () {
      test(
        'Ensure the sorted parts is in correct order',
        () {
          var text = "aaa bbb ccc ddd eee";
          List<Part> parts = [
            Part(text: "ddd", onClick: () {}),
            Part(text: "bbb", onClick: () {}),
            Part(text: "aaa", onClick: () {}),
          ];
          var sortedParts = sortPartsAsPerOrderInText(parts, text);
          expect(sortedParts[0].text, "aaa");
          expect(sortedParts[1].text, "bbb");
          expect(sortedParts[2].text, "ddd");
        },
      );

      test(
        'Ensure the sorted parts is in correct order if already in order',
        () {
          var text = "aaa bbb ccc ddd eee";
          List<Part> parts = [
            Part(text: "aaa", onClick: () {}),
            Part(text: "bbb", onClick: () {}),
            Part(text: "ddd", onClick: () {}),
          ];
          var sortedParts = sortPartsAsPerOrderInText(parts, text);

          expect(sortedParts[0].text, "aaa");
          expect(sortedParts[1].text, "bbb");
          expect(sortedParts[2].text, "ddd");
        },
      );

      test(
        'Ensure the throw exception if parts is not in list',
        () {
          var text = "aaa bbb ccc ddd eee";
          List<Part> parts = [
            Part(text: "fff", onClick: () {}),
            Part(text: "bbb", onClick: () {}),
            Part(text: "ddd", onClick: () {}),
          ];
          expect(
              () => sortPartsAsPerOrderInText(parts, text),
              throwsA(
                  "Part 'fff' is not available in text or might be you have used multiple times"));
        },
      );
    },
  );
}
