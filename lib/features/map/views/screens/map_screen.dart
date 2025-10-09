import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/views/widgets/map_searchbar.dart';
import 'package:hazard_app/features/map/views/widgets/route_planning.dart';
import 'package:hazard_app/features/map/views/widgets/route_source_and_destination.dart';
import 'package:hazard_app/features/map/views/widgets/selected_location_preview.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

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
              return MapSearchbar();
            },
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
          ),
        ],
      ).pX(20.0),
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
        ref.read(providerOfHazards.notifier).getMapHazards();
      },
    );
  }
}
