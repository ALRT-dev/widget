import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/navigation_provider.dart';
import 'package:hazard_app/features/map/providers/states/navigation_provider_state.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key});

  static const route = '/navigation';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startNavigationFromCurrentRoute();
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationState = ref.watch(providerOfNavigation);
    final mapState = ref.watch(providerOfMap);

    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                navigationState.currentLocation?.latitude ??
                    ref.read(providerOfLocation).location.latitude,
                navigationState.currentLocation?.longitude ??
                    ref.read(providerOfLocation).location.longitude,
              ),
              zoom: 18.0,
              bearing: navigationState.currentBearing,
              tilt: 60.0, // 3D tilt for navigation mode
            ),
            markers: _buildMarkers(),
            polylines: mapState.polylines,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            compassEnabled: true,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            trafficEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
          ),

          // Top information panel
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: _buildTopInfoPanel(),
          ),

          // Bottom navigation controls
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 16,
            right: 16,
            child: _buildBottomControls(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopInfoPanel() {
    return Consumer(
      builder: (context, ref, child) {
        final navigationState = ref.watch(providerOfNavigation);

        return Container(
          padding: EdgeInsets.all(16.spMin),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (navigationState.currentInstruction != null)
                Row(
                  children: [
                    Icon(
                      _getInstructionIcon(navigationState.currentInstruction!),
                      size: 24.spMin,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        navigationState.currentInstruction!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              if (navigationState.remainingDistance != null) ...[
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDistance(navigationState.remainingDistance!),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    if (navigationState.estimatedArrival != null)
                      Text(
                        'ETA: ${_formatTime(navigationState.estimatedArrival!)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                  ],
                ),
              ],
              if (navigationState.isOffRoute)
                Container(
                  margin: EdgeInsets.only(top: 8.h),
                  padding: EdgeInsets.all(8.spMin),
                  decoration: BoxDecoration(
                    color: AppColors.emergency.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.emergency.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 16.spMin,
                        color: AppColors.emergency,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Off route - Recalculating...',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.emergency,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomControls() {
    return Consumer(
      builder: (context, ref, child) {
        final navigationState = ref.watch(providerOfNavigation);

        return Container(
          padding: EdgeInsets.all(16.spMin),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Pause/Resume button
              RoundButton(
                icon: Icon(
                  navigationState.navigationState ==
                          const NavigationState.paused()
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded,
                  size: 20.spMin,
                ),
                size: 48.0,
                backgroundColor: AppColors.lightGrey,
                onPressed: () {
                  if (navigationState.navigationState ==
                      const NavigationState.paused()) {
                    ref.read(providerOfNavigation.notifier).resumeNavigation();
                  } else {
                    ref.read(providerOfNavigation.notifier).pauseNavigation();
                  }
                },
              ),

              // Stop navigation button
              RoundButton(
                icon: Icon(
                  Icons.stop_rounded,
                  size: 20.spMin,
                  color: AppColors.white,
                ),
                size: 48.0,
                backgroundColor: AppColors.emergency,
                onPressed: () {
                  _showStopNavigationDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Set<Marker> _buildMarkers() {
    final navigationState = ref.watch(providerOfNavigation);
    final markers = <Marker>{};

    // Add destination marker
    if (navigationState.destination != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: LatLng(
            navigationState.destination!.latitude,
            navigationState.destination!.longitude,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'Destination'),
        ),
      );
    }

    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    // Listen to navigation state changes to update camera
    ref.listen<NavigationProviderState>(
      providerOfNavigation,
      (previous, current) {
        if (current.followUser &&
            current.currentLocation != null &&
            previous != current) {
          _updateCameraPosition(
            current.currentLocation!,
            current.currentBearing,
          );
        }
      },
    );
  }

  void _onCameraMove(CameraPosition position) {
    // If user manually moves the camera, temporarily disable auto-follow
    final navigationState = ref.read(providerOfNavigation);
    if (navigationState.followUser && navigationState.currentLocation != null) {
      final currentLatLng = LatLng(
        navigationState.currentLocation!.latitude,
        navigationState.currentLocation!.longitude,
      );
      final distance = _calculateDistance(currentLatLng, position.target);

      // If the user moved the camera significantly, disable auto-follow
      if (distance > 50) {
        // 50 meters threshold
        ref.read(providerOfNavigation.notifier).toggleFollowUser();
      }
    }
  }

  void _updateCameraPosition(AlrtLocation location, double bearing) {
    if (_mapController == null) return;

    _mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 18.0,
          bearing: bearing, // Use calculated bearing for map rotation
          tilt: 60.0,
        ),
      ),
    );
  }

  void _startNavigationFromCurrentRoute() {
    final routePlan = ref.read(providerOfMap).currentRoutePlan;
    final currentRoute = routePlan?.currentRoute;

    if (currentRoute?.currentRoute != null) {
      final route = currentRoute!.currentRoute;
      final routePoints =
          route.polylinePoints
              ?.map((point) => LatLng(point.latitude, point.longitude))
              .toList() ??
          [];

      if (routePoints.isNotEmpty) {
        final destination = routePoints.last;
        ref
            .read(providerOfNavigation.notifier)
            .startNavigation(
              destination: AlrtLocation(
                latitude: destination.latitude,
                longitude: destination.longitude,
              ),
              routePoints: routePoints,
            );
      }
    }
  }

  void _showStopNavigationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stop Navigation'),
        content: const Text('Are you sure you want to stop navigation?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(providerOfNavigation.notifier).stopNavigation();
              Navigator.of(context).pop(); // Go back to map screen
            },
            child: const Text('Stop'),
          ),
        ],
      ),
    );
  }

  double _calculateDistance(LatLng from, LatLng to) {
    const double earthRadius = 6371000;
    final double lat1Rad = from.latitude * pi / 180;
    final double lat2Rad = to.latitude * pi / 180;
    final double deltaLatRad = (to.latitude - from.latitude) * pi / 180;
    final double deltaLngRad = (to.longitude - from.longitude) * pi / 180;

    final double a =
        sin(deltaLatRad / 2) * sin(deltaLatRad / 2) +
        cos(lat1Rad) *
            cos(lat2Rad) *
            sin(deltaLngRad / 2) *
            sin(deltaLngRad / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  IconData _getInstructionIcon(String instruction) {
    if (instruction.toLowerCase().contains('right')) {
      return Icons.turn_right;
    } else if (instruction.toLowerCase().contains('left')) {
      return Icons.turn_left;
    } else if (instruction.toLowerCase().contains('straight')) {
      return Icons.straight;
    } else if (instruction.toLowerCase().contains('u-turn')) {
      return Icons.u_turn_right;
    } else {
      return Icons.navigation;
    }
  }

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} m';
    } else {
      return '${(meters / 1000).toStringAsFixed(1)} km';
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = time.difference(now);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else {
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      return '${hours}h ${minutes}m';
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
