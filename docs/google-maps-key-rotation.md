# Google Maps API key — setup & rotation runbook

This app uses Google Maps in **two distinct ways**, and they are secured and rotated
**differently**. Understanding the split is the whole point of this document.

| Kind | Used for | Where the key lives | Rotatable without an app release? |
|------|----------|---------------------|-----------------------------------|
| **Maps SDK (rendering)** | Drawing the map on screen | Embedded in the app: Android `AndroidManifest.xml` (`com.google.android.geo.API_KEY`) and iOS `Info.plist` (`GMSApiKey`) | ❌ No — must ship in the binary |
| **Web services** | Geocoding, Places Autocomplete, Place Details | **Backend only** — proxied via `/api/maps/*` | ✅ Yes — server-side |
| **Directions (Routes API)** | Route planning / navigation | ⚠️ Still embedded in the app (`GOOGLE_MAPS_API_KEY`, via `flutter_polyline_points`) | ❌ Not yet — see "Remaining work" |

## Why a mobile key can't be "rotated" like a server secret

The SDK/Directions keys are compiled into the app that is **already installed on users'
phones**. You cannot change them without shipping a new app version and waiting for users
to update. Therefore:

> **Never delete or disable the old key immediately after rotating.**
> Doing so breaks maps for every user still on an older app version (map tiles fail,
> requests return `REQUEST_DENIED`) until they update.

What actually protects an embedded key is **restrictions**, not secrecy — a key locked to
your app's signature is useless to anyone who extracts the string from the binary.

---

## Key restrictions (Google Cloud Console)

Set these on the **Maps SDK key** in *APIs & Services → Credentials*.

### Android

**Application restrictions → Android apps:**

```
Package name: com.safetyalrt.alrt
SHA-1:        53:CC:FD:6C:3B:FF:31:A9:6F:13:DC:A9:76:3A:CC:1D:9A:2F:B7:C3
```

> ⚠️ **Play App Signing caveat.** The SHA-1 above is the **upload/keystore** key. If the
> app is distributed via Google Play with Play App Signing (the default), Google re-signs
> the app with a **different** certificate, and the Maps SDK validates against *that* one
> at runtime. If you restrict to only the upload SHA-1, **maps break for all Play Store
> users.** Get the Play App Signing SHA-1 from **Play Console → Test and release → App
> integrity → App signing key certificate** and add **both**.

> The **dev** build flavor runs as `com.safetyalrt.alrt.dev` (`applicationIdSuffix = ".dev"`).
> If dev builds share this key, add that package + its debug SHA-1 as a separate entry, or
> (preferred) use a separate key per environment.

**API restrictions → Restrict key:** *Maps SDK for Android* only.

### iOS

**Application restrictions → iOS apps:** bundle ID `com.safetyalrt.alrt` (and `.dev`).
**API restrictions → Restrict key:** *Maps SDK for iOS* only.

### Web-service key (backend)

The key used by the backend proxy should be a **separate** key:
- **Application restrictions → IP addresses:** your backend's egress/NAT IPs.
- **API restrictions:** *Geocoding API*, *Places API* (+ *Routes API* once Directions is migrated).

---

## How the key is injected at build time (no key committed)

- **Android** — `android/app/build.gradle.kts` reads `GOOGLE_MAPS_API_KEY` from the
  `GOOGLE_MAPS_API_KEY` env var (CI) or the project `.env`, and substitutes it into the
  manifest via the `${MAPS_API_KEY}` placeholder.
- **iOS** — the key comes from a `GOOGLE_MAPS_API_KEY` build setting in
  `ios/Flutter/Maps.xcconfig` (gitignored; copy from `Maps.xcconfig.default`), surfaced as
  `GMSApiKey` in `Info.plist` and read in `AppDelegate.swift`. CI writes `Maps.xcconfig`
  from a secret.
- **`.env`** (gitignored) still holds `GOOGLE_MAPS_API_KEY` — used by the Android build and
  by the Directions (`PolylinePoints`) path until that is migrated.

---

## Backend: web-service key via AWS Secrets Manager Agent

The backend never hardcodes the key. `src/utils/config.ts` calls `loadSecretsFromAgent()`
(`src/utils/secrets.ts`) at startup, which reads from the local **Secrets Manager Agent**
(`http://localhost:2773`, auth token at `/var/run/awssmatoken`) and populates
`process.env`. It is a no-op locally (falls back to `.env`).

**Secret:** `safety-alert-prod/api-token` (override via `MAPS_API_KEY_SECRET_ID`).
Store it as a JSON map so multiple values can live in one secret:

```json
{ "GOOGLE_MAPS_API_KEY": "<backend web-service key>" }
```

(If stored as a plain string, it is assigned to `GOOGLE_MAPS_API_KEY`; override the target
with `MAPS_API_KEY_SECRET_ENV_KEY`.)

---

## Rotation procedures

### Web-service key (zero user impact)

1. Create the new key, restricted to your backend IPs + the web-service APIs.
2. Update the `safety-alert-prod/api-token` secret in Secrets Manager.
3. Restart / redeploy the backend (the agent caches; restart picks up `AWSCURRENT`).
4. Disable the old key once the new one is confirmed working.

No app release required — this is exactly why the web-service calls were moved server-side.

### SDK rendering key (requires an app release)

1. Create the new key with the **same** Android/iOS application + API restrictions.
2. Set it in CI secrets / `.env` / `Maps.xcconfig` and **ship a new app version**.
3. **Keep the old key alive** (restricted) until analytics show old app versions are a
   negligible share, or a forced update is enforced.
4. Only then disable/delete the old key.

If the key merely leaked (not actively abused): you usually **don't need to kill it** —
applying the app-signature restriction above neutralises the leak while existing installs
keep working.

---

## Remaining work

**Directions still uses the embedded `GOOGLE_MAPS_API_KEY`** via `flutter_polyline_points`
(see `lib/features/shared/providers/instance_providers.dart`). That package calls Google's
Routes API directly and can't target our backend proxy. To remove the web-service key from
the app entirely, add a `/api/maps/directions` backend endpoint (Routes API) and replace
the `PolylinePoints` usage in `MapRepositoryImpl.getRoute` with a call to it. This touches
the navigation / route-risk-scoring code (`RoutesApiResponse` types), so it should be done
as a focused, separately tested change.
