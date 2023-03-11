import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension TextWidgetExtensions on Text {
  ///Extensions method to make specific part of [Text] clickable or in different style.
  ///
  ///Example:
  ///         Text(
  ///           "Accept term & conditions to continue",
  ///         ).withSpacialParts([
  ///           Part(
  ///             text: "Term & conditions",
  ///             onClick: () {
  ///               print("term & condition clicked");
  ///             },
  ///             style: const TextStyle(color: Colors.blue),
  ///           ),
  ///         ])
  Widget withSpacialParts(List<Part> parts) {
    String text = data ?? "";
    //If text is empty or there is no clickable parts to make then return original widget
    if (text.isEmpty || parts.isEmpty) return this;
    //Check for all the parts are available in text.
    for (var element in parts) {
      assert(text.contains(element.text),
          "Part '${element.text}' it is not found in your text '$data'");
    }

    parts = _sortPartsAsPerOrderInText(parts, text);

    List<Part> textPart = [];
    for (var part in parts) {
      String textBeforeOfPart = text.substring(0, text.indexOf(part.text));
      text = text.substring(textBeforeOfPart.length, text.length);
      text = text.replaceFirst(part.text, '');
      textPart.add(Part(text: textBeforeOfPart, style: style, onClick: () {}));
      textPart.add(part);
      if (parts.last == part) {
        textPart.add(Part(text: text, style: style, onClick: () {}));
      }
    }
    return textPart.isNotEmpty
        ? RichText(
            text: TextSpan(
                children: textPart
                    .map(
                      (Part e) => TextSpan(
                          text: e.text,
                          style: e.style,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => e.onClick()),
                    )
                    .toList()),
          )
        : this;
  }

  List<Part> _sortPartsAsPerOrderInText(List<Part> parts, String text) {
    List<int> partStartingIndexes = [];
    for (var element in parts) {
      var elementIndex = text.indexOf(element.text);
      if (elementIndex.isNegative) {
        throw ("Part '${element.text}' is not available in text or might be you have used multiple times");
      }
      partStartingIndexes.add(text.indexOf(element.text));
      //Replace with blanks, so if other part with same text exists then it follows the next match.
      text = text.replaceFirst(element.text, " " * element.text.length);
    }
    var index = 0;
    partStartingIndexes.sort(
      (a, b) {
        var result = a.compareTo(b);
        if (!result.isNegative) {
          var temp = parts[index];
          parts[index] = parts[index + 1];
          parts[index + 1] = temp;
        }
        index += 1;
        return result;
      },
    );
    return parts;
  }
}

class Part {
  String text;
  TextStyle? style;
  Function onClick;

  ///*[text]*: text that you want to make special.
  ///
  ///*[style]*: Style of special part(Optional).
  ///
  ///*[onClick]*: Action to perform when special part clicked.
  Part({required this.text, required this.onClick, this.style});
}
