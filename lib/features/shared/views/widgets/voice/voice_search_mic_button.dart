import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/services/voice_input_controller.dart';
import 'package:hazard_app/features/shared/views/widgets/voice/voice_listening_sheet.dart';
import 'package:hazard_app/features/shared/views/widgets/voice/voice_priming_sheet.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Tap-to-talk mic for the search capsule. On tap it primes for permission
/// (first time only), starts on-device dictation, and hands the recognised
/// text back via [onTranscript]. If recognition is unavailable or the user
/// declines the microphone, the mic quietly hides itself — typing still works.
class VoiceSearchMicButton extends ConsumerStatefulWidget {
  const VoiceSearchMicButton({super.key, required this.onTranscript});

  /// Called with the recognised text once the speaker stops.
  final void Function(String transcript) onTranscript;

  static const _kPrimedKey = 'voice_priming_shown';

  @override
  ConsumerState<VoiceSearchMicButton> createState() =>
      _VoiceSearchMicButtonState();
}

class _VoiceSearchMicButtonState extends ConsumerState<VoiceSearchMicButton> {
  bool _hidden = false;
  bool _busy = false;

  Future<void> _onTap() async {
    if (_busy) return;
    _busy = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final primed = prefs.getBool(VoiceSearchMicButton._kPrimedKey) ?? false;

      if (!primed) {
        if (!mounted) return;
        final proceed = await VoicePrimingSheet.show(context);
        if (proceed != true) return;
        await prefs.setBool(VoiceSearchMicButton._kPrimedKey, true);
      }

      final controller = ref.read(providerOfVoiceInput);
      final ok = await controller.ensureInitialized();
      if (!ok) {
        // No recogniser or permission denied — the mic disappears.
        if (mounted) setState(() => _hidden = true);
        return;
      }

      if (!mounted) return;
      final text = await VoiceListeningSheet.show(context, controller);
      if (text != null && text.trim().isNotEmpty) {
        widget.onTranscript(text.trim());
      }
    } finally {
      _busy = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hidden) return const SizedBox.shrink();

    return Semantics(
      button: true,
      label: 'Search by voice',
      child: GestureDetector(
        onTap: _onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 32.spMin,
          height: 32.spMin,
          margin: EdgeInsets.only(right: 8.spMin),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFF6B01), Color(0xFFFF2020)],
            ),
          ),
          child: Icon(
            LucideIcons.mic,
            size: 16.spMin,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
