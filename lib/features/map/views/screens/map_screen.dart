import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/utils/dialogs.dart';
import 'package:hazard_app/features/map/views/widgets/custom_compass_button.dart';
import 'package:hazard_app/features/map/views/widgets/custom_my_location_button.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazard_info_window.dart';
import 'package:hazard_app/features/map/views/widgets/map_keys_button.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_filters_button.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  static const filtersKey = 'MapScreenFiltersKey';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: ref.read(
              providerOfMap.select(
                (value) => value.cameraPosition,
              ),
            ),
            markers: ref.watch(
              providerOfMap.select(
                (value) => value.markers,
              ),
            ),
            polylines: ref.watch(
              providerOfMap.select(
                (value) => value.polylines,
              ),
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
            padding: EdgeInsets.only(bottom: 22.spMin, left: 8.spMin),
            buildingsEnabled: ref.watch(
              providerOfMap.select(
                (value) => !(value.currentRoutePlan?.isNavigating ?? false),
              ),
            ),
            onMapCreated: (controller) {
              ref
                  .read(providerOfMap.notifier)
                  .init(googleMapController: controller);
            },
            onCameraMove: _handleMapMoved,
            onTap: (_) {
              context.unfocusInputs();
              ref.read(providerOfMap.notifier).updateSelectedHazard(null);
            },
          ),
          Positioned.fill(
            child: _overlayedContentsBuilder(),
          ),
          const MapHazardInfoWindow(),
        ],
      ),
    );
  }

  Widget _overlayedContentsBuilder() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final isRoutePresent = ref.watch(
                    providerOfMap.select(
                      (value) => value.currentRoutePlan != null,
                    ),
                  );

                  if (isRoutePresent) {
                    return RouteSourceAndDestination();
                  }
                  return Row(
                    spacing: 10.spMin,
                    children: [
                      Expanded(child: MapSearchbar()),
                      _xpPointsBuilder(),
                    ],
                  );
                },
              ).pX(20.0),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 15.spMin,
                        bottom: 0.0,
                        child: _mapActionButtons(),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: _viewListButtonBuilder(),
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final isRoutePresent = ref.watch(
                      providerOfMap.select(
                        (value) => value.currentRoutePlan != null,
                      ),
                    );
                    if (isRoutePresent) {
                      return RoutePlanning().pT(10.0);
                    }

                    final isSelectedLocationPresent = ref.watch(
                      providerOfMap.select(
                        (value) => value.selectedLocation != null,
                      ),
                    );
                    if (isSelectedLocationPresent) {
                      return SelectedLocationPreview().pT(10.0);
                    }

                    return const SizedBox();
                  },
                ).pX(20.0),
              ],
            ),
          ),
        ],
      ).pB(30.0),
    );
  }

  Widget _xpPointsBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final xpPoints = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.xpPoints ?? 0,
          ),
        );
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.spMin),
            gradient: LinearGradient(
              colors: [
                AppColors.orange300,
                AppColors.red200,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10.0,
                offset: Offset(0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12.spMin,
            vertical: 7.spMin,
          ),
          child: Row(
            spacing: 4.spMin,
            children: [
              Icon(
                LucideIcons.star,
                size: 12.spMin,
                color: AppColors.white,
              ),
              Text(
                xpPoints.toString(),
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mapActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10.spMin,
      children: [
        CustomCompassButton(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.spMin),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10.0,
                offset: Offset(0, 0.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.spMin),
            child: Column(
              children: [
                HazardFiltersButton(
                  filtersKey: MapScreen.filtersKey,
                  onFiltersUpdated: () => _getMapHazards(),
                ),
                MapKeysButton(),
                CustomMyLocationButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _viewListButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hasMapHazards = ref.watch(
          providerOfMap.select(
            (value) => value.hazards.isNotEmpty,
          ),
        );
        if (!hasMapHazards) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.spMin,
              width: 140.spMin,
              child: Button.filled(
                onPressed: () => showMapHazardsListBottomSheet(
                  context: context,
                ),
                borderRadius: 50.0,
                color: AppColors.white,
                icon: Icon(
                  Icons.list_rounded,
                  size: 22.0,
                  color: AppColors.black,
                ),
                value: 'View List',
                valueStyle: TextStyle(
                  color: AppColors.black,
                ),
                elevation: 3.0,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        );
      },
    );
  }

  /// Handles the map movement by updating the camera position in the provider.
  void _handleMapMoved(CameraPosition position) {
    ref
        .read(providerOfMap.notifier)
        .updateCameraPosition(cameraPosition: position);

    EasyDebounce.debounce(
      'map-debouncer',
      const Duration(milliseconds: 300),
      () {
        if (!mounted) return;

        // Get the hazards for the new map position
        ref.read(providerOfMap.notifier).getMapHazards();

        // If route planning is active, update the hazards to avoid for the route
        ref.read(providerOfMap.notifier).getRoutePlanHazardsToAvoid();
      },
    );
  }

  /// Fetches the hazards for the current map view.
  void _getMapHazards() {
    ref.read(providerOfMap.notifier).getMapHazards();

    // also update the hazards to avoid for the route if route planning is active
    ref.read(providerOfMap.notifier).getRoutePlanHazardsToAvoid();
  }
}
