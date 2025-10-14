import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/notification/views/widgets/trust_meter.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_item_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_item_provider_state.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentReportsListItem extends ConsumerStatefulWidget {
  const RecentReportsListItem({
    super.key,
    required this.report,
  });

  /// The hazard to display in this list item.
  final Hazard report;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentReportsListItemState();
}

class _RecentReportsListItemState extends ConsumerState<RecentReportsListItem> {
  late final provider = providerOfHazardItem(widget.report);

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));

    _listenToVoteHazardState();

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
                        text: widget.report.title ?? 'No Title',
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      if (widget.report.createdAt != null) ...[
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
                                widget.report.createdAt!,
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
                if (widget.report.shortDescription != null)
                  Text(
                    widget.report.shortDescription!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                8.hSizedBox,
                Consumer(
                  builder: (context, ref, child) {
                    final voteType = ref.watch(
                      provider.select((value) => value.hazard.userVoteType),
                    );
                    final voteCount = ref.watch(
                      provider.select((value) => value.hazard.voteCount),
                    );

                    return TrustMeter(
                      initialVoteType: voteType,
                      initialVoteCount: voteCount,
                      onVotePressed: _voteOnHazard,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ).pad(10.0),
    );
  }

  Widget _iconBuilder() {
    return Container(
      width: 45.spMin,
      height: 45.spMin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.report.severity?.color,
      ),
      padding: EdgeInsets.all(8.spMin),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black26,
        ),
        child: Center(
          child: Text(
            widget.report.category?.emoji ?? '❗',
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

  /// Listen to changes in the vote hazard state and show error messages if any.
  void _listenToVoteHazardState() {
    ref.listen<VoteHazardState>(
      provider.select(
        (value) => value.voteState,
      ),
      (previous, next) {
        if (previous != next) {
          next.maybeWhen(
            error: _handleErrors,
            orElse: () {},
          );
        }
      },
    );
  }

  /// Handle error messages from the vote hazard state.
  void _handleErrors(final AppError error) {
    context.showErrorToast(
      message: 'Unable to vote. Please try again.',
    );
  }

  /// Navigate to the View Hazard screen with the current hazard as an argument.
  void _gotoViewHazard() {
    context.unfocusInputs();
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(hazard: widget.report),
    );
  }

  /// Handle voting on the hazard by updating the provider and calling the vote function.
  void _voteOnHazard(final HazardVoteType type) {
    ref.read(provider.notifier).voteHazard(voteType: type);
  }
}
