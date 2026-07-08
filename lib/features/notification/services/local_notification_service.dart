import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Displays push notifications received while the app is in the FOREGROUND.
///
/// FCM only renders notifications automatically when the app is backgrounded
/// or terminated; foreground messages are delivered silently to
/// `FirebaseMessaging.onMessage` and were previously dropped entirely.
///
/// - iOS: foreground presentation is delegated to the OS via
///   [FirebaseMessaging.setForegroundNotificationPresentationOptions].
/// - Android: this service renders a local notification on a high-importance
///   channel, carrying the FCM data payload so a tap deep-links exactly like
///   a tray notification would.
class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance = LocalNotificationService._();

  static const _channelId = 'alrt_alerts';
  static const _channelName = 'Safety alerts';
  static const _channelDescription =
      'Hazard alerts and family safety notifications';

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  void Function(RemoteMessage message)? _onNotificationTap;

  /// Initializes the plugin and wires the tap callback. Safe to call once at
  /// startup; subsequent calls only replace the tap callback.
  Future<void> initialize({
    required void Function(RemoteMessage message) onNotificationTap,
  }) async {
    _onNotificationTap = onNotificationTap;
    if (_initialized || kIsWeb) return;

    // Let iOS present foreground notifications natively.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        // Permissions are requested through firebase_messaging already.
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );

    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
    );

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.max,
      ),
    );

    _initialized = true;
  }

  /// Shows a foreground FCM message as a local notification (Android only —
  /// iOS presents it natively through the foreground presentation options).
  Future<void> showFromRemoteMessage(RemoteMessage message) async {
    if (kIsWeb || !Platform.isAndroid) return;
    if (!_initialized) return;

    final notification = message.notification;
    final title = notification?.title ?? message.data['title'] as String?;
    final body = notification?.body ?? message.data['body'] as String?;
    if (title == null && body == null) return;

    await _plugin.show(
      message.hashCode,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  void _handleNotificationResponse(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;
    try {
      final data = Map<String, dynamic>.from(
        jsonDecode(payload) as Map<dynamic, dynamic>,
      );
      // Rebuild a RemoteMessage so the tap flows through the exact same
      // deep-link handling as tray notification taps.
      _onNotificationTap?.call(RemoteMessage(data: data.cast()));
    } catch (_) {
      // Malformed payload — nothing to deep-link into.
    }
  }
}
