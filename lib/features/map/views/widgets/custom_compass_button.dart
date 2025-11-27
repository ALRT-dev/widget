import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw north pointer (red) - left half
    final northPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final northPath = Path()
      ..moveTo(center.dx, center.dy - radius * 0.9) // Top point
      ..lineTo(center.dx - radius * 0.3, center.dy) // Left center
      ..lineTo(center.dx + radius * 0.3, center.dy) // Right center
      ..close();

    canvas.drawPath(northPath, northPaint);

    // Draw south pointer (grey) - right half
    final southPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.fill;

    final southPath = Path()
      ..moveTo(center.dx, center.dy + radius * 0.9) // Bottom point
      ..lineTo(center.dx + radius * 0.3, center.dy) // Right center
      ..lineTo(center.dx - radius * 0.3, center.dy) // Left center
      ..close();

    canvas.drawPath(southPath, southPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomCompassButton extends ConsumerStatefulWidget {
  const CustomCompassButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomCompassButtonState();
}

class _CustomCompassButtonState extends ConsumerState<CustomCompassButton> {
  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(providerOfMap);
    final bearing = mapState.cameraPosition.bearing;

    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: bearing == 0 ? 0.0 : 1.0,
      child: Material(
        elevation: 3.0,
        shape: CircleBorder(),
        child: Container(
          width: 50.spMin,
          height: 50.spMin,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Transform.rotate(
            angle: -bearing * pi / 180,
            child: InkWell(
              onTap: _handleTap,
              customBorder: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(12.spMin),
                child: CustomPaint(
                  painter: CompassPainter(),
                  size: Size(26.spMin, 26.spMin),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Handles tap on the custom compass button to reset map bearing to north.
  void _handleTap() {
    final currentPosition = ref.read(providerOfMap).cameraPosition;
    ref
        .read(providerOfMap.notifier)
        .animateToCameraUpdate(
          cameraUpdate: CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentPosition.target,
              zoom: currentPosition.zoom,
              tilt: currentPosition.tilt,
              bearing: 0,
            ),
          ),
        );
  }
}
