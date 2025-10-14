import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/profile/providers/profile_provider.dart';
import 'package:hazard_app/features/profile/providers/states/profile_provider_state.dart';
import 'package:hazard_app/features/profile/views/widgets/needs_update_reports_widgets/needs_update_reports_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';

class NeedsUpdateReportsList extends ConsumerStatefulWidget {
  const NeedsUpdateReportsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NeedsUpdateReportsListState();
}

class _NeedsUpdateReportsListState
    extends ConsumerState<NeedsUpdateReportsList> {
  @override
  Widget build(BuildContext context) {
    final getMyRejectedHazardsState = ref.watch(
      providerOfProfile.select(
        (value) => value.getMyRejectedHazardsState,
      ),
    );

    return getMyRejectedHazardsState.maybeWhen(
      loading: _loadingBuilder,
      error: _errorBuilder,
      success: (_) => _dataBuilder(),
      orElse: () => const SizedBox(),
    );
  }

  Widget _loadingBuilder() {
    return Spinner();
  }

  Widget _errorBuilder(final AppError error) {
    return Center(
      child: Text(
        'We encountered an error loading recent reports',
      ),
    );
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final recentReports = ref.watch(
          providerOfProfile.select(
            (value) => value.myRejectedHazards,
          ),
        );

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.separated(
            itemCount: recentReports.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final report = recentReports[index];
              return NeedsUpdateReportsListItem(
                report: report,
              );
            },
            separatorBuilder: (context, index) => 10.hSizedBox,
          ),
        );
      },
    );
  }
}
