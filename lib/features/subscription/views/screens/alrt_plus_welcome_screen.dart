import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/widgets/alrt_plus_style.dart';
import 'package:intl/intl.dart';

/// The post-purchase welcome screen (screen B on the design board). One job:
/// celebrate briefly, show the open seats, and push the single highest value
/// action, inviting family. The trial reminder promise sits in the lavender
/// box so trust is built at the moment of purchase.
class AlrtPlusWelcomeScreen extends ConsumerWidget {
  const AlrtPlusWelcomeScreen({super.key});

  static const route = '/alrt-plus/welcome';

  /// Seats shown before the circle exists (the circle's real capacity takes
  /// over once it loads).
  static const _defaultSeats = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(providerOfAlrtPlusStatus).valueOrNull;
    final circle = ref.watch(providerOfFamily.select((s) => s.circle));
    final seats = circle?.maxMembers ?? _defaultSeats;
    final used = circle?.members.length ?? 1;
    final open = (seats - used).clamp(0, seats);

    return Scaffold(
      backgroundColor: AlrtPlusStyle.body,
      body: Column(
        children: [
          _bandBuilder(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.spMin, 16.spMin, 18.spMin, 18.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _haloBuilder(),
                  SizedBox(height: 16.spMin),
                  Text(
                    'Welcome to ALRT +',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23.spMin,
                      fontWeight: FontWeight.w800,
                      color: AlrtPlusStyle.ink,
                    ),
                  ),
                  SizedBox(height: 7.spMin),
                  Text(
                    'Your free month has started. The family layer is on, '
                    'and there ${open == 1 ? 'is 1 seat' : 'are $open seats'} '
                    'waiting for your people.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.spMin,
                      height: 1.6,
                      color: AlrtPlusStyle.inkSoft,
                    ),
                  ),
                  SizedBox(height: 18.spMin),
                  _seatRowBuilder(seats: seats, used: used),
                  SizedBox(height: 18.spMin),
                  _reminderNoteBuilder(status),
                  const Spacer(),
                  AlrtPlusCtaButton(
                    text: 'Invite your family',
                    onPressed: () => _onInvite(context, ref),
                  ),
                  SizedBox(height: 4.spMin),
                  Center(
                    child: AlrtPlusGhostButton(
                      text: "I'll do this later",
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Pops back to the flow that pushed this screen and lands the user on the
  /// family tab, where the circle (and its invite flow) lives.
  void _onInvite(final BuildContext context, final WidgetRef ref) {
    ref.read(providerOfHomeTab.notifier).state = HomeTab.family;
    Navigator.of(context).pop();
  }

  Widget _bandBuilder(final BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AlrtPlusStyle.bandDecoration(),
      child: Stack(
        children: [
          AlrtPlusStyle.bandGlows(),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(22.spMin, 8.spMin, 22.spMin, 22.spMin),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: AlrtPlusPill(onBand: true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// The ALRT mark on a warm-lit tile with an orange glow behind it.
  Widget _haloBuilder() {
    return Center(
      child: Container(
        width: 84.spMin,
        height: 84.spMin,
        margin: EdgeInsets.only(top: 18.spMin),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFFFF4EC), Color(0xFFFFE9DA)],
            stops: [0.0, 0.6, 1.0],
          ),
          borderRadius: BorderRadius.circular(24.spMin),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF500A).withValues(alpha: 0.24),
              blurRadius: 36.0,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Image.asset(
          'assets/logos/alrt_logo.png',
          width: 54.spMin,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _seatRowBuilder({required final int seats, required final int used}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < seats; i++)
          Container(
            width: 15.spMin,
            height: 15.spMin,
            margin: EdgeInsets.symmetric(horizontal: 3.spMin),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: i < used ? AlrtPlusStyle.ctaGradient : null,
              border: i < used
                  ? null
                  : Border.all(color: const Color(0xFFCDB8E0), width: 1.6),
            ),
          ),
      ],
    );
  }

  Widget _reminderNoteBuilder(final AlrtPlusStatus? status) {
    final firstPayment = status?.isTrial == true
        ? status?.expirationDate
        : null;
    if (firstPayment == null) {
      return const AlrtPlusLavenderNote(
        boldText: 'No surprises.',
        text:
            'You can change your plan or cancel anytime from your profile.',
      );
    }
    final date = DateFormat('d MMMM').format(firstPayment);
    return AlrtPlusLavenderNote(
      boldText: 'No surprises.',
      text:
          'We remind you a week before your free month ends. First payment '
          '$date unless you cancel.',
    );
  }
}
