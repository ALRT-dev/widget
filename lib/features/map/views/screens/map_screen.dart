import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/widgets/custom_compass_button.dart';
import 'package:hazard_app/features/map/views/widgets/custom_my_location_button.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazard_info_window.dart';
import 'package:hazard_app/features/map/views/widgets/map_hazards_list.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
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
  var _safeAreaTopPadding = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _safeAreaTopPadding = MediaQuery.of(context).padding.top;
      });
    });
  }

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
                    return Column(
                      children: [
                        RouteSourceAndDestination(),
                        10.hSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _filtersButtonBuilder(),
                          ],
                        ),
                      ],
                    );
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
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10.spMin,
                        bottom: 10.spMin,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 10.spMin,
                          children: [
                            CustomCompassButton(),
                            CustomMyLocationButton(),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10.spMin,
                        left: 0.0,
                        right: 0.0,
                        child: _viewListMapButtonBuilder(),
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
                      return RoutePlanning().pB(20.0);
                    }

                    final isSelectedLocationPresent = ref.watch(
                      providerOfMap.select(
                        (value) => value.selectedLocation != null,
                      ),
                    );
                    if (isSelectedLocationPresent) {
                      return SelectedLocationPreview().pB(20.0);
                    }

                    return const SizedBox();
                  },
                ).pX(20.0),
              ],
            ),
          ),
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

  Widget _listFiltersButtonBuilder() {
    return Stack(
      children: [
        Button.filled(
          width: 120.spMin,
          onPressed: () {
            showHazardFiltersBottomSheet(
              context: context,
              filtersKey: MapScreen.filtersKey,
              onFiltersUpdated: () => _getMapHazards(),
            );
          },
          borderRadius: 50.0,
          color: AppColors.white,
          icon: Icon(
            Icons.filter_list,
            size: 22.0,
            color: AppColors.black,
          ),
          value: 'Filters',
          valueStyle: TextStyle(
            color: AppColors.black,
          ),
          elevation: 3.0,
          padding: EdgeInsets.zero,
        ),
        Positioned(
          right: 0,
          child: _countBuilder(),
        ),
      ],
    );
  }

  Widget _countBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(
          providerOfHazardFiltersForMap.select(
            (value) => value.unselectedFiltersCount,
          ),
        );
        if (count == 0) {
          return const SizedBox.shrink();
        }

        return Container(
          width: 20.spMin,
          height: 20.spMin,
          decoration: BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            count.toString(),
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _listFiltersButtonBuilder()
                          .pT(_safeAreaTopPadding)
                          .pX(20.0),
                    ],
                  ),
                  10.hSizedBox,
                  Expanded(
                    child: MapHazardsList(),
                  ),
                ],
              ),
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

    // also update the hazards to avoid for the route if route planning is active
    ref.read(providerOfMap.notifier).getRoutePlanHazardsToAvoid();
  }
}
