import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
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
      onTap: () {},
      borderRadius: BorderRadius.circular(10.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/warning.png',
            width: 32.w,
            height: 32.h,
          ),
          10.wSizedBox,
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      if (widget.hazard.createdAt != null) ...[
                        TextSpan(
                          text: ' • ',
                          style: TextStyle(
                            fontSize: 12.sp,
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
                            fontSize: 10.sp,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Text(
                  widget.hazard.description ?? 'No Description',
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
    ).pX(20.0);
  }
}
