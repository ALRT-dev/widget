import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_severity_filters_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';

class HazardSeverityFiltersList extends ConsumerStatefulWidget {
  const HazardSeverityFiltersList({
    super.key,
    required this.filtersKey,
    this.isAws = false,
    this.separatorWidth = 10.0,
    this.onSeveritiesSelectionUpdated,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  /// Indicates whether the filters are for AWS hazards.
  final bool isAws;

  /// The width of the separator between list items.
  final double separatorWidth;

  /// Callback function to notify when the selected severities are updated.
  final void Function(List<HazardSeverityWithCount>)?
  onSeveritiesSelectionUpdated;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSeverityFiltersListState();
}

class _HazardSeverityFiltersListState
    extends ConsumerState<HazardSeverityFiltersList> {
  @override
  Widget build(BuildContext context) {
    return _dataBuilder();
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazardSeverities = ref.watch(
          providerOfHazardFilters(widget.filtersKey).select(
            (value) => widget.isAws
                ? value.hazardSeveritiesAws
                : value.hazardSeveritiesNonAws,
          ),
        );
        if (hazardSeverities.isEmpty) return const SizedBox();

        return Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 30.spMin,
            child: ListView.separated(
              itemCount: hazardSeverities.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final hazardSeverity = hazardSeverities[index];
                return HazardSeverityFiltersListItem(
                  filtersKey: widget.filtersKey,
                  isAws: widget.isAws,
                  hazardSeverity: hazardSeverity,
                  onSelected: (_) => _handleSeveritiesSelectionUpdated(),
                ).pR(index == (hazardSeverities.length - 1) ? 20.0 : 0.0);
              },
              separatorBuilder: (context, index) =>
                  widget.separatorWidth.wSizedBox,
            ),
          ),
        );
      },
    );
  }

  /// Handles the update of selected severities.
  void _handleSeveritiesSelectionUpdated() {
    final selectedSeverities = ref.read(
      providerOfHazardFilters(widget.filtersKey).select(
        (value) => widget.isAws
            ? value.selectedHazardSeveritiesAws
            : value.selectedHazardSeveritiesNonAws,
      ),
    );
    widget.onSeveritiesSelectionUpdated?.call(selectedSeverities);
  }
}
