import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';

class CustomMyLocationButton extends ConsumerStatefulWidget {
  const CustomMyLocationButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomMyLocationButtonState();
}

class _CustomMyLocationButtonState
    extends ConsumerState<CustomMyLocationButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shape: CircleBorder(),
      child: Container(
        width: 50.spMin,
        height: 50.spMin,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.my_location_rounded,
          ),
          onPressed: _handleTap,
        ),
      ),
    );
  }

  /// Handles tap on the custom my location button.
  void _handleTap() {
    final location = ref.read(providerOfLocation).location;
    ref
        .read(providerOfMap.notifier)
        .animateTo(position: location.latLng, zoom: 16.0);
  }
}
