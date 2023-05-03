import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../super_extensions.dart';
import 'helpers/sort_parts.dart';

extension TextWidgetExtensions on Text {
  ///Extensions method to make specific part of [Text] clickable or in different style.
  ///
  ///Example:
  ///         Text(
  ///           "Accept term & conditions to continue",
  ///            style: TextStyle(color: Colors.black),
  ///         ).withClickableParts([
  ///           Part(
  ///             text: "term & conditions",
  ///             onClick: () {
  ///               print("term & condition clicked");
  ///             },
  ///             style: const TextStyle(color: Colors.blue),
  ///           ),
  ///         ])
  Widget withClickableParts(List<Part> parts) {
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
