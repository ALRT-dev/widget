import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazard_info_window.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazards_list.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_filters_button.dart';
import 'package:hazard_app/others/app_colors.dart';

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
            myLocationButtonEnabled: true,
            compassEnabled: false,
            zoomControlsEnabled: false,
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
          _overlayedContentsBuilder(),
          const MapHazardInfoWindow(),
          Positioned(
            bottom: 10.spMin,
            left: 0.0,
            right: 0.0,
            child: _viewListMapButtonBuilder(),
          ),
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
                    children: [
                      Expanded(child: MapSearchbar()),
                      _filtersButtonBuilder(),
                    ],
                  );
                },
              ).pX(20.0),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final isRoutePresent = ref.watch(
                providerOfMap.select(
                  (value) => value.currentRoutePlan != null,
                ),
              );
              if (isRoutePresent) {
                return RoutePlanning().pB(20.0);
              }

              return SelectedLocationPreview().pB(20.0);
            },
          ).pX(20.0),
        ],
      ),
    );
  }

  Widget _filtersButtonBuilder() {
    return HazardFiltersButton(
      filtersKey: MapScreen.filtersKey,
      onFiltersUpdated: () => _getMapHazards(),
    ).pL(10.0);
  }

  Widget _viewListMapButtonBuilder({
    final bool isViewList = true,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final hasMapHazards = ref.watch(
          providerOfMap.select(
            (value) => value.hazards.isNotEmpty,
          ),
        );
        if (isViewList && !hasMapHazards) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.spMin,
              width: 140.spMin,
              child: Button.filled(
                onPressed: () {
                  if (isViewList) {
                    _showFullScreenBottomSheet();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                borderRadius: 50.0,
                color: isViewList ? AppColors.white : const Color(0xFF3A3A3A),
                icon: Icon(
                  isViewList ? Icons.list_rounded : Icons.map_rounded,
                  size: 22.0,
                  color: isViewList ? AppColors.black : AppColors.white,
                ),
                value: isViewList ? 'View List' : 'View Map',
                valueStyle: TextStyle(
                  color: isViewList ? AppColors.black : AppColors.white,
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

  void _showFullScreenBottomSheet() {
    showCupertinoModalPopup(
      context: context,
      // isScrollControlled: true,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Stack(
            children: [
              MapHazardsList(),
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 80.spMin,
                child: _viewListMapButtonBuilder(
                  isViewList: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Handles the map movement by updating the camera position in the provider.
  void _handleMapMoved(CameraPosition position) {
    ref
        .read(providerOfMap.notifier)
        .updateCameraPosition(cameraPosition: position);

    EasyDebounce.debounce(
      'map-debouncer',
      const Duration(milliseconds: 100),
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
  }
}
