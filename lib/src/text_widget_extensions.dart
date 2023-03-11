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

    parts = sortPartsAsPerOrderInText(parts, text);

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
    return RichText(
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
    );
  }
}

@visibleForTesting
List<Part> sortPartsAsPerOrderInText(List<Part> parts, String text) {
  for (var element in parts) {
    var elementIndex = text.indexOf(element.text);
    if (elementIndex.isNegative) {
      throw ("Part '${element.text}' is not available in text or might be you have used multiple times");
    }
  }

  parts.sort(
    (a, b) {
      var indexOfA = text.indexOf(a.text);
      var indexOfB = text.indexOf(b.text);
      var result = indexOfA.compareTo(indexOfB);
      /*if (!result.isNegative) {
        var aTempIndex = parts.indexWhere((element) {
          return element.text == a.text;
        });
        var bTempIndex = parts.indexWhere((element) {
          return element.text == b.text;
        });
        parts[aTempIndex] = b;
        parts[bTempIndex] = a;
      }*/
      return result;
    },
  );
  return parts;
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
