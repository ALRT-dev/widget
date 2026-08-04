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

  // ── V3.1 prototype tokens ──────────────────────────────────────────────
  // Read straight off the standalone prototype. The older indigo above is
  // a different, lighter blue, which is why family screens built against it
  // never matched the mocks.

  /// The V3.1 family indigo: buttons, selected chips, accents.
  static const v31Indigo = Color(0xFF3D3DDF);

  /// The lavender page behind the cards.
  static const v31Page = Color(0xFFF0EEF5);

  /// Section labels on family screens (orange, not the V3 rust).
  static const v31Label = Color(0xFFFF6B01);

  /// Body and secondary copy.
  static const v31Ink = Color(0xFF5F5C66);

  /// Hairline between rows inside a card.
  static const v31Divider = Color(0xFFF4F1F6);

  /// Unselected control borders.
  static const v31Border = Color(0xFFD8D4E8);

  /// Toggle track when on, and when off.
  static const v31ToggleOn = Color(0xFF16C784);
  static const v31ToggleOff = Color(0xFFD8D4DE);

  /// The amber promise note: background, border, ink.
  static const v31NoteBackground = Color(0xFFFFF9EC);
  static const v31NoteBorder = Color(0xFFF5D98A);
  static const v31NoteInk = Color(0xFF8A6D1E);

  /// The three stops of the family header gradient (165 degrees).
  static const v31HeaderTop = Color(0xFF4B4BF0);
  static const v31HeaderMid = Color(0xFF3229C4);
  static const v31HeaderDeep = Color(0xFF1E1780);

  /// The soft blob of light in the top-right of the header.
  static const v31HeaderGlow = Color(0xFF7882FF);

  /// Card shadow on the lavender page.
  static const v31CardShadow = Color(0x0D1E142D);

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
