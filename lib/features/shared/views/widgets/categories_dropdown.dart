import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/providers/states/hazards_provider_state.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/views/widgets/dropdown.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';
import 'package:hazard_app/others/app_colors.dart';

class CategoriesDropdown extends ConsumerStatefulWidget {
  const CategoriesDropdown({
    super.key,
    required this.button,
    this.onCategorySelected,
  });

  /// The button widget that triggers the dropdown.
  final Widget button;

  /// Callback when a category is selected.
  final void Function(HazardCategory)? onCategorySelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriesDropdownState();
}

class _CategoriesDropdownState extends ConsumerState<CategoriesDropdown> {
  @override
  Widget build(BuildContext context) {
    return AlrtDropdown(
      button: widget.button,
      menuContent: (context, close) => _categoriesListBuilder(close),
    );
  }

  Widget _categoriesListBuilder(final Function() close) {
    final getCategoriesState = ref.watch(
      providerOfHazards.select(
        (value) => value.getHazardCategoriesState,
      ),
    );

    return getCategoriesState.maybeWhen(
      success: (data) => _dataBuilder(close),
      error: (error) => _errorBuilder(),
      loading: () => _loadingBuilder(),
      orElse: () => const SizedBox(),
    );
  }

  Widget _loadingBuilder() {
    return Spinner();
  }

  Widget _errorBuilder() {
    return const Center(
      child: Text(
        'Failed to load categories. Please try again later.',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _dataBuilder(final Function() close) {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(
          providerOfHazards.select(
            (value) => value.hazardCategories,
          ),
        );
        return ListView.separated(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              leading: Text(
                category.emoji ?? '!',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              title: Text(
                category.name ?? 'N/A',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              onTap: () {
                widget.onCategorySelected?.call(category);
                close();
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 1.0,
            color: AppColors.lightGrey,
          ),
        );
      },
    );
  }
}
