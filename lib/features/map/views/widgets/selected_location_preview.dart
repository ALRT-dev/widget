import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/states/map_provider_state.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class SelectedLocationPreview extends ConsumerStatefulWidget {
  const SelectedLocationPreview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectedLocationPreviewState();
}

class _SelectedLocationPreviewState
    extends ConsumerState<SelectedLocationPreview> {
  @override
  Widget build(BuildContext context) {
    final selectedPlace = ref.watch(
      providerOfMap.select(
        (value) => value.selectedPlace,
      ),
    );
    if (selectedPlace == null) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(10.spMin),
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.w,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedPlace.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      selectedPlace.address,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              RoundButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 20.spMin,
                ),
                onPressed: _clearSelectedLocation,
              ),
            ],
          ),
          _actionButtonsBuilder(),
        ],
      ),
    );
  }

  Widget _actionButtonsBuilder() {
    return Row(
      spacing: 5.w,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(
              providerOfMap.select(
                (value) => value.getRouteState.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
              ),
            );

            return _buttonBuilder(
              value: 'Directions',
              isLoading: isLoading,
              icon: Icon(
                Icons.directions_rounded,
                size: 20.spMin,
                color: AppColors.white,
              ),
              onPressed: _getDirections,
            );
          },
        ),
        _buttonBuilder(
          value: 'Start',
          icon: Icon(
            Icons.navigation_rounded,
            size: 20.spMin,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buttonBuilder({
    required final String value,
    final Widget? icon,
    final void Function()? onPressed,
    final bool isLoading = false,
  }) {
    return SizedBox(
      height: 34.h,
      child: Button.filled(
        value: value,
        isLoading: isLoading,
        padding: EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 20.spMin,
        ),
        valueStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

  /// Clears the selected location in the map provider.
  void _clearSelectedLocation() {
    ref.read(providerOfMap.notifier)
      ..updateSelectedPlace(null)
      ..removeSelectedLocationMarker();
  }

  /// Gets the directions to the selected location.
  void _getDirections() {
    final selectedPlace = ref.read(providerOfMap).selectedPlace;
    if (selectedPlace == null) return;

    final currentUserLocation = ref.read(providerOfLocation).location;

    final origin = LatLng(
      currentUserLocation.latitude,
      currentUserLocation.longitude,
    );
    final destination = LatLng(
      selectedPlace.latitude,
      selectedPlace.longitude,
    );

    ref.read(providerOfMap.notifier).getRoute(
          origin: origin,
          destination: destination,
        );
  }
}
