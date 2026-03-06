import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/utils/dialogs.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MapKeysButton extends ConsumerStatefulWidget {
  const MapKeysButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapKeysButtonState();
}

class _MapKeysButtonState extends ConsumerState<MapKeysButton> {
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
        LucideIcons.key,
        size: 20.spMin,
        color: AppColors.black,
      ),
    ).onPressed(_handleTap);
  }

  void _handleTap() {
    showMapKeysBottomSheet(context: context);
  }
}
