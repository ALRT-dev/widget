/// How a source's severity level/word is handled at render time (V3 §1).
///
/// Mirrors the backend `SeverityLevelHandling` enum.
enum SeverityLevelHandling {
  /// Render the source's own level/colour words as issued (AWS, GDACS).
  verbatim,

  /// Colour identity only; never render a band word (official agencies).
  bandColourOnly,

  /// Colour by category, never by severity (community).
  categoryColour,

  /// No internal band is applied at all (GDACS).
  levelExempt,
}
