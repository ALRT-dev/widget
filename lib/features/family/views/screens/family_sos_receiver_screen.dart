import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/providers/family_provider.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class FamilySosReceiverScreenArgs {
  const FamilySosReceiverScreenArgs({required this.sosEvent});

  final FamilySosEvent sosEvent;
}

/// What the circle sees when someone triggers SOS: the location snapshot
/// shared at trigger time, one-tap responses, and calling 000 from their own
/// phone — the person dials, never the platform. The sender can re-share a
/// fresh snapshot at any time; ALRT never updates it automatically.
class FamilySosReceiverScreen extends ConsumerWidget {
  const FamilySosReceiverScreen({super.key, required this.args});

  static const route = '/family-sos-receiver';

  final FamilySosReceiverScreenArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Prefer the live copy from state (updated by socket events).
    final sos = ref.watch(
          providerOfFamily.select(
            (s) => s.activeSosEvents
                .where((e) => e.id == args.sosEvent.id)
                .firstOrNull,
          ),
        ) ??
        args.sosEvent;

    final name = sos.member?.displayName ?? 'A family member';
    final myMemberId = ref.watch(
      providerOfFamily.select((s) => s.circle?.myMemberId),
    );
    final isMine = sos.memberId == myMemberId;
    final isResolved = sos.status != FamilySosStatus.active;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      body: Column(
        children: [
          _headerBuilder(context, sos, name, isResolved),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.spMin),
              children: [
                if (sos.latitude != null && sos.longitude != null)
                  _mapBuilder(sos),
                SizedBox(height: 14.spMin),
                _locationCardBuilder(sos),
                SizedBox(height: 16.spMin),
                if (!isResolved && !isMine) _actionsBuilder(context, ref, sos, name),
                if (!isResolved && isMine) ...[
                  _resolveButtonBuilder(ref, sos),
                  SizedBox(height: 10.spMin),
                  _shareUpdatedLocationButtonBuilder(context, ref),
                ],
                SizedBox(height: 20.spMin),
                _responsesBuilder(sos),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerBuilder(
    final BuildContext context,
    final FamilySosEvent sos,
    final String name,
    final bool isResolved,
  ) {
    return Container(
      color: isResolved ? FamilyColors.safeGreen : FamilyColors.sosRed,
      padding: EdgeInsets.fromLTRB(20.spMin, 0, 20.spMin, 18.spMin),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isResolved ? '$name is marked safe' : '$name triggered SOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (sos.createdAt != null)
                    Text(
                      isResolved
                          ? 'SOS resolved'
                          : 'Snapshot shared · started ${timeago.format(sos.createdAt!)}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12.spMin,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mapBuilder(final FamilySosEvent sos) {
    final position = LatLng(sos.latitude!, sos.longitude!);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.spMin),
      child: SizedBox(
        height: 240.spMin,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: position, zoom: 15.5),
          markers: {
            Marker(markerId: const MarkerId('sos'), position: position),
          },
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          liteModeEnabled: true,
        ),
      ),
    );
  }

  Widget _locationCardBuilder(final FamilySosEvent sos) {
    return Container(
      padding: EdgeInsets.all(14.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.spMin),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.mapPin, size: 18.spMin, color: FamilyColors.sosRed),
          SizedBox(width: 8.spMin),
          Expanded(
            child: Text(
              sos.locationLabel != null
                  ? 'Near ${sos.locationLabel}'
                  : 'Location shared with the circle',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionsBuilder(
    final BuildContext context,
    final WidgetRef ref,
    final FamilySosEvent sos,
    final String name,
  ) {
    final notifier = ref.read(providerOfFamily.notifier);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50.spMin,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FamilyColors.safeGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.spMin),
                    ),
                  ),
                  onPressed: () => notifier.respondToSos(
                    sosEventId: sos.id,
                    type: FamilySosResponseType.onMyWay,
                  ),
                  icon: Icon(LucideIcons.navigation, size: 16.spMin),
                  label: Text(
                    'On my way',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.spMin),
            Expanded(
              child: SizedBox(
                height: 50.spMin,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FamilyColors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.spMin),
                    ),
                  ),
                  onPressed: () => notifier.respondToSos(
                    sosEventId: sos.id,
                    type: FamilySosResponseType.seen,
                  ),
                  icon: Icon(LucideIcons.eye, size: 16.spMin),
                  label: Text(
                    'Seen',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.spMin),
        SizedBox(
          height: 50.spMin,
          width: double.infinity,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: FamilyColors.sosRed,
              side: const BorderSide(color: FamilyColors.sosRed),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.spMin),
              ),
            ),
            onPressed: () async {
              await ref.read(providerOfFamily.notifier).respondToSos(
                sosEventId: sos.id,
                type: FamilySosResponseType.called,
              );
              await launchUrl(Uri.parse('tel:000'));
            },
            icon: Icon(Icons.phone, size: 18.spMin),
            label: Text(
              'Call 000 for $name',
              style: TextStyle(fontSize: 15.spMin, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  Widget _resolveButtonBuilder(final WidgetRef ref, final FamilySosEvent sos) {
    return SizedBox(
      height: 50.spMin,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: FamilyColors.safeGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.spMin),
          ),
        ),
        onPressed: () =>
            ref.read(providerOfFamily.notifier).resolveSos(sosEventId: sos.id),
        child: Text(
          "I'm safe now — resolve SOS",
          style: TextStyle(fontSize: 15.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  /// Lets the person in SOS push a fresh snapshot to the circle — an explicit
  /// tap, keeping the "requested, never tracked" posture even mid-SOS.
  Widget _shareUpdatedLocationButtonBuilder(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    return SizedBox(
      height: 50.spMin,
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: FamilyColors.indigo,
          backgroundColor: Colors.white,
          side: BorderSide(color: FamilyColors.indigo.withValues(alpha: 0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.spMin),
          ),
        ),
        onPressed: () async {
          final shared =
              await ref.read(providerOfFamily.notifier).shareSnapshotNow();
          if (!context.mounted) return;
          shared
              ? context.showSuccessToast(
                  message: 'Updated snapshot shared with your circle.',
                )
              : context.showErrorToast(
                  message:
                      'Could not get your location. Check location '
                      'permissions and try again.',
                );
        },
        icon: Icon(LucideIcons.mapPin, size: 18.spMin),
        label: Text(
          'Share updated location',
          style: TextStyle(fontSize: 15.spMin, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _responsesBuilder(final FamilySosEvent sos) {
    if (sos.responses.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CIRCLE RESPONSES',
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w700,
            color: FamilyColors.sosRed,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 10.spMin),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.spMin),
          ),
          child: Column(
            children: [
              for (final response in sos.responses)
                ListTile(
                  dense: true,
                  leading: Icon(
                    switch (response.type) {
                      FamilySosResponseType.onMyWay => LucideIcons.navigation,
                      FamilySosResponseType.called => Icons.phone,
                      FamilySosResponseType.seen => LucideIcons.eye,
                    },
                    size: 18.spMin,
                    color: FamilyColors.indigo,
                  ),
                  title: Text(
                    response.member?.displayName ?? 'Family member',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    switch (response.type) {
                      FamilySosResponseType.onMyWay =>
                        'On my way${response.createdAt != null ? ' · ${timeago.format(response.createdAt!)}' : ''}',
                      FamilySosResponseType.called => 'Called for help',
                      FamilySosResponseType.seen => 'Seen',
                    },
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
