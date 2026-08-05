import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/others/app_colors.dart';

/// The ink a category chip draws in: the locked category colour, darkened
/// enough to stay readable as text and as a border.
Color categoryChipColor(final HazardCategory category) {
  // Utilities amber needs the extra step to hold contrast on white.
  return category.id == 'utilitiesAndInfrastructure'
      ? category.resolvedColor.darken(0.3)
      : category.resolvedColor.darken(0.2);
}

/// The one category pill in the app.
///
/// The ALRT feed filters, the map keys sheet and notification settings all
/// render this, so a category is the same shape and the same colour
/// wherever it is offered.
class CategoryFilterChip extends StatelessWidget {
  const CategoryFilterChip({
    super.key,
    required this.category,
    required this.isSelected,
    this.onToggle,
  });

  /// The category the chip stands for.
  final HazardCategory category;

  /// Whether the category is currently on.
  final bool isSelected;

  /// Called with the new value when tapped. A null callback renders the
  /// chip as a legend entry that does not respond to touch.
  final ValueChanged<bool>? onToggle;

  @override
  Widget build(BuildContext context) {
    final color = categoryChipColor(category);

    final chip = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.spMin,
        vertical: 8.spMin,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? color.withValues(alpha: 0.12)
            : color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.spMin),
        // The outline always carries the category's own colour, softened
        // when unselected. A grey outline made every category look the
        // same until you tapped one, which is the opposite of the point:
        // colour is how a category is recognised.
        border: Border.all(
          color: isSelected ? color : color.withValues(alpha: 0.45),
          width: (isSelected ? 1.6 : 1.2).spMin,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // A filled dot repeats the colour where the outline is faint, so
          // the category still reads at a glance and never by colour alone.
          Container(
            width: 8.spMin,
            height: 8.spMin,
            margin: EdgeInsets.only(right: 7.spMin),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          Text(
            category.name ?? 'Unknown Category',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? color : AppColors.black,
            ),
          ),
        ],
      ),
    );

    if (onToggle == null) return chip;
    return chip.onPressed(() => onToggle!(!isSelected));
  }
}
