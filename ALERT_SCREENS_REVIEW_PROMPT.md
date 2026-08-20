# ALRT — Alert Screens Review Prompt (paste this into an AI session)

Paste everything below the line into a Claude Code (or similar) session that has these
repos available: `alrt-dev/v3` (folder `alrtap-frontend-main`), `alrt-dev/widget`,
`alrt-dev/backendV2`, `alrt-dev/askalrt`.

---

## ROLE

You are reviewing the alert screens of ALRT, a safety alert app, against the product
spec below. Your job is to (A) audit what the code does today against the spec,
(B) produce a complete design + data specification for every alert type, and
(C) recommend the cheapest way to build the missing pieces, especially anything
that would otherwise add AI calls.

Read the code before making any claim. Do not trust READMEs over code.

## GROUND TRUTH — where things live

Frontend (Flutter — the app):
- Alert detail screen: `lib/features/shared/views/screens/view_hazard_screen.dart`
- Alert card: `lib/features/shared/views/widgets/common_hazards_list_item.dart`
- The "ALRT Key" legend (shapes/colours shown to users): `lib/features/map/views/widgets/alrt_keys_bottomsheet_content.dart`
- Alert model + icon/colour resolution: `lib/features/shared/models/hazard_model.dart`
- Severity enums: `lib/features/shared/enums/hazard_severity_types.dart`, `hazard_severity_band_types.dart`
- Palette: `lib/others/app_colors.dart` (advice `#FCDD00`, watchAndAct `#F26522`, emergency `#EE2E24`, info `#3478F5`, green `#34A853`, purple `#6A0DAD`)
- Live updates: `lib/features/shared/providers/hazard_socket_manager_provider.dart` (socket events `newHazard`/`updateHazard`/`deleteHazard`)
- Share: `lib/features/shared/utils/share_alert.dart` (only `reviewStatus == accepted` alerts shareable; link `https://api.safetyalrt.com/a/{id}`)
- Icon assets (the actual shapes shipped): `assets/images/hazards/aws/` (triangles) and `assets/images/hazards/non_aws/` (diamonds, `_user` circles)

Backend (`backendV2`):
- Alert (called `Hazard`) schema: `prisma/schema.prisma` lines 144–226
- AI prompts + docs: `AI_PROMPTS_DOCUMENTATION.md`, `src/utils/ai-prompt.util.ts`, `src/services/ai-prompt.service.ts`
- Ingestion (all sources, dedupe, update rules): `HAZARDS_INGESTION_DOCUMENTATION.md`, `src/services/ingestion.service.ts`, `src/utils/ingestion.util.ts`
- Categories (7 main, server-driven, with hex colours): `src/services/hazard_category.service.ts`
- AI call sites (OpenAI `gpt-5-nano`): `src/services/hazard.service.ts` — `summarizeHazard`, `reviewHazard`, `getSuggestedCategory`

Home-screen widget (`widget` repo): `HOME_WIDGET_SETUP.md` and `lib/features/home_screen_widget/` —
locked rules: severity is never colour alone (always emoji + text), the solid-red
gradient is reserved for the critical band only.

## THE PRODUCT SPEC TO REVIEW AGAINST

Five alert types, each designated by a DIFFERENT SHAPE. Only AWS shows severity.

1. **AWS (Australian Warning System)** — TRIANGLE.
   The only type that displays severity levels: Advice (yellow `#FCDD00`),
   Watch & Act (orange `#F26522`), Emergency Warning (red `#EE2E24`).
   Severity pill and "Alert Level" row appear on AWS alerts only.

2. **Official** — DIAMOND. Verified government/agency alerts that are not AWS.
   Colour reflects urgency band but NO severity words are shown.

3. **ALRT Advisory** — needs its own shape (not triangle/diamond/circle/square).
   ALRT's own consolidated advisories. Candidate use: ONE advisory alert covering
   everything outside Australia for a country/region, built from multiple sources
   (Smartraveller, GDACS, Canada travel advice, USGS) rather than one alert per
   source item. This type does not exist in code today — spec it fully.

4. **Community** — CIRCLE (purple `#6A0DAD`). User-reported alerts. Carries
   Confirm / Not There voting, reporter status colours, and must support
   blocking/reporting another user (e.g. block a specific reporter so their
   alerts never appear for me) — an app-store compliance requirement.

5. **Global** — SQUARE. International disaster/humanitarian alerts:
   Low Impact green `#34A853`, Medium Impact orange, High Impact red.

Cross-cutting requirements:
- **Categories**: every alert shows its category as a colour chip (7 main
  categories, server-driven colours). Check chip contrast and placement.
