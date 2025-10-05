import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
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
        myLocationEnabled: true,
        onMapCreated: (controller) {
          ref
              .read(providerOfMap.notifier)
              .init(googleMapController: controller);
        },
        onCameraMove: _handleMapMoved,
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
        ref.read(providerOfHazards.notifier).getMapHazards();
      },
    );
  }
}
