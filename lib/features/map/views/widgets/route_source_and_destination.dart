import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class RouteSourceAndDestination extends ConsumerStatefulWidget {
  const RouteSourceAndDestination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RouteSourceAndDestinationState();
}

class _RouteSourceAndDestinationState
    extends ConsumerState<RouteSourceAndDestination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.0,
            offset: Offset(0, 0.0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.spMin,
        vertical: 15.spMin,
      ),
      child: Row(
        spacing: 15.spMin,
        children: [
          _iconsBuilder(),
          Expanded(
            child: _locationsBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _iconsBuilder() {
    return Column(
      spacing: 2.spMin,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blue.withValues(alpha: 0.2),
          ),
          padding: EdgeInsets.all(4.spMin),
          child: Icon(
            Icons.circle,
            size: 12.spMin,
            color: AppColors.blue,
          ),
        ),
        Container(
          width: 2.spMin,
          height: 15.spMin,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ).pY(5.0),
        Icon(
          Icons.location_on,
          size: 16.spMin,
          color: AppColors.red,
        ).pB(4.0),
      ],
    );
  }

  Widget _locationsBuilder() {
    final origin = ref.watch(
      providerOfLocation.select(
        (value) => value.location.address,
      ),
    );
    final destination = ref.watch(
      providerOfMap.select(
        (value) => value.selectedPlace?.name,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 14.spMin,
      children: [
        if (origin != null) _locationItemBuilder(origin),
        Divider(
          height: 0.0,
          color: AppColors.lightGrey,
        ),
        if (destination != null) _locationItemBuilder(destination),
      ],
    );
  }

  Widget _locationItemBuilder(final String address) {
    return Text(
      address,
      style: TextStyle(
        fontSize: 14.spMin,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
