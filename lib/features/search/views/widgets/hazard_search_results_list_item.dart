import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class HazardSearchResultsListItem extends ConsumerStatefulWidget {
  const HazardSearchResultsListItem({
    super.key,
    required this.hazard,
  });

  final Hazard hazard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSearchResultsListItemState();
}

class _HazardSearchResultsListItemState
    extends ConsumerState<HazardSearchResultsListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _gotoViewHazard,
      borderRadius: BorderRadius.circular(10.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.spMin,
        children: [
          _iconBuilder(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: widget.hazard.title ?? 'No Title',
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      if (widget.hazard.createdAt != null) ...[
                        TextSpan(
                          text: ' • ',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: AppColors.grey,
                          ),
                        ),
                        TextSpan(
                          text: timeago
                              .format(
                                widget.hazard.createdAt!,
                                locale: 'en_short',
                              )
                              .replaceAll('~', ''),
                          style: TextStyle(
                            fontSize: 10.spMin,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (widget.hazard.shortDescription?.isNotEmpty ?? false)
                  Text(
                    widget.hazard.shortDescription!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ).pad(10.0),
    ).pX(10.0);
  }

  Widget _iconBuilder() {
    return Container(
      width: 45.spMin,
      height: 45.spMin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.hazard.severity?.color,
      ),
      padding: EdgeInsets.all(8.spMin),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black26,
        ),
        child: Center(
          child: Text(
            widget.hazard.category?.emoji ?? '❗',
            style: TextStyle(
              fontSize: 16.spMin,
              shadows: [
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  color: AppColors.black.withValues(alpha: 0.4),
                ),
              ],
            ),
          ).pL(3.0).pB(2.0),
        ),
      ),
    );
  }

  /// Navigate to the View Hazard screen with the current hazard as an argument.
  void _gotoViewHazard() {
    context.unfocusInputs();
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(hazard: widget.hazard),
    );
  }
}
