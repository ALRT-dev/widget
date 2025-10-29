import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/common_hazards_list_item.dart';
import 'package:hazard_app/others/app_colors.dart';

class MapHazardPreview extends ConsumerStatefulWidget {
  const MapHazardPreview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapHazardPreviewState();
}

class _MapHazardPreviewState extends ConsumerState<MapHazardPreview> {
  @override
  Widget build(BuildContext context) {
    final selectedHazard = ref.watch(
      providerOfMap.select(
        (value) => value.selectedHazard,
      ),
    );

    if (selectedHazard == null) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.0,
            offset: Offset(0, 4.0),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 0.0,
        bottom: 5.spMin,
        left: 5.spMin,
        right: 5.spMin,
      ),
      child: CommonHazardsListItem(
        key: ValueKey('map_hazard_preview_${selectedHazard.id}'),
        hazard: selectedHazard,
        horizontalPadding: 0.0,
        showCloseButton: true,
        onClosePressed: _handleClosePressed,
      ),
    );
  }

  /// Handles the close button press event.
  void _handleClosePressed() {
    ref.read(providerOfMap.notifier).updateSelectedHazard(null);
  }
}
