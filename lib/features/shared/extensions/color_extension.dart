import 'package:flutter/material.dart';

extension ColorExt on Color {
  /// Determines if the color is light based on its luminance.
  bool get isLight {
    // A color is considered light if its luminance is greater than 0.4
    return computeLuminance() > 0.4;
  }
}
