import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_display_settings_provider.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/alert_card_style.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Shows the dark "Map details" bottom sheet (V3 map UI): map type picker
/// and per-source-system alert visibility toggles.
Future<void> showMapDetailsSheet({
  required final BuildContext context,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (context) => const MapDetailsSheet(),
  );
}

class MapDetailsSheet extends ConsumerStatefulWidget {
  const MapDetailsSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapDetailsSheetState();
}

class _MapDetailsSheetState extends ConsumerState<MapDetailsSheet> {
  static const _sheetColor = Color(0xFF141416);
  static const _tileColor = Color(0xFF23252B);
  static const _accentColor = Color(0xFFFF6B01);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _sheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.spMin),
          topRight: Radius.circular(24.spMin),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20.spMin, 10.spMin, 20.spMin, 16.spMin),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _dragHandleBuilder()),
            12.hSizedBox,
            Text(
              'Map details',
              style: TextStyle(
                fontSize: 17.spMin,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionLabelBuilder('MAP TYPE').pT(16.0),
                    _mapTypesBuilder().pT(10.0),
                    _sectionLabelBuilder('SHOW ALERTS FROM').pT(18.0),
                    _systemToggleRowBuilder(
                      system: AlertSourceSystem.aws,
                      title: 'AWS Warnings',
                      subtitle: 'Australian Warning System · severity levels',
                      tint: const Color(0xFFFFB020),
                    ).pT(10.0),
                    _systemToggleRowBuilder(
                      system: AlertSourceSystem.official,
                      title: 'Official',
                      subtitle: 'State agencies and services',
                      tint: const Color(0xFF90A4AE),
                    ).pT(8.0),
                    _systemToggleRowBuilder(
                      system: AlertSourceSystem.globalHumanitarian,
                      title: 'Global humanitarian',
                      subtitle: 'Disasters rated for international response',
                      tint: const Color(0xFF7E8B9A),
                    ).pT(8.0),
                    _systemToggleRowBuilder(
                      system: AlertSourceSystem.community,
                      title: 'Community',
                      subtitle: 'Reports from people nearby',
                      tint: const Color(0xFF5AB0FF),
                    ).pT(8.0),
                    _systemToggleRowBuilder(
                      system: AlertSourceSystem.alrtIntel,
                      title: 'ALRT Intel',
                      subtitle: "ALRT's own assessment",
                      tint: const Color(0xFFFF6B01),
                    ).pT(8.0),
                    _sectionLabelBuilder('KEY · SHAPE SAYS WHO').pT(18.0),
                    _shapeKeyBuilder().pT(10.0),
                    _sectionLabelBuilder('AWS WARNING LEVELS').pT(16.0),
                    _awsLevelKeyBuilder().pT(10.0),
                    _sectionLabelBuilder('OFFICIAL ALERT COLOURS').pT(16.0),
                    _bandKeyBuilder().pT(10.0),
                    _sectionLabelBuilder('COMMUNITY REPORTS WEAR THEIR '
                            'CATEGORY')
                        .pT(16.0),
                    _categoryKeyBuilder().pT(10.0),
                  ],
                ),
              ),
            ),
            _doneButtonBuilder().pT(16.0),
          ],
        ),
      ),
    );
  }

  Widget _dragHandleBuilder() {
    return Container(
      width: 40.spMin,
      height: 4.spMin,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }

  Widget _sectionLabelBuilder(final String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 10.5.spMin,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
        color: AppColors.white.withValues(alpha: 0.45),
      ),
    );
  }

  Widget _mapTypesBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final selectedMapType = ref.watch(providerOfMapType);

        return Row(
          spacing: 8.spMin,
          children: [
            _mapTypeTileBuilder(
              label: 'Default',
              icon: LucideIcons.map,
              mapType: MapType.normal,
              isSelected: selectedMapType == MapType.normal,
            ),
            _mapTypeTileBuilder(
              label: 'Satellite',
              icon: LucideIcons.satellite,
              mapType: MapType.satellite,
              isSelected: selectedMapType == MapType.satellite,
            ),
            _mapTypeTileBuilder(
              label: 'Terrain',
              icon: LucideIcons.mountain,
              mapType: MapType.terrain,
              isSelected: selectedMapType == MapType.terrain,
            ),
          ],
        );
      },
    );
  }

  Widget _mapTypeTileBuilder({
    required final String label,
    required final IconData icon,
    required final MapType mapType,
    required final bool isSelected,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.spMin),
        decoration: BoxDecoration(
          color: _tileColor,
          borderRadius: BorderRadius.circular(14.spMin),
          border: Border.all(
            color: isSelected ? _accentColor : AppColors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          spacing: 6.spMin,
          children: [
            Icon(
              icon,
              size: 18.spMin,
              color: isSelected
                  ? _accentColor
                  : AppColors.white.withValues(alpha: 0.7),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5.spMin,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ).onPressed(
        () => ref.read(providerOfMapType.notifier).update(mapType),
      ),
    );
  }

  Widget _systemToggleRowBuilder({
    required final AlertSourceSystem system,
    required final String title,
    required final String subtitle,
    required final Color tint,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final isVisible = ref.watch(
          providerOfVisibleAlertSystems.select(
            (value) => value.contains(system),
          ),
        );

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.spMin,
            vertical: 8.spMin,
          ),
          decoration: BoxDecoration(
            color: _tileColor,
            borderRadius: BorderRadius.circular(14.spMin),
          ),
          child: Row(
            spacing: 12.spMin,
            children: [
              Container(
                width: 34.spMin,
                height: 34.spMin,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10.spMin),
                ),
                child: Icon(
                  AlertCardStyle.systemShapeIcon(
                    isAws: system == AlertSourceSystem.aws,
                    isOfficial: system != AlertSourceSystem.community,
                    isGlobalHumanitarian:
                        system == AlertSourceSystem.globalHumanitarian,
                    isAlrtIntel: system == AlertSourceSystem.alrtIntel,
                  ),
                  size: 16.spMin,
                  color: tint,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.spMin,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13.5.spMin,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10.5.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: isVisible,
                onChanged: (_) => ref
                    .read(providerOfVisibleAlertSystems.notifier)
                    .toggle(system),
                activeThumbColor: AppColors.white,
                activeTrackColor: _accentColor,
              ),
            ],
          ),
        );
      },
    );
  }

  /// The map's key, straight from the locked design system: the shape
  /// names the source system, the colour carries the urgency band, and a
  /// community circle wears its category colour, never a band hex.
  Widget _shapeKeyBuilder() {
    return Column(
      children: [
        _keyRowBuilder(
          icon: LucideIcons.triangleAlert,
          iconColor: AlertCardStyle.bandMonitor,
          title: 'Triangle · AWS warning',
          subtitle: 'The only source that states a severity level',
        ),
        _keyRowBuilder(
          icon: LucideIcons.diamond,
          iconColor: AlertCardStyle.bandAction,
          title: 'Diamond · official source',
          subtitle: 'State agencies and services',
        ),
        _keyRowBuilder(
          icon: LucideIcons.square,
          iconColor: const Color(0xFF7E8B9A),
          title: 'Rounded square · global humanitarian',
          subtitle: "Carries the source's own scale, not an AWS level",
        ),
        _keyRowBuilder(
          icon: LucideIcons.circle,
          iconColor: const Color(0xFF5AB0FF),
          title: 'Circle · community report',
          subtitle: 'Unverified, from someone nearby',
        ),
        _keyRowBuilder(
          icon: LucideIcons.shield,
          iconColor: AlertCardStyle.bandInfo,
          title: "Shield · ALRT's own assessment",
          subtitle: 'Never restates or overrides an official warning',
        ),
      ],
    );
  }

  Widget _keyRowBuilder({
    required final IconData icon,
    required final Color iconColor,
    required final String title,
    required final String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.spMin),
      child: Row(
        children: [
          Container(
            width: 34.spMin,
            height: 34.spMin,
            decoration: BoxDecoration(
              color: _tileColor,
              borderRadius: BorderRadius.circular(10.spMin),
            ),
            child: Icon(icon, size: 17.spMin, color: iconColor),
          ),
          10.wSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.spMin,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.spMin,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// The AWS words, in AWS's own colours. Only AWS states a level.
  Widget _awsLevelKeyBuilder() {
    const levels = [
      (AppColors.advice, 'Advice'),
      (AppColors.watchAndAct, 'Watch and Act'),
      (AppColors.emergency, 'Emergency Warning'),
    ];
    return Row(
      children: [
        for (final (color, label) in levels)
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 8.spMin,
                  margin: EdgeInsets.symmetric(horizontal: 3.spMin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                4.hSizedBox,
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.5.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// The four official colours, no words: official sources never write a
  /// level, so the colour only SUGGESTS how serious it is (product owner
  /// 2026-08-07 — the internal band names never face the user).
  Widget _bandKeyBuilder() {
    const bands = [
      AppColors.info,
      AppColors.advice,
      AppColors.watchAndAct,
      AppColors.emergency,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (final color in bands)
              Expanded(
                child: Container(
                  height: 8.spMin,
                  margin: EdgeInsets.symmetric(horizontal: 3.spMin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
          ],
        ),
        6.hSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lower',
              style: TextStyle(
                fontSize: 10.5.spMin,
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
            Text(
              'The colour shows the suggested severity',
              style: TextStyle(
                fontSize: 10.5.spMin,
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
            Text(
              'Higher',
              style: TextStyle(
                fontSize: 10.5.spMin,
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _categoryKeyBuilder() {
    const names = [
      'Weather',
      'Health',
      'Security',
      'Traffic',
      'Utilities',
      'Community',
      'Other',
    ];
    return Wrap(
      spacing: 7.spMin,
      runSpacing: 7.spMin,
      children: [
        for (final name in names)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.spMin,
              vertical: 5.spMin,
            ),
            decoration: BoxDecoration(
              color: _tileColor,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 9.spMin,
                  height: 9.spMin,
                  decoration: BoxDecoration(
                    color: lockedCategoryColorFor(name) ?? categoryOtherColor,
                    shape: BoxShape.circle,
                  ),
                ),
                6.wSizedBox,
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 11.spMin,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _doneButtonBuilder() {
    return Container(
      width: double.infinity,
      height: 50.spMin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.spMin),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF8C00),
            Color(0xFFFF2020),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Done',
        style: TextStyle(
          fontSize: 15.spMin,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
    ).onPressed(() => Navigator.of(context).pop());
  }
}
