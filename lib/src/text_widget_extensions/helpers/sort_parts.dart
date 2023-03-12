import 'package:flutter/material.dart';

import '../models/part.dart';

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
      return result;
    },
  );
  return parts;
}
