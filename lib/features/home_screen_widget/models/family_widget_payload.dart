/// Payload for the ALRT Family status home-screen widget.
///
/// Flat by design — the family widget shows one headline + one sub-line, so a
/// single object with a `state` discriminator is all the native side needs.
class FamilyWidgetPayload {
  const FamilyWidgetPayload({
    required this.state,
    required this.headline,
    required this.sub,
    required this.deeplink,
    this.circleName,
  });

  /// One of: `sos`, `safe`, `partial`, `no_circle`.
  final String state;

  /// e.g. "Mum needs help", "Everyone's safe", "2 of 4 checked in".
  final String headline;

  /// e.g. "Kinglake West · just now", "Updated 9:42 am", "Set up in the app".
  final String sub;

  /// Deep link opened on tap. A live family SOS opens the SOS receiver; other
  /// states open the Family tab. A tap never triggers or resolves an SOS.
  final String deeplink;

  /// The circle's name, shown as the kicker when present.
  final String? circleName;

  /// A live family SOS is the only critical state → the locked solid red.
  bool get isCritical => state == 'sos';

  Map<String, dynamic> toJson() => {
        'state': state,
        'headline': headline,
        'sub': sub,
        'deeplink': deeplink,
        if (circleName != null) 'circleName': circleName,
        'isCritical': isCritical,
      };
}
