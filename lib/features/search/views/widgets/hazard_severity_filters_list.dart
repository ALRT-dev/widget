import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_severity_filters_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_severity_filters_provider.dart';

class HazardSeverityFiltersList extends ConsumerStatefulWidget {
  const HazardSeverityFiltersList({
    super.key,
    required this.severityFiltersKey,
    this.onSeveritiesSelectionUpdated,
  });

  /// The key to identify the severity filters provider.
  final String severityFiltersKey;

  /// Callback when the severity filters selection is updated.
  final Function(List<HazardSeverityWithCount>)? onSeveritiesSelectionUpdated;

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
          providerOfHazardSeverityFilters(widget.severityFiltersKey).select(
            (value) => value.hazardSeverities,
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
              itemBuilder: (context, index) {
                final hazardSeverity = hazardSeverities[index];
                return HazardSeverityFiltersListItem(
                      severityFiltersKey: widget.severityFiltersKey,
                      hazardSeverity: hazardSeverity,
                      onSelected: (_) => _handleSeveritiesSelectionUpdated(),
                    )
                    .pL(index == 0 ? 20.0 : 0.0)
                    .pR(index == (hazardSeverities.length - 1) ? 20.0 : 0.0);
              },
              separatorBuilder: (context, index) => 10.wSizedBox,
            ),
          ),
        );
      },
    );
  }

  /// Handles the update of selected severities.
  void _handleSeveritiesSelectionUpdated() {
    final selectedSeverities = ref
        .read(providerOfHazardSeverityFilters(widget.severityFiltersKey))
        .selectedSeverities;
    widget.onSeveritiesSelectionUpdated?.call(selectedSeverities);
  }
}
