import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/views/widgets/dropdown.dart';
import 'package:hazard_app/others/app_colors.dart';

class SeveritiesDropdown extends ConsumerStatefulWidget {
  const SeveritiesDropdown({
    super.key,
    required this.button,
    this.onSeveritySelected,
  });

  /// The button widget that triggers the dropdown.
  final Widget button;

  /// Callback when a category is selected.
  final void Function(HazardSeverity)? onSeveritySelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeveritiesDropdownState();
}

class _SeveritiesDropdownState extends ConsumerState<SeveritiesDropdown> {
  @override
  Widget build(BuildContext context) {
    return AlrtDropdown(
      button: widget.button,
      dropdownHeight: 232.0,
      menuContent: (context, close) {
        final severities = HazardSeverity.values;
        return ListView.separated(
          itemCount: severities.length,
          itemBuilder: (context, index) {
            final severity = severities[index];
            return ListTile(
              leading: Text(
                severity.emoji,
                style: TextStyle(
                  fontSize: 16.spMin,
                ),
              ),
              title: Text(
                severity.title,
                style: TextStyle(
                  fontSize: 16.spMin,
                ),
              ),
              onTap: () {
                widget.onSeveritySelected?.call(severity);
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
