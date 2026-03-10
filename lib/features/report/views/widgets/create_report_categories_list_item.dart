import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/others/app_colors.dart';

class CreateReportCategoriesListItem extends ConsumerStatefulWidget {
  const CreateReportCategoriesListItem({
    super.key,
    required this.category,
    this.onCategorySelected,
  });

  /// The category to display.
  final HazardCategory category;

  /// Callback when the category is selected.
  final void Function(HazardCategory)? onCategorySelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateReportCategoriesListItemState();
}

class _CreateReportCategoriesListItemState
    extends ConsumerState<CreateReportCategoriesListItem> {
  @override
  Widget build(BuildContext context) {
    final isSelected = ref.watch(
      providerOfCreateReport.select(
        (state) =>
            state.hazardToCreateOrUpdate.category?.id == widget.category.id,
      ),
    );

    final categoryColor = widget.category.color ?? AppColors.orange;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? categoryColor.withValues(alpha: 0.7)
                : AppColors.shadowColor,
            blurRadius: 6.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
        border: Border(
          left: BorderSide(
            color: categoryColor,
            width: 5.0,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? widget.category.color?.withValues(alpha: 0.25)
              : AppColors.white,
          borderRadius: BorderRadius.circular(18.spMin),
        ),
        padding: EdgeInsets.all(16.spMin),
        child: Row(
          children: [
            Image.asset(
              'assets/images/hazards/non_aws/${widget.category.id}_user.png',
              width: 50.spMin,
              height: 50.spMin,
              fit: BoxFit.contain,
            ),
            12.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category.name ?? 'Unnamed Category',
                    style: TextStyle(
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (widget.category.description != null)
                    Padding(
                      padding: EdgeInsets.only(top: 3.spMin),
                      child: Text(
                        widget.category.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12.spMin,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).onPressed(_handleSelection);
  }

  /// Handles the selection of the category.
  void _handleSelection() {
    ref.read(providerOfCreateReport.notifier).updateCategory(widget.category);
    widget.onCategorySelected?.call(widget.category);
  }
}
