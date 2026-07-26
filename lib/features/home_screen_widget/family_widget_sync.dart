import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hazard_app/features/family/providers/states/family_provider_state.dart';
import 'package:hazard_app/features/home_screen_widget/home_widget_keys.dart';
import 'package:hazard_app/features/home_screen_widget/home_widget_service.dart';
import 'package:hazard_app/features/home_screen_widget/models/family_widget_payload.dart';

/// Builds the Family status widget payload from [FamilyProviderState] and
/// pushes it. Wired via a listener on the family provider, so it runs on every
/// state change — a cheap signature guard suppresses redundant writes.
class FamilyWidgetSync {
  const FamilyWidgetSync._();

  static const _familyDeeplink =
      '${HomeWidgetKeys.deeplinkScheme}://open?screen=family';
  static const _sosDeeplink =
      '${HomeWidgetKeys.deeplinkScheme}://open?screen=family_sos';

  static String? _lastSignature;

  static void push(final FamilyProviderState state) {
    final payload = _build(state);
    // Signature covers only what the widget renders — skip disk writes for
    // unrelated state churn (loading flags, etc.).
    final signature = '${payload.state}|${payload.circleName}|'
        '${payload.headline}|${payload.sub}';
    if (signature == _lastSignature) return;
    _lastSignature = signature;
    HomeWidgetService.updateFamily(payload);
  }

  static FamilyWidgetPayload _build(final FamilyProviderState state) {
    final circle = state.circle;

    if (circle == null) {
      return const FamilyWidgetPayload(
        state: 'no_circle',
        headline: 'No family circle',
        sub: 'Set up in the app',
        deeplink: _familyDeeplink,
      );
    }

    // Live SOS from someone else is the one critical state.
    final sos = state.activeSosFromOthers.firstOrNull;
    if (sos != null) {
      final member =
          circle.members.firstWhereOrNull((m) => m.id == sos.memberId);
      final name = member?.name ?? 'A family member';
      final when = sos.createdAt != null ? timeago.format(sos.createdAt!) : null;
      final sub = [sos.locationLabel, when]
          .whereType<String>()
          .where((s) => s.isNotEmpty)
          .join('  ·  ');
      return FamilyWidgetPayload(
        state: 'sos',
        headline: '$name needs help',
        sub: sub.isEmpty ? 'SOS active' : sub,
        deeplink: _sosDeeplink,
        circleName: circle.name,
      );
    }

    final others = circle.others;
    if (others.isEmpty) {
      return FamilyWidgetPayload(
        state: 'safe',
        headline: 'No one to check on yet',
        sub: 'Invite family in the app',
        deeplink: _familyDeeplink,
        circleName: circle.name,
      );
    }

    final checkedIn = others.where((m) => m.isCheckedInRecently).length;
    final total = others.length;
    final updated = 'Updated ${DateFormat.jm().format(DateTime.now())}';

    if (checkedIn == total) {
      return FamilyWidgetPayload(
        state: 'safe',
        headline: "Everyone's safe",
        sub: '$total of $total checked in',
        deeplink: _familyDeeplink,
        circleName: circle.name,
      );
    }

    return FamilyWidgetPayload(
      state: 'partial',
      headline: '$checkedIn of $total checked in',
      sub: updated,
      deeplink: _familyDeeplink,
      circleName: circle.name,
    );
  }
}
