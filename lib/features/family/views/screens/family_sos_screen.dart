import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

/// Hold-to-send Family SOS. Sends a location snapshot + SOS to the circle only —
/// ALRT never contacts authorities, and the screen says so with 000 one tap
/// away the whole time.
class FamilySosScreen extends ConsumerStatefulWidget {
  const FamilySosScreen({super.key});

  static const route = '/family-sos';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FamilySosScreenState();
}

class _FamilySosScreenState extends ConsumerState<FamilySosScreen>
    with SingleTickerProviderStateMixin {
  static const _holdDuration = Duration(seconds: 3);

  late final AnimationController _holdController = AnimationController(
    vsync: this,
    duration: _holdDuration,
  );

  bool _sent = false;

  @override
  void initState() {
    super.initState();
    _holdController.addStatusListener((status) {
      if (status == AnimationStatus.completed) _fireSos();
    });
  }

  @override
  void dispose() {
    _holdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final memberCount = ref.watch(
      providerOfFamily.select((s) => (s.circle?.others.length ?? 0)),
    );
    final circleName = ref.watch(
      providerOfFamily.select((s) => s.circle?.name ?? 'your family circle'),
    );

    return Scaffold(
      backgroundColor: FamilyColors.sosDarkRed,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.spMin),
          child: Column(
            children: [
              SizedBox(height: 20.spMin),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.spMin,
                  vertical: 6.spMin,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20.spMin),
                  border: Border.all(
                    color: FamilyColors.sosRed.withValues(alpha: 0.6),
                  ),
                ),
                child: Text(
                  'FAMILY SOS',
                  style: TextStyle(
                    color: const Color(0xFFFCA5A5),
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 18.spMin),
              Text(
                _sent ? 'SOS sent' : 'Alert your circle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.spMin,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.spMin),
              Text(
                _sent
                    ? 'A snapshot of your location was shared with '
                          '$circleName.'
                    : 'Sends an SOS and a one-time snapshot of your location '
                          'to all $memberCount members of $circleName.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 14.spMin,
                ),
              ),
              const Spacer(),
              _sent ? _sentIndicatorBuilder() : _holdButtonBuilder(),
              SizedBox(height: 14.spMin),
              if (!_sent)
                Text(
                  'Keep holding to send',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13.spMin,
                  ),
                ),
              const Spacer(),
              _whatThisDoesBuilder(),
              SizedBox(height: 14.spMin),
              _call000ButtonBuilder(),
              SizedBox(height: 8.spMin),
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  _sent ? 'Done' : 'Cancel',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 15.spMin,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _holdButtonBuilder() {
    return GestureDetector(
      onTapDown: (_) {
        HapticFeedback.mediumImpact();
        _holdController.forward(from: 0);
      },
      onTapUp: (_) => _cancelHold(),
      onTapCancel: _cancelHold,
      child: AnimatedBuilder(
        animation: _holdController,
        builder: (context, child) {
          return SizedBox(
            width: 210.spMin,
            height: 210.spMin,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 210.spMin,
                  height: 210.spMin,
                  child: CircularProgressIndicator(
                    value: _holdController.value,
                    strokeWidth: 6,
                    color: const Color(0xFFFCA5A5),
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                Container(
                  width: 180.spMin,
                  height: 180.spMin,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: FamilyColors.sosRed.withValues(alpha: 0.5),
                        blurRadius: 30,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42.spMin,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        'HOLD 3 SEC',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 12.spMin,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sentIndicatorBuilder() {
    return Container(
      width: 180.spMin,
      height: 180.spMin,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: FamilyColors.safeGreen,
      ),
      child: Icon(Icons.check_rounded, color: Colors.white, size: 90.spMin),
    );
  }

  Widget _whatThisDoesBuilder() {
    return Container(
      padding: EdgeInsets.all(16.spMin),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16.spMin),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WHAT THIS DOES',
            style: TextStyle(
              color: const Color(0xFFFCA5A5),
              fontSize: 11.spMin,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 6.spMin),
          Text(
            'SOS notifies your family only. ALRT does not contact emergency '
            'services or monitor this alert. If life or property is in '
            'danger, call Triple Zero.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13.spMin,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _call000ButtonBuilder() {
    return SizedBox(
      height: 52.spMin,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: FamilyColors.sosRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.spMin),
          ),
        ),
        onPressed: () => launchUrl(Uri.parse('tel:000')),
        icon: Icon(Icons.phone, size: 20.spMin),
        label: Text(
          'Call 000',
          style: TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void _cancelHold() {
    if (_holdController.isAnimating) {
      _holdController.reverse();
    }
  }

  void _fireSos() async {
    HapticFeedback.heavyImpact();
    final sos = await ref.read(providerOfFamily.notifier).triggerSos();
    if (!mounted) return;
    if (sos != null) {
      setState(() => _sent = true);
    } else {
      context.showErrorToast(
        message: 'Could not send the SOS. Check your connection and retry.',
      );
      _holdController.reset();
    }
  }
}
