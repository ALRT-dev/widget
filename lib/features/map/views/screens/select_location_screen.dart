import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';

class SelectLocationScreenArgs {
  SelectLocationScreenArgs({
    this.initialLocation,
  });

  /// The initial location to center the map on.
  final AlrtLocation? initialLocation;
}

class SelectLocationScreen extends ConsumerStatefulWidget {
  const SelectLocationScreen({
    super.key,
    this.args,
  });

  final SelectLocationScreenArgs? args;

  static const route = '/select-location';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectLocationScreenState();
}

class _SelectLocationScreenState extends ConsumerState<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          _doneButtonBuilder(),
          15.wSizedBox,
        ],
      ),
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
          _onInit();
        },
        onTap: _handleMapTapped,
      ),
    );
  }

  Widget _doneButtonBuilder() {
    return RoundButton(
      icon: Icon(Icons.check_rounded),
      onPressed: () {
        final marker = ref.read(providerOfMap).markers.firstWhere(
            (marker) => marker.markerId.value == 'selected-location');
        final position = marker.position;
        final location = AlrtLocation(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        context.pop(location);
      },
    );
  }

  void _onInit() {
    final currentLocation = ref.read(providerOfLocation).location;
    final initialLocation = widget.args?.initialLocation ??
        AlrtLocation(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
        );

    ref.read(providerOfMap.notifier).animateTo(
          position: LatLng(
            initialLocation.latitude,
            initialLocation.longitude,
          ),
        );
    ref.read(providerOfMap.notifier).updateMarkers({
      Marker(
        markerId: const MarkerId('selected-location'),
        position: LatLng(
          initialLocation.latitude,
          initialLocation.longitude,
        ),
      ),
    });
  }

  /// Handles the map tap by updating the marker position in the provider.
  void _handleMapTapped(final LatLng position) {
    ref.read(providerOfMap.notifier).updateMarkers({
      Marker(
        markerId: const MarkerId('selected-location'),
        position: position,
      ),
    });
  }
}
