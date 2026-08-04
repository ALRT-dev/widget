import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Speaks alerts aloud, on-device, for people who can't read them fast.
///
/// One voice at a time: a new [speak] cuts off the previous one, so a burst
/// of alerts never queues into a backlog of speech.
class AlertSpeechService {
  AlertSpeechService() {
    _tts
      ..setSpeechRate(0.48)
      ..setVolume(1.0)
      ..awaitSpeakCompletion(true);
  }

  final _tts = FlutterTts();
  bool _speaking = false;

  bool get isSpeaking => _speaking;

  Future<void> speak(final String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    await _tts.stop();
    _speaking = true;
    try {
      await _tts.speak(trimmed);
    } finally {
      _speaking = false;
    }
  }

  Future<void> stop() async {
    _speaking = false;
    await _tts.stop();
  }
}

final providerOfAlertSpeech = Provider<AlertSpeechService>(
  (ref) => AlertSpeechService(),
);
