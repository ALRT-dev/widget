import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazard_preview.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_severity_filters_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';
import 'package:hazard_app/others/app_colors.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  static const categoriesKey = 'MapScreenCategoriesKey';
  static const severityFiltersKey = 'MapScreenSeverityFiltersKey';

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
                      _filtersButtonBuilder(),
                    ],
                  );
                },
              ).pX(20.0),
              10.hSizedBox,
              Consumer(
                builder: (context, ref, child) {
                  final isFiltersVisible = ref.watch(
                    providerOfHazardSeverityFiltersForMap.select(
                      (value) => value.isFiltersVisible,
                    ),
                  );
                  if (!isFiltersVisible) {
                    return const SizedBox.shrink();
                  }

                  return HazardSeverityFiltersList(
                    severityFiltersKey: MapScreen.severityFiltersKey,
                    onSeveritiesSelectionUpdated: (_) =>
                        _handleSeverityFilterChanged(),
                  ).pB(10.0);
                },
              ),
              HazardCategoriesList(
                categoriesKey: MapScreen.categoriesKey,
                onCategoriesSelectionUpdated: (_) =>
                    _handleCategoryFilterChanged(),
              ),
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

  Widget _filtersButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isFiltersAvailable = ref.watch(
          providerOfHazardSeverityFiltersForMap.select(
            (value) => value.hazardSeverities.isNotEmpty,
          ),
        );
        if (!isFiltersAvailable) {
          return const SizedBox.shrink();
        }

        final isFiltersVisible = ref.watch(
          providerOfHazardSeverityFiltersForMap.select(
            (value) => value.isFiltersVisible,
          ),
        );

        return Container(
          width: 48.spMin,
          height: 48.spMin,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
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
          child: Icon(
            isFiltersVisible
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            size: 22.spMin,
            color: AppColors.black,
          ),
        ).pL(10.0).onPressed(_handleFiltersButtonPressed);
      },
    );
  }

  /// Toggles the visibility of the severity filters.
  void _handleFiltersButtonPressed() {
    ref
        .read(providerOfHazardSeverityFiltersForMap.notifier)
        .toggleFiltersVisibility();
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
        ref.read(providerOfMap.notifier).getMapHazards();
      },
    );
  }

  /// Handles the change of severity filters by updating the hazards on the map.
  void _handleSeverityFilterChanged() {
    ref.read(providerOfMap.notifier).getMapHazards();
  }

  /// Handles the selection of category filters by updating the hazards on the map.
  void _handleCategoryFilterChanged() {
    ref.read(providerOfMap.notifier).getMapHazards();
  }
}
