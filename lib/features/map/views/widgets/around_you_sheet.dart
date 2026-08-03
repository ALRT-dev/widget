import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_display_settings_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/utils/location_helper.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/features/shared/views/widgets/alert_card_style.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Shows the light "Around You" bottom sheet (V3 map UI): the map's current
/// alerts sorted by distance from the user's location.
Future<void> showAroundYouSheet({
  required final BuildContext context,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (context) => const AroundYouSheet(),
  );
}

class AroundYouSheet extends ConsumerStatefulWidget {
  const AroundYouSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AroundYouSheetState();
}

class _AroundYouSheetState extends ConsumerState<AroundYouSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.spMin),
          topRight: Radius.circular(24.spMin),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: _dragHandleBuilder()).pT(10.0),
          12.hSizedBox,
          Text(
            'AROUND YOU',
            style: TextStyle(
              fontSize: 10.5.spMin,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
              color: AppColors.grey,
            ),
          ).pX(16.0),
          10.hSizedBox,
          Expanded(
            child: _hazardsListBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _dragHandleBuilder() {
    return Container(
      width: 40.spMin,
      height: 4.spMin,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }

  Widget _hazardsListBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazards = ref.watch(
          providerOfMap.select(
            (value) => value.hazards,
          ),
        );
        final visibleSystems = ref.watch(providerOfVisibleAlertSystems);
        final userLocation = ref.watch(
          providerOfLocation.select(
            (value) => value.location,
          ),
        );

        final entries =
            hazards
                .where(
                  (hazard) =>
                      hazard.latitude != null &&
                      hazard.longitude != null &&
                      visibleSystems.contains(AlertSourceSystem.of(hazard)),
                )
                .map(
                  (hazard) => (
                    hazard: hazard,
                    distanceKm: calculateDistanceInKm(
                      userLocation.latitude,
                      userLocation.longitude,
                      hazard.latitude!,
                      hazard.longitude!,
                    ),
                  ),
                )
                .toList()
              ..sort((a, b) => a.distanceKm.compareTo(b.distanceKm));

        if (entries.isEmpty) {
          return Center(
            child: Text(
              'No alerts around you right now.',
              style: TextStyle(
                fontSize: 13.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            16.spMin,
            4.spMin,
            16.spMin,
            30.spMin,
          ),
          itemCount: entries.length,
          separatorBuilder: (context, index) => 10.hSizedBox,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return _hazardRowBuilder(
              hazard: entry.hazard,
              distanceKm: entry.distanceKm,
            );
          },
        );
      },
    );
  }

  Widget _hazardRowBuilder({
    required final Hazard hazard,
    required final double distanceKm,
  }) {
    final isCommunity = hazard.isUserReported;
    final isAws = !isCommunity && hazard.isAwsCompliant == true;

    // Amber tint for AWS, blue tint for community, blue-grey for other
    // official sources.
    final Color iconTint;
    final Color iconBackground;
    if (isAws) {
      iconTint = const Color(0xFFB84500);
      iconBackground = const Color(0xFFFFF3E0);
    } else if (isCommunity) {
      iconTint = const Color(0xFF1565B5);
      iconBackground = const Color(0xFFE8F4FF);
    } else {
      iconTint = const Color(0xFF546E7A);
      iconBackground = const Color(0xFFECEFF1);
    }

    final categoryName = hazard.category?.name ?? 'Alert';

    return Container(
      padding: EdgeInsets.all(12.spMin),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.spMin),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColorLight,
            blurRadius: 8.0,
            offset: Offset(0, 2.0),
          ),
        ],
      ),
      child: Row(
        spacing: 12.spMin,
        children: [
          Container(
            width: 40.spMin,
            height: 40.spMin,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12.spMin),
            ),
            child: Icon(
              AlertCardStyle.systemShapeIcon(
                isAws: isAws,
                isOfficial: !isCommunity,
              ),
              size: 18.spMin,
              color: iconTint,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2.spMin,
              children: [
                Text(
                  hazard.title ?? categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.5.spMin,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  '$categoryName · ${distanceKm.toStringAsFixed(1)} km from your location',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5.spMin,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            size: 18.spMin,
            color: AppColors.grey,
          ),
        ],
      ),
    ).onPressed(() => _gotoViewHazard(hazard));
  }

  /// Navigate to the View Hazard screen with the tapped hazard as an argument.
  void _gotoViewHazard(final Hazard hazard) {
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(hazard: hazard),
    );
  }
}
