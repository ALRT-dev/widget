import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class HazardNotificationsListItem extends ConsumerStatefulWidget {
  const HazardNotificationsListItem({
    super.key,
    required this.hazard,
  });

  final Hazard hazard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardNotificationsListItemState();
}

class _HazardNotificationsListItemState
    extends ConsumerState<HazardNotificationsListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _gotoViewHazard,
      borderRadius: BorderRadius.circular(10.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.w,
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (widget.hazard.shortDescription != null)
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
          _imageBuilder(),
        ],
      ).pad(10.0),
    ).pX(10.0);
  }

  Widget _iconBuilder() {
    return Container(
      width: 45.w,
      height: 45.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.hazard.severity?.color,
      ),
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black26,
        ),
        child: Center(
          child: Text(
            widget.hazard.category?.emoji ?? '❗',
            style: TextStyle(
              fontSize: 16.sp,
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

  Widget _imageBuilder() {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            'https://c.files.bbci.co.uk/132A8/production/_127840587_brazillandslide.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Navigate to the View Hazard screen with the current hazard as an argument.
  void _gotoViewHazard() {
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(hazard: widget.hazard),
    );
  }
}
