/// The marker shape in the V3 "five-system One Glance" model.
///
/// Shape encodes the alert's source *system* (colour encodes urgency, glyph
/// encodes the hazard). It is stored per-source on the backend `HazardSource`
/// registry and resolved for a hazard via [HazardSourceShapeResolution].
///
/// Mirrors the backend `HazardSourceShape` Prisma enum.
enum HazardSourceShape {
  /// AWS (Australian Warning System) agencies.
  triangle,

  /// Official agencies — the default when a source has no explicit shape.
  diamond,

  /// Community / user reports.
  circle,

  /// GDACS (Global Disaster Alert and Coordination System).
  square,

  /// ALRT Intel.
  shield,
}
