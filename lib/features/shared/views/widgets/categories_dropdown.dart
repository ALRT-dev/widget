import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/states/main_categories_provider_state.dart';
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

  static const String filtersKey = 'CategoriesDropdownFilters';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriesDropdownState();
}

class _CategoriesDropdownState extends ConsumerState<CategoriesDropdown> {
  @override
  Widget build(BuildContext context) {
    return AlrtDropdown(
      button: (context, isOpen) => widget.button,
      dropdownHeight: 290.0,
      menuContent: (context, close) => _categoriesListBuilder(close),
    );
  }

  Widget _categoriesListBuilder(final Function() close) {
    final getMainCategoriesState = ref.watch(
      providerOfMainCategories.select(
        (value) => value.getMainCategoriesState,
      ),
    );

    return getMainCategoriesState.maybeWhen(
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
          providerOfMainCategories.select(
            (value) => value.mainCategories,
          ),
        );
        return ListView.separated(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              leading: Image.asset(
                'assets/images/hazards/non_aws/${category.id}_user.png',
                width: 32.spMin,
                height: 32.spMin,
                fit: BoxFit.contain,
              ),
              title: Text(
                category.name ?? 'N/A',
                style: TextStyle(
                  fontSize: 16.spMin,
                ),
              ),
              subtitle: category.description != null
                  ? Text(
                      category.description!,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        color: AppColors.grey,
                      ),
                    )
                  : null,
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
