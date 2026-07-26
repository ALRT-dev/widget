import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/subscription/providers/alrt_plus_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// The ALRT+ paywall. Per the product rules this appears only at the
/// "premium moment" (hosting a family circle), never during onboarding, and
/// always renders store prices — never hardcoded ones. Pops `true` if the user
/// ends up entitled to ALRT+.
class AlrtPlusPaywallScreen extends ConsumerStatefulWidget {
  const AlrtPlusPaywallScreen({super.key});

  static const route = '/alrt-plus';

  @override
  ConsumerState<AlrtPlusPaywallScreen> createState() =>
      _AlrtPlusPaywallScreenState();
}

class _AlrtPlusPaywallScreenState extends ConsumerState<AlrtPlusPaywallScreen> {
  static const _accent = Color(0xFFFF5000);

  Offering? _offering;
  Package? _selected;
  bool _loading = true;
  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final rc = ref.read(providerOfRevenueCat);
    final offering = await rc.currentOffering();
    if (!mounted) return;
    setState(() {
      _offering = offering;
      _selected = offering?.annual ?? offering?.availablePackages.firstOrNull;
      _loading = false;
      _error = offering == null
          ? 'ALRT+ is not available right now. Please try again later.'
          : null;
    });
  }

  Future<void> _subscribe() async {
    final package = _selected;
    if (package == null || _busy) return;
    setState(() => _busy = true);
    try {
      final ok = await ref.read(providerOfRevenueCat).purchase(package);
      if (ok) {
        ref.invalidate(providerOfAlrtPlus);
        if (mounted) Navigator.of(context).pop(true);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = 'That purchase could not be completed.');
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    if (_busy) return;
    setState(() => _busy = true);
    final ok = await ref.read(providerOfRevenueCat).restore();
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) {
      ref.invalidate(providerOfAlrtPlus);
      Navigator.of(context).pop(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No previous ALRT+ purchase found.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141416),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(color: _accent),
              )
            : ListView(
                padding: EdgeInsets.fromLTRB(22.spMin, 8.spMin, 22.spMin, 28.spMin),
                children: [
                  _headerBuilder(),
                  SizedBox(height: 22.spMin),
                  ..._benefits(),
                  SizedBox(height: 22.spMin),
                  if (_offering != null) ...[
                    if (_offering!.annual != null)
                      _planCardBuilder(_offering!.annual!, badge: 'BEST VALUE'),
                    if (_offering!.monthly != null)
                      _planCardBuilder(_offering!.monthly!),
                  ],
                  if (_error != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.spMin),
                      child: Text(
                        _error!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFE5928D),
                          fontSize: 13.spMin,
                        ),
                      ),
                    ),
                  SizedBox(height: 8.spMin),
                  _subscribeButtonBuilder(),
                  SizedBox(height: 12.spMin),
                  _legalBuilder(),
                ],
              ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'ALRT',
              style: TextStyle(
                fontSize: 30.spMin,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              '+',
              style: TextStyle(
                fontSize: 30.spMin,
                fontWeight: FontWeight.w800,
                color: _accent,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.spMin),
        Text(
          'Start your free month',
          style: TextStyle(
            fontSize: 22.spMin,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        SizedBox(height: 6.spMin),
        Text(
          'Host your own family circles and keep everyone connected. '
          'Core safety alerts are always free.',
          style: TextStyle(
            fontSize: 13.spMin,
            color: Colors.white.withValues(alpha: 0.6),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  List<Widget> _benefits() {
    const items = [
      ('Host family circles', LucideIcons.users),
      ('Live location during an SOS', LucideIcons.mapPin),
      ('Saved places and arrival alerts', LucideIcons.house),
      ('Unlimited check-ins', LucideIcons.circleCheck),
    ];
    return items
        .map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.spMin),
            child: Row(
              children: [
                Icon(item.$2, size: 18.spMin, color: _accent),
                SizedBox(width: 12.spMin),
                Text(
                  item.$1,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _planCardBuilder(final Package package, {final String? badge}) {
    final selected = _selected == package;
    final product = package.storeProduct;
    final isAnnual = package.packageType == PackageType.annual;
    return GestureDetector(
      onTap: () => setState(() => _selected = package),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.spMin),
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: selected ? 0.08 : 0.03),
          borderRadius: BorderRadius.circular(16.spMin),
          border: Border.all(
            color: selected ? _accent : Colors.white.withValues(alpha: 0.12),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? LucideIcons.circleCheck
                  : LucideIcons.circle,
              color: selected ? _accent : Colors.white.withValues(alpha: 0.4),
              size: 22.spMin,
            ),
            SizedBox(width: 14.spMin),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        isAnnual ? 'Yearly' : 'Monthly',
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      if (badge != null) ...[
                        SizedBox(width: 8.spMin),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.spMin,
                            vertical: 2.spMin,
                          ),
                          decoration: BoxDecoration(
                            color: _accent,
                            borderRadius: BorderRadius.circular(6.spMin),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              fontSize: 9.spMin,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 2.spMin),
                  Text(
                    '1 month free, then ${product.priceString}'
                    '${isAnnual ? '/yr' : '/mo'}',
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              product.priceString,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subscribeButtonBuilder() {
    final enabled = _selected != null && !_busy;
    return SizedBox(
      width: double.infinity,
      height: 52.spMin,
      child: ElevatedButton(
        onPressed: enabled ? _subscribe : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _accent,
          disabledBackgroundColor: _accent.withValues(alpha: 0.4),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.spMin),
          ),
        ),
        child: _busy
            ? SizedBox(
                width: 22.spMin,
                height: 22.spMin,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                'Start free month',
                style: TextStyle(
                  fontSize: 15.spMin,
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }

  Widget _legalBuilder() {
    return Column(
      children: [
        TextButton(
          onPressed: _busy ? null : _restore,
          child: Text(
            'Restore purchases',
            style: TextStyle(
              fontSize: 13.spMin,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ),
        Text(
          'Billed through your app store after the free month. '
          'Cancel anytime in your store account.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.spMin,
            color: Colors.white.withValues(alpha: 0.4),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
