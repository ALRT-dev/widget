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
  });

  /// The category to display.
  final HazardCategory category;

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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 6.0,
                  offset: Offset(0, 4.0),
                ),
              ]
            : null,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.transparent,
          width: 2.spMin,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.category.color?.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(18.spMin),
        ),
        padding: EdgeInsets.all(20.spMin),
        child: Row(
          children: [
            Image.asset(
              'assets/images/hazards/non_aws/${widget.category.id}_user.png',
              width: 40.spMin,
              height: 40.spMin,
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
  }
}
