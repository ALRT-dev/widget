import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

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
    return Container(
      width: 48.spMin,
      height: 48.spMin,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.spMin),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.0,
            offset: Offset(0, 0.0),
          ),
        ],
      ),
      child: Icon(
        Icons.my_location_rounded,
        size: 20.spMin,
        color: AppColors.black,
      ),
    ).onPressed(_handleTap);
  }

  /// Handles tap on the custom my location button.
  void _handleTap() {
    final location = ref.read(providerOfLocation).location;
    ref
        .read(providerOfMap.notifier)
        .animateTo(position: location.latLng, zoom: 14.0);
  }
}
