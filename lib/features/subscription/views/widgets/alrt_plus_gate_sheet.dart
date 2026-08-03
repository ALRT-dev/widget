import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:hazard_app/features/subscription/views/screens/alrt_plus_welcome_screen.dart';
import 'package:hazard_app/features/subscription/views/widgets/alrt_plus_style.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// The ALRT+ gate sheet (screen A on the design board): a light bottom sheet
/// shown over the current context at a premium moment. Sells the benefit in
/// one line, keeps the consent rule visible in the lavender box, and starts
/// the free month in a single tap. Store prices are always rendered from the
/// current offering, never hardcoded.
class AlrtPlusGateSheet extends ConsumerStatefulWidget {
  const AlrtPlusGateSheet({
    super.key,
    required this.headline,
    required this.lead,
    required this.noteBold,
    required this.note,
  });

  final String headline;
  final String lead;
  final String noteBold;
  final String note;

  /// Presents the gate sheet and resolves to true once the user is entitled
  /// to ALRT+ (purchase completed, welcome screen shown). Resolves to false
  /// if they dismiss it. Copy defaults to the hosting moment; pass overrides
  /// for other premium moments (e.g. the share journey flow).
  static Future<bool> show(
    final BuildContext context, {
    final String headline = 'Bring your family with you',
    final String lead =
        'Alerts are free for everyone. With ALRT + you can host a family '
        'circle, so your group gets check-ins, arrival snapshots and an SOS '
        'that reaches the right people.',
    final String noteBold = 'You stay in control.',
    final String note =
        'Live sharing is off unless you turn it on, and it stops when you '
        'arrive.',
  }) async {
    final subscribed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: AlrtPlusStyle.purpleDeep.withValues(alpha: 0.30),
      builder: (context) => AlrtPlusGateSheet(
        headline: headline,
        lead: lead,
        noteBold: noteBold,
        note: note,
      ),
    );
    return subscribed ?? false;
  }

  @override
  ConsumerState<AlrtPlusGateSheet> createState() => _AlrtPlusGateSheetState();
}

class _AlrtPlusGateSheetState extends ConsumerState<AlrtPlusGateSheet> {
  Offering? _offering;
  bool _loading = true;
  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final offering = await ref.read(providerOfRevenueCat).currentOffering();
    if (!mounted) return;
    setState(() {
      _offering = offering;
      _loading = false;
      _error = offering == null
          ? 'ALRT + is not available right now. Please try again later.'
          : null;
    });
  }

  Future<void> _subscribe() async {
    // Same default as the full paywall: annual first, monthly as fallback.
    // The store's own confirmation sheet shows the exact product and price
    // before anything is charged.
    final package =
        _offering?.annual ??
        _offering?.monthly ??
        _offering?.availablePackages.firstOrNull;
    if (package == null || _busy) return;
    setState(() => _busy = true);
    try {
      final ok = await ref.read(providerOfRevenueCat).purchase(package);
      if (!mounted) return;
      if (ok) {
        ref.invalidate(providerOfAlrtPlus);
        ref.invalidate(providerOfAlrtPlusStatus);
        await context.push(AlrtPlusWelcomeScreen.route);
        if (mounted) Navigator.of(context).pop(true);
        return;
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'That purchase could not be completed.');
      }
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.spMin),
        padding: EdgeInsets.fromLTRB(20.spMin, 10.spMin, 20.spMin, 12.spMin),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFDFBFF), Color(0xFFF6F0FB)],
          ),
          borderRadius: BorderRadius.circular(26.spMin),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E0A32).withValues(alpha: 0.30),
              blurRadius: 44.0,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36.spMin,
                height: 4.spMin,
                margin: EdgeInsets.only(bottom: 14.spMin),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2DBEA),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const AlrtPlusPill(),
            SizedBox(height: 10.spMin),
            Text(
              widget.headline,
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.w800,
                height: 1.25,
                color: AlrtPlusStyle.ink,
              ),
            ),
            SizedBox(height: 7.spMin),
            Text(
              widget.lead,
              style: TextStyle(
                fontSize: 12.5.spMin,
                height: 1.6,
                color: AlrtPlusStyle.inkSoft,
              ),
            ),
            SizedBox(height: 10.spMin),
            AlrtPlusLavenderNote(boldText: widget.noteBold, text: widget.note),
            SizedBox(height: 13.spMin),
            if (_error != null) ...[
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.spMin,
                  color: const Color(0xFFB3261E),
                ),
              ),
              SizedBox(height: 8.spMin),
            ],
            AlrtPlusCtaButton(
              text: 'Start free month',
              busy: _busy || _loading,
              onPressed: _offering == null ? null : _subscribe,
            ),
            SizedBox(height: 9.spMin),
            Center(child: _priceLineBuilder()),
            Center(
              child: AlrtPlusGhostButton(
                text: 'Maybe later',
                onPressed: _busy
                    ? null
                    : () => Navigator.of(context).pop(false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceLineBuilder() {
    final monthly = _offering?.monthly?.storeProduct.priceString;
    final annual = _offering?.annual?.storeProduct.priceString;
    if (monthly == null && annual == null) return const SizedBox.shrink();
    final plans = [
      if (monthly != null) '$monthly a month',
      if (annual != null) '$annual a year',
    ].join(' or ');
    return Text(
      '1 month free, then $plans · cancel anytime',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11.spMin, color: AlrtPlusStyle.inkFaint),
    );
  }
}
