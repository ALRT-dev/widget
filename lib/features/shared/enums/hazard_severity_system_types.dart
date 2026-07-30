/// The severity vocabulary a source speaks (V3 "One Glance" model §1).
///
/// Determines what — if anything — is rendered as a severity word and how the
/// internal band is coloured. Mirrors the backend `HazardSeveritySystem` enum.
enum HazardSeveritySystem {
  /// AWS: writes the level text verbatim (Advice / Watch and Act / Emergency).
  awsLevel,

  /// Official agencies: internal band colour only; the band word is never rendered.
  band,

  /// Community: coloured by category, never by severity.
  category,

  /// GDACS: "GDACS {colour}" verbatim plus a fixed meaning sentence.
  gdacsColour,

  /// ALRT Intel: advisory only, "not an official warning".
  advisory,
}
