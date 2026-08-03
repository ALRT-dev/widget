# Alert Screens — Brief for Matt

From Sarah. Plain-English summary of what I want on the alert screens, where the
existing documentation/code for each piece lives, and how we build it without
adding AI cost. The companion file `ALERT_SCREENS_REVIEW_PROMPT.md` is the
detailed AI review prompt — run it in Claude Code against the repos to get the
full audit and per-type design spec.

## The five alert types (shapes are the identity)

Every alert type gets its own shape so users can tell them apart at a glance.
**Only AWS shows severity words.** Everything else uses colour/impact bands only.

| Type | Shape | Severity shown? | Status in code |
|---|---|---|---|
| AWS (Australian Warning System) | Triangle | YES — Advice (yellow), Watch & Act (orange), Emergency Warning (red) | Built and correct |
| Official | Diamond | No words, colour band only | Built |
| ALRT Advisory | New shape (to pick — not triangle/diamond/circle/square) | No | **Does not exist — new** |
| Community (user reports) | Circle (purple) | No | Built, but missing block/report user |
| Global | Square — green/orange/red impact | No | **Half built — legend says squares, but the app actually shows black diamonds. Fix.** |

## What I want, where it's documented, and the cheap way

### 1. Fix what's already there (no AI cost, quick wins)
- **Global alerts** must actually render as green/orange/red squares like the
  in-app key promises. Today they fall back to the generic diamond icon.
  Code: `hazard_model.dart` (`iconPath`), assets in `assets/images/hazards/`.
- **The ALRT Key legend** (`alrt_keys_bottomsheet_content.dart`) is missing
  Community and ALRT Advisory sections — users have no explanation of the
  purple circles. Add both.
- **Official alert text**: the real description from the source is never shown —
  the section is commented out in `view_hazard_screen.dart` and cards show a
  made-up one-liner. Un-hide it (or show it under "What We Know").
- **"Updated x ago"** shows on every alert even if never updated. Only show it
  when the alert genuinely changed.
- **Confidence score** is already computed by the backend (0–100) but never
  displayed (noted as a gap in `MASTER_HANDOFF.md`). Decide: show it or drop it.

### 2. Follow button (zero AI calls)
A Follow button on every alert card + detail screen. Tapping Follow = you get a
push when THAT alert is updated. The plumbing already exists: the backend
already detects updates (skip-if-unchanged in `ingestion.service.ts`) and
already fires an `updateHazard` socket event and push infra. All that's new is:
a `HazardFollower` table, follow/unfollow endpoints, a push on update to
followers, and the button UI (Follow ↔ Following state). Documented in:
`HAZARDS_INGESTION_DOCUMENTATION.md` (update lifecycle), socket code in
`hazard_socket_manager_provider.dart`.

### 3. Safety profile + keywords (zero AI calls)
Add a safety profile to the user (things like asthma, pollen allergy, pets,
mobility needs, plus free-text keywords they care about). When an alert matches
— e.g. a pollen alert and the user has asthma — show a small "Matches your
safety profile" badge and optionally rank it higher. This is plain string/tag
matching against the category keywords the backend already has
(`HazardCategory.keywords` in `prisma/schema.prisma`). No AI anywhere.

### 4. Block / report a community reporter (zero AI calls)
On Community alerts: block this reporter (their alerts never show for me again)
and report the alert. This is an app-store compliance requirement for
user-generated content, and it doesn't exist at all today. It's a blocked-users
table + a filter in the hazards query + a report endpoint. The existing
review/moderation flow (`reviewStatus`, `reviewFeedback`) handles the rest.

### 5. ALRT Advisory — everything outside Australia in ONE alert (little to no AI)
Instead of ingesting hundreds of individual foreign alerts, ALRT Advisory is our
own consolidated type: **one advisory per country/region**, combining several
sources. The sources are already half-wired in the backend:
- `gdacsGlobal` and `canadaGovTra` are registered in the DB but have **no
  ingestion code** (`ingestion.service.ts`).
- `smartraveller` has a full parser but is **commented out**.
- USGS earthquakes already flows in worldwide.

The cheap design: these feeds are already structured — GDACS gives us
green/orange/red severity and Smartraveller gives advice levels 1–4 in the feed
itself. So we map severity **in code with no AI call**, and build the advisory
text from a template ("Sources: Smartraveller Level 3, GDACS orange…"). If we
want an AI-written summary at all, cap it at **one call per country per day, and
only when the underlying data changed** — the skip-if-unchanged logic that does
this per-alert already exists in `ingestion.service.ts`. That's a handful of
calls a day, not hundreds.

### 6. Keep AI spend where it already is (and measure it)
Today's AI usage is already lean — keep it that way:
- 1 × `gpt-5-nano` call per NEW or CHANGED ingested alert only (unchanged alerts
  are skipped before the AI step). 2 calls per user report.
- The full prompt system is documented in `backendV2/AI_PROMPTS_DOCUMENTATION.md`
  and editable in the admin panel without a deploy.
- **We currently log zero token usage** — `response.usage` is never read. Please
  add a simple usage log so we can actually see cost per source per day.
- Ask ALRT (the in-app assistant) is separate: Anthropic Haiku, 3 free / 20 plus
  questions per day, answers library first so most questions cost nothing
  (`askalrt/functions/src/askalrt/`). Note: its README says Opus in one place
  and Haiku in another — the code is Haiku; fix the README so nobody
  mis-budgets.

## Which documents give you what

| Document | What it gives you |
|---|---|
| `widget/ALERT_SCREENS_REVIEW_PROMPT.md` | The full AI review prompt — run it for the complete audit + per-type design spec |
| `backendV2/AI_PROMPTS_DOCUMENTATION.md` | Every AI prompt, when each fires, how to edit them |
| `backendV2/HAZARDS_INGESTION_DOCUMENTATION.md` | All feeds, dedupe, update + expiry rules |
| `backendV2/prisma/schema.prisma` | The alert data model (it's called `Hazard`) |
| `widget/HOME_WIDGET_SETUP.md` | Locked widget rules (severity never colour-alone, the two reds) |
| `widget/MASTER_HANDOFF.md` | Overall feature handoff incl. the confidence-score gap |
| App legend code `alrt_keys_bottomsheet_content.dart` | The user-facing shape/colour key (source of truth for visuals) |

## Priority order I'd suggest
1. Quick fixes: Global squares, legend sections, show real descriptions, honest "Updated" label.
2. Follow button.
3. Block/report user (store compliance).
4. ALRT Advisory consolidated international alerts (template-first, AI-capped).
5. Safety profile + keyword matching.
6. AI usage logging so we can see what everything costs.

Items 1–3, 5 and 6 add **zero** AI calls. Item 4 adds at most a few per day.