- **Safety profile + keywords**: the user's safety profile (e.g. asthma, pollen,
  pets, mobility, keywords they care about) should influence/highlight alerts —
  e.g. a matched keyword badge on the alert. Doesn't exist yet — spec it with
  plain string matching, NOT AI calls.
- **Follow**: a Follow button on each alert. Following an alert means: get a push
  notification when THAT alert is updated (socket event `updateHazard` already
  exists; there is no follow table/endpoint/UI yet). Following state must be
  visible on the button (Follow ↔ Following).
- **Alert updating**: when an alert updates, the screen should show what changed
  and when ("Updated X ago" must only show for genuinely updated alerts —
  today it shows whenever `updatedAt` is set, which is always).
- **Share**: share button on card and detail screen; only review-accepted alerts.
- **Placement**: audit the order of components on card and detail screen —
  pills header, icon/title/time/distance, description, map, What We Know,
  What To Do, media, source attribution — and flag anything hidden, dead, or
  out of order.
- **Colours**: check every colour against the palette; severity colours must
  never be the only signal (accessibility — pair with shape/text/emoji).

## PART A — AUDIT (current vs spec)

For each of the 5 types and each cross-cutting requirement, report:
IMPLEMENTED / PARTIAL / MISSING / CONTRADICTS SPEC, with file:line evidence.
Known issues to verify and expand on:
- Global alerts: legend promises green/orange/red squares, but `smartraveller`
  alerts resolve to `non_aws/other_*.png` DIAMOND assets (`hazard_model.dart`
  `iconPath`). Legend and assets disagree.
- "ALRT Advisory" and "Community" are missing from the ALRT Key legend entirely.
- The official `description` field is never rendered — `_buildOfficialDescriptionSection()`
  is commented out in `view_hazard_screen.dart`; cards show a synthesised
  "<Category> alert reported near <Location>." instead of real content.
- Confidence score (0–100) is computed by the backend but never shown
  (`ConfidenceDialPainter` in `view_hazard_screen.dart` is dead code).
- No Follow, no safety profile, no keyword matching, no block/report user.
- No alert version history — updates overwrite the row; nothing to diff.
- Backend has no ALRT Advisory or Global type: `gdacsGlobal` and `canadaGovTra`
  sources are seeded with NO parser; Smartraveller and BoM ingestion are
  commented out in `ingestion.service.ts`.

## PART B — DESIGN SPEC PER ALERT TYPE

For EACH of the 5 types, produce a complete spec a developer can build from:

1. **Identity**: shape, outline vs filled, colour rules, icon glyph, map marker.
2. **Card anatomy**: every component in order (header band colour rule, pills,
   icon, title, time, distance, description source, category chip, buttons),
   with what shows/hides per type.
3. **Detail screen anatomy**: same, in order, including which sections are
   type-specific (e.g. voting = Community only, Alert Level = AWS only,
   impact scale = Global only, source list = Advisory).
4. **Data rules — how the app reads the API for this type**: which fields decide
   the type (`isAwsCompliant`, `sourceId`, `reportedById`, `source.id`), which
   field drives colour (`severity` vs `severityBand`), what to show when a field
   is null, and the update behaviour (socket `updateHazard` → what re-renders,
   what badge appears, who gets notified).
5. **Buttons**: Follow (state machine: not following → following → notified on
   update), Share (visibility rule), Block/Report (Community only), and their
   placement.

## PART C — CHEAPEST BUILD PATH

For every MISSING item, state whether it needs any AI call at all. Defaults to
challenge: Follow = zero AI (DB table + existing socket/push infra). Keywords =
zero AI (string match against category keywords + user profile). Block user =
zero AI (filter in query). Global/Advisory ingestion: GDACS provides
green/orange/red severity and Smartraveller provides advice levels 1–4 in the
feed itself — map them with code, no AI. If ALRT Advisory consolidates many
foreign items into one alert per country, propose the design that minimises AI
calls (e.g. one templated alert with no AI, or one AI summarisation per country
per day maximum, reusing the existing skip-if-unchanged logic in
`ingestion.service.ts`).

## OUTPUT FORMAT

1. Scorecard table: spec item × status × evidence (file:line).
2. Per-type design spec (Part B), one section per type.
3. Prioritised fix list: quick wins (legend/asset fixes, un-hiding description)
   before new features (Follow, Advisory, safety profile, block user).
4. AI-cost table: each new feature × AI calls added (target: zero for almost all).

Do not invent new severity scales, do not add severity words to non-AWS types,
and keep every colour within `app_colors.dart` unless flagging an accessibility
failure.
