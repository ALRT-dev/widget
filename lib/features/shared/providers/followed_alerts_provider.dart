import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Alert ids the user follows.
///
/// First version is device-local: it drives the Follow/Following UI and a
/// followed list, and becomes the client of the backend follow system
/// (per-alert update pushes) when that lands.
class FollowedAlertsNotifier extends Notifier<Set<String>> {
  static const _prefsKey = 'followed_alert_ids';

  @override
  Set<String> build() {
    _load();
    return const {};
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = (prefs.getStringList(_prefsKey) ?? const []).toSet();
  }

  Future<void> toggle(final String alertId) async {
    final next = {...state};
    if (!next.remove(alertId)) next.add(alertId);
    state = next;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, next.toList());
  }
}

final providerOfFollowedAlerts =
    NotifierProvider<FollowedAlertsNotifier, Set<String>>(
  FollowedAlertsNotifier.new,
);
