import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextStyleWidget extends TextStyle {

  Diagnosticable build(BuildContext context) {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
