# ALRT app (Flutter) — locked product rules

These rules are locked. Do not weaken, remove, or "improve" them without an
explicit instruction from the product owner in the current session.

## Design system

- Band colours: Info #8A93A0, Monitor #F5C518, Action #F07E1B, Critical #DA1F2D.
- Shapes carry the SOURCE system: AWS triangle, official diamond, community
  circle, ALRT shield. The shield never writes the band word. Every shape,
  the shield included, takes the band hexes above; there is no separate
  brighter shield palette.
- Category colours: Weather #4DA8FF, Health #FF8C42, Security #FF4757,
  Traffic #00B383, Utilities #F5A623, Community #9C27B0, Other #8B6F47.
- Plain-terms summary sits on the dark surface #23252B with white text.
- V3 section labels: #B84500, uppercase, letter-spaced. Exception: the
  Report an ALRT screen takes the V3.1 prototype's brighter #FF6B01, which
  is what that prototype specifies for its own section labels.
- Family indigo is #3D3DDF (FamilyColors.indigo), from the V3.1
  prototype. The family header gradient is #4B4BF0 -> #3229C4 (55%)
  -> #1E1780 at 165 degrees with a soft radial highlight top-right;
  the page behind family cards is #F0EEF5 and family section labels
  are #FF6B01, not the V3 rust.
- Footer (when rebuilt as the floating capsule): active slot gets a lit grey
  pill, the ALRT slot uses the full six-path ALRT logo SVG (32x26, never
  redrawn or substituted) and opens Report, the Alerts bell always carries
  the red unread dot when anything is unread, the avatar shows a ring while
  any live share or SOS runs, and the footer is absent on exactly one
  screen: full-screen SOS.

## Safety and privacy (non-negotiable)

- ALRT never contacts emergency services; the disclaimer travels on the
  alert itself. Call 000 is always one tap.
- Location leaves a phone only by the owner's action. No continuous
  tracking, ever.
- Snapshots expire after 1 hour: the event log is kept, the locations are
  deleted (not archived, not aggregated).
- SOS live share caps at 4 hours; stand-down wipes the trail and history
  keeps only time and duration, never locations.
- Journeys are snap points by default (departure, ~10 min points, arrival);
  live is per-journey opt-in and never an ALRT+ upsell.
- Automatic scheduled snapshots keep the full safeguard set: agreed once on
  the owner's phone, visible badge, cancellable anytime, one point per time,
  1-hour expiry, never continuous.
- Call buttons appear only by an advance grant; phone numbers are never
  displayed to the caller.
- "Seen" is automatic, "On my way" is deliberate; there is deliberately no
  Monitoring option.
- Guests never request locations. There is no mute/snooze for circle SOS
  receipt — leaving is the only opt-out.
- The leaderboard never shows other users' identities.

## Commercial rules

- Invited members never see a paywall; joining via a code is always free.
- The paywall appears only at group creation. Alerts, the map and 000
  guidance stay free, always.
- Seats: ALRT+ = 8 seats across up to 4 owned circles. A seat is a
  (person, circle) pair in a circle you own — the host's own membership
  consumes a seat; joiners consume nothing of their own.
- Prices come from the store (RevenueCat), never hardcoded.

## Engineering conventions

- Riverpod 3 for new code (Notifier, no StateProvider/valueOrNull).
- Codegen: `dart run build_runner build --delete-conflicting-outputs` only.
  NEVER use --build-filter (it corrupts other generated files).
- `flutter analyze` must pass before every push; ~5 pre-existing infos
  (deprecations + the .env asset warning) are the accepted baseline.
- CI: android-apk.yml publishes the dev APK to a fixed release URL
  (tag dev-latest) — the QR code never changes.
- Work happens on branch `claude/safety-alert-repo-audit-8exgvn`.
- Never touch SafetyALRT org repos; never deploy.
- No en-dashes in any output.
