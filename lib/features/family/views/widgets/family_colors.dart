import 'package:flutter/material.dart';

/// Colors used by the Family Mode feature.
///
/// Kept separate from [AppColors] so the family feature stays self-contained.
class FamilyColors {
  /// The family brand color.
  static const indigo = Color(0xFF5B5BD6);

  /// A darker shade of the family brand color.
  static const indigoDark = Color(0xFF4646B0);

  /// A very light indigo used for backgrounds.
  static const indigoLight = Color(0xFFEEEEFB);

  /// The green used for "Safe" chips and the "I'm Safe" button.
  static const safeGreen = Color(0xFF27AE60);

  /// A light green background for safe banners.
  static const safeGreenLight = Color(0xFFE7F6EE);

  /// Amber used for the "not everyone checked in" banner.
  static const amber = Color(0xFFB45309);

  /// A light amber background.
  static const amberLight = Color(0xFFFDF3E3);

  /// The dark red background of the SOS screen.
  static const sosDarkRed = Color(0xFF5C1010);

  /// The bright red used for SOS accents.
  static const sosRed = Color(0xFFDC2626);

  /// A light red background for SOS banners.
  static const sosRedLight = Color(0xFFFDECEC);

  /// The palette used to derive a stable per-member avatar color.
  static const memberPalette = <Color>[
    Color(0xFFF26522), // orange
    Color(0xFF4A90D9), // blue
    Color(0xFF8E44AD), // purple
    Color(0xFF27AE60), // green
    Color(0xFF16A085), // teal
    Color(0xFFE0475B), // pink
  ];

  /// Derives a stable color for a member from their [memberId].
  ///
  /// Uses a deterministic hash over the id's code units so the same member
  /// always gets the same color, across sessions and devices.
  static Color memberColor(final String memberId) {
    var hash = 0;
    for (final unit in memberId.codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    return memberPalette[hash % memberPalette.length];
  }
}
