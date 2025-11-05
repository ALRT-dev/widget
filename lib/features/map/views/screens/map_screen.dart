import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazard_preview.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_filters_dropdown.dart';

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
            onTap: (_) => context.unfocusInputs(),
          ),
          _overlayedContentsBuilder(),
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
                      Consumer(
                        builder: (context, ref, child) {
                          final isFiltersAvailable = ref.watch(
                            providerOfHazardFiltersForMap.select(
                              (value) =>
                                  value.hazardCategories.isNotEmpty ||
                                  value.hazardSeveritiesAws.isNotEmpty ||
                                  value.hazardSeveritiesNonAws.isNotEmpty,
                            ),
                          );
                          if (!isFiltersAvailable) {
                            return const SizedBox.shrink();
                          }
                          return HazardFiltersDropdown(
                            filtersKey: MapScreen.filtersKey,
                          ).pL(10.0);
                        },
                      ),
                    ],
                  );
                },
              ).pX(20.0),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final isHazardSelected = ref.watch(
                providerOfMap.select(
                  (value) => value.selectedHazard != null,
                ),
              );
              if (isHazardSelected) {
                return MapHazardPreview().pB(20.0);
              }

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
        ref.read(providerOfMap.notifier)
          // Get the hazards for the new map position
          ..getMapHazards()
          // If route planning is active, update the hazards to avoid for the route
          ..getRoutePlanHazardsToAvoid();
      },
    );
  }
}
