import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/utils/hazard_avoidance_helper.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class RoutePlanning extends ConsumerStatefulWidget {
  const RoutePlanning({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoutePlanningState();
}

class _RoutePlanningState extends ConsumerState<RoutePlanning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.0,
            offset: Offset(0, 0.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(10.spMin),
      child: Column(
        spacing: 8.h,
        children: [
          _headerBuilder(),
          _analysisBuilder(),
        ],
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8.w,
          children: [
            Icon(
              Icons.route,
              color: AppColors.primary,
            ),
            Text(
              'Route Planning',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        _closeButtonBuilder(),
      ],
    );
  }

  Widget _analysisBuilder() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.spMin),
      decoration: BoxDecoration(
        color: _getMainColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _getMainColor().withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        spacing: 2.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 5.w,
            children: [
              Icon(
                _routeHazardSummary.riskLevel == RouteRiskLevel.safe
                    ? Icons.check_circle_outline_rounded
                    : Icons.warning_amber_rounded,
                color: _getMainColor(),
                size: 16.sp,
              ),
              Text(
                'Route Safety Analysis',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: _getMainColor(),
                ),
              ),
            ],
          ),
          Text(
            _routeHazardSummary.summaryMessage,
            style: TextStyle(
              fontSize: 10.sp,
              color: _getMainColor(),
            ),
          ),
          if (_routeHazardSummary.riskLevel != RouteRiskLevel.safe)
            _chipsBuilder().pT(5.0),
        ],
      ),
    );
  }

  Widget _chipsBuilder() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: [
        if (_routeHazardSummary.emergencyHazards > 0)
          _chipItemBuilder(
            label: '${_routeHazardSummary.emergencyHazards} emergency',
            severity: HazardSeverity.emergency,
          ),
        if (_routeHazardSummary.highRiskHazards > 0)
          _chipItemBuilder(
            label: '${_routeHazardSummary.highRiskHazards} high',
            severity: HazardSeverity.watchAndAct,
          ),
        if (_routeHazardSummary.mediumRiskHazards > 0)
          _chipItemBuilder(
            label: '${_routeHazardSummary.mediumRiskHazards} medium',
            severity: HazardSeverity.advice,
            textColor: AppColors.darkYellow,
          ),
        if (_routeHazardSummary.lowRiskHazards > 0)
          _chipItemBuilder(
            label: '${_routeHazardSummary.lowRiskHazards} low',
            severity: HazardSeverity.info,
          ),
      ],
    );
  }

  Widget _chipItemBuilder({
    required final String label,
    required final HazardSeverity severity,
    final Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.spMin,
        vertical: 4.spMin,
      ),
      decoration: BoxDecoration(
        color: severity.color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: (textColor ?? severity.color).withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: textColor ?? severity.color,
        ),
      ),
    );
  }

  Widget _closeButtonBuilder() {
    return RoundButton(
      icon: Icon(
        Icons.close_rounded,
        size: 20.spMin,
      ),
      size: 30.0,
      onPressed: _handleClose,
    );
  }

  /// Returns the route hazard summary from the provider.
  RouteHazardSummary get _routeHazardSummary {
    final hazards = ref.watch(
      providerOfHazards.select(
        (value) => value.mapHazards,
      ),
    );
    final routePoints = ref.watch(
      providerOfMap.select(
        (value) =>
            value.currentRouteApiResponse?.routes.first.polylinePoints
                ?.map((e) => LatLng(e.latitude, e.longitude))
                .toList() ??
            [],
      ),
    );
    return HazardAvoidanceHelper.analyzeRouteHazards(
      hazards: hazards,
      routePoints: routePoints,
      bufferKm: 3.0,
    );
  }

  /// Returns the main color based on the route risk level.
  Color _getMainColor() {
    switch (_routeHazardSummary.riskLevel) {
      case RouteRiskLevel.emergency:
        return AppColors.emergency;
      case RouteRiskLevel.high:
        return AppColors.watchAndAct;
      case RouteRiskLevel.medium:
        return AppColors.darkYellow;
      case RouteRiskLevel.low:
        return AppColors.info;
      case RouteRiskLevel.safe:
        return Colors.green.shade700;
    }
  }

  /// Handles the close button press to clear the current route.
  void _handleClose() {
    ref.read(providerOfMap.notifier)
      ..updateCurrentRouteApiResponse(null)
      ..updatePolylines({});
  }
}
