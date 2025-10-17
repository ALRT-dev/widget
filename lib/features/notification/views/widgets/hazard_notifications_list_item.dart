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
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_item_provider_state.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_expiry_timer.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class HazardNotificationsListItem extends ConsumerStatefulWidget {
  const HazardNotificationsListItem({
    super.key,
    required this.hazard,
  });

  /// The hazard to display in this list item.
  final Hazard hazard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardNotificationsListItemState();
}

class _HazardNotificationsListItemState
    extends ConsumerState<HazardNotificationsListItem> {
  late final provider = providerOfHazardItem(widget.hazard);

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));

    _listenToVoteHazardState();

    return InkWell(
      onTap: _gotoViewHazard,
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerBuilder(),
          12.hSizedBox,
          Row(
            children: [
              _iconBuilder(),
              10.wSizedBox,
              Expanded(
                child: _titleBuilder(),
              ),
            ],
          ),
          6.hSizedBox,
          _shortDescriptionBuilder(),
          8.hSizedBox,
          _footerBuilder(),
          12.hSizedBox,
          _trustMeterBuilder(),
        ],
      ).pad(10.0),
    ).pX(10.0);
  }

  Widget _headerBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final source = ref.watch(
          provider.select(
            (value) => value.hazard.source,
          ),
        );
        return Row(
          children: [
            Text(
              source?.name ?? 'Crowd Sourced',
              style: TextStyle(
                fontSize: 12.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            6.wSizedBox,
            const Icon(
              Icons.circle,
              size: 4,
              color: AppColors.grey,
            ),
            6.wSizedBox,
            Text(
              source != null ? 'Verified' : 'Unverified',
              style: TextStyle(
                fontSize: 12.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
            4.wSizedBox,
            Icon(
              Icons.verified_rounded,
              size: 16.spMin,
              color: source != null
                  ? AppColors.blue
                  : AppColors.grey.withValues(alpha: 0.3),
            ),
          ],
        );
      },
    );
  }

  Widget _iconBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final severity = ref.watch(
          provider.select(
            (value) => value.hazard.severity,
          ),
        );
        final category = ref.watch(
          provider.select(
            (value) => value.hazard.category,
          ),
        );
        return Container(
          width: 40.spMin,
          height: 40.spMin,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: severity?.color,
          ),
          padding: EdgeInsets.all(8.spMin),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black26,
            ),
            child: Center(
              child: Text(
                category?.emoji ?? '❗',
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
      },
    );
  }

  Widget _titleBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final title = ref.watch(
          provider.select(
            (value) => value.hazard.title ?? 'Unknown Hazard',
          ),
        );
        final createdAt = ref.watch(
          provider.select(
            (value) => value.hazard.createdAt,
          ),
        );
        return RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: 15.spMin,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              if (createdAt != null) ...[
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
                        createdAt,
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
        );
      },
    );
  }

  Widget _shortDescriptionBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final shortDescription = ref.watch(
          provider.select(
            (value) => value.hazard.shortDescription,
          ),
        );
        if (shortDescription?.isEmpty ?? true) {
          return const SizedBox.shrink();
        }

        return Text(
          shortDescription!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        );
      },
    );
  }

  Widget _footerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final otherLatitude = ref.watch(
              provider.select(
                (value) => value.hazard.latitude,
              ),
            );
            final otherLongitude = ref.watch(
              provider.select(
                (value) => value.hazard.longitude,
              ),
            );
            if (otherLatitude == null || otherLongitude == null) {
              return const SizedBox.shrink();
            }

            final distance = ref.watch(
              providerOfLoggedInUser.select(
                (value) => value?.distanceTo(
                  otherLatitude,
                  otherLongitude,
                ),
              ),
            );
            if (distance == null) {
              return const SizedBox.shrink();
            }

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14.spMin,
                  color: AppColors.grey,
                ),
                4.wSizedBox,
                Text(
                  '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} away',
                  style: TextStyle(
                    fontSize: 11.spMin,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final expiresAt = ref.watch(
              provider.select(
                (value) => value.hazard.expiresAt,
              ),
            );

            // Only show expiry timer if the hazard has an expiry date
            if (expiresAt == null) {
              return const SizedBox.shrink();
            }

            return HazardExpiryTimer(
              expiryDateTime: expiresAt,
              activeColor: AppColors.grey,
              style: TextStyle(
                fontSize: 11.spMin,
                fontWeight: FontWeight.w500,
              ),
              iconData: Icons.timer_outlined,
              iconSize: 12.0,
            );
          },
        ),
      ],
    );
  }

  Widget _trustMeterBuilder() {
    return Consumer(
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
    final hazard = ref.read(provider).hazard;
    context.unfocusInputs();
    context.push(
      ViewHazardScreen.route,
      extra: ViewHazardScreenArgs(
        hazard: hazard,
      ),
    );
  }

  /// Handle voting on the hazard by updating the provider and calling the vote function.
  void _voteOnHazard(final HazardVoteType type) {
    ref.read(provider.notifier).voteHazard(voteType: type);
  }
}
