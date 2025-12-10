import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/report/providers/states/create_update_report_provider_state.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_categories_list_item.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

class CreateReportCategoriesList extends ConsumerStatefulWidget {
  const CreateReportCategoriesList({
    super.key,
    this.onCategorySelected,
  });

  /// Callback when a category is selected.
  final void Function(HazardCategory)? onCategorySelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateReportCategoriesListState();
}

class _CreateReportCategoriesListState
    extends ConsumerState<CreateReportCategoriesList> {
  @override
  Widget build(BuildContext context) {
    final getCategoriesState = ref.watch(
      providerOfCreateReport.select(
        (state) => state.getCategoriesToSelectState,
      ),
    );

    return getCategoriesState.maybeWhen(
      loading: _loadingBuilder,
      success: (_) => _dataBuilder(),
      error: _errorBuilder,
      orElse: _emptyBuilder,
    );
  }

  Widget _loadingBuilder() {
    return Column(
      children: [
        Text('Loading categories...'),
        10.hSizedBox,
        Text(
          'Please wait while we fetch the categories for you.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _emptyBuilder() {
    return Column(
      children: [
        Text('No categories available'),
        10.hSizedBox,
        Text(
          'There are currently no categories to select from.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _errorBuilder(final AppError error) {
    return Column(
      children: [
        Text('Error loading categories'),
        10.hSizedBox,
        Text(
          'An error occurred while fetching categories: ${error.message}',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(
          providerOfCreateReport.select(
            (state) => state.categoriesToSelect,
          ),
        );
        if (categories.isEmpty) {
          return _emptyBuilder();
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CreateReportCategoriesListItem(
              category: category,
              onCategorySelected: widget.onCategorySelected,
            );
          },
          separatorBuilder: (context, index) => 12.hSizedBox,
        );
      },
    );
  }
}
