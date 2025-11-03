import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/notification/views/widgets/trust_meter.dart';
import 'package:hazard_app/features/shared/enums/bushfire_alert_level_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_item_provider.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/states/hazard_item_provider_state.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_expiry_timer.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_medias_carousel.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommonHazardsListItem extends ConsumerStatefulWidget {
  const CommonHazardsListItem({
    super.key,
    required this.hazard,
    this.showCloseButton = false,
    this.onClosePressed,
    this.showTrustMeter = true,
    this.showSourceHeader = true,
    this.horizontalPadding = 10.0,
  });

  /// The hazard to display in this list item.
  final Hazard hazard;

  /// Whether to show a close button on the list item.
  final bool showCloseButton;

  /// Callback when the close button is pressed.
  final void Function()? onClosePressed;

  /// Whether to show the trust meter widget.
  final bool showTrustMeter;

  /// Whether to show the source information in the header.
  final bool showSourceHeader;

  /// The horizontal padding around the list item.
  final double horizontalPadding;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommonHazardsListItemState();
}

class _CommonHazardsListItemState extends ConsumerState<CommonHazardsListItem> {
  late final provider = providerOfHazardItem(widget.hazard);

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));

    _listenToVoteHazardState();

    return InkWell(
      onTap: _gotoViewHazard,
      borderRadius: BorderRadius.circular(18.spMin),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.spMin),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showSourceHeader) ...[
              _headerBuilder(),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.hazard.processedMedias.isNotEmpty) ...[
                  3.hSizedBox,
                  HazardMediasCarousel(
                    id: widget.hazard.id!,
                    medias: widget.hazard.processedMedias,
                  ),
                  15.hSizedBox,
                ],
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
                if (widget.showTrustMeter && widget.hazard.source == null) ...[
                  12.hSizedBox,
                  _trustMeterBuilder(),
                ],
              ],
            ).pad(10.0),
          ],
        ),
      ),
    ).pX(widget.horizontalPadding);
  }

  Widget _headerBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final bushFireAlertLevel = ref.watch(
          provider.select(
            (value) => value.hazard.bushFireAlertLevel,
          ),
        );
        final hazardColor = ref.watch(
          provider.select(
            (value) => value.hazard.color,
          ),
        );
        final severity = ref.watch(
          provider.select(
            (value) => value.hazard.severity,
          ),
        );
        final severityTitle = ref.watch(
          provider.select(
            (value) => value.hazard.severityTitle,
          ),
        );
        final source = ref.watch(
          provider.select(
            (value) => value.hazard.source,
          ),
        );
        final reportedBy = ref.watch(
          provider.select(
            (value) => value.hazard.reportedBy,
          ),
        );

        final foregroundColor = hazardColor.isLight
            ? AppColors.black
            : AppColors.white;

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: hazardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.spMin),
                  topRight: Radius.circular(16.spMin),
                ),
                border: severity != HazardSeverity.unknown
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: AppColors.lightGrey,
                          width: 1,
                        ),
                      ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.spMin,
                vertical: 15.spMin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5.spMin,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 6,
                          child: Text(
                            source?.name ?? 'Crowd Sourced',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w600,
                              color: foregroundColor,
                            ),
                          ),
                        ),
                        6.wSizedBox,
                        Flexible(
                          flex: 4,
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 4,
                                color: foregroundColor,
                              ),
                              6.wSizedBox,
                              Text(
                                source != null
                                    ? 'Verified'
                                    : reportedBy?.reportsStatus.title ??
                                          'Unverified',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  fontWeight: FontWeight.w500,
                                  color: foregroundColor,
                                ),
                              ),
                              4.wSizedBox,
                              Icon(
                                Icons.verified_rounded,
                                size: 16.spMin,
                                color: source != null
                                    ? hazardColor.isLight
                                          ? AppColors.blue
                                          : AppColors.white
                                    : reportedBy?.reportsStatus.color ??
                                          AppColors.lightGrey,
                              ),
                              // if (confidenceScore != null && !kDebugMode) ...[
                              //   4.wSizedBox,
                              //   Icon(
                              //     Icons.circle,
                              //     size: 4,
                              //     color: foregroundColor,
                              //   ),
                              //   6.wSizedBox,
                              //   Flexible(
                              //     child: Text(
                              //       'ACS: $confidenceScore',
                              //       style: TextStyle(
                              //         fontSize: 12.spMin,
                              //         fontWeight: FontWeight.w500,
                              //         color: foregroundColor,
                              //       ),
                              //     ),
                              //   ),
                              // ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (severity != HazardSeverity.unknown &&
                      (bushFireAlertLevel == null ||
                          bushFireAlertLevel == BushfireAlertLevel.advice))
                    Text(
                      severityTitle,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                        color: foregroundColor,
                      ),
                    ),
                  if (widget.showCloseButton &&
                      widget.onClosePressed != null) ...[
                    30.wSizedBox,
                  ],
                ],
              ),
            ),
            if (widget.showCloseButton && widget.onClosePressed != null)
              Positioned(
                right: 10.0,
                top: 0.0,
                bottom: 0.0,
                child: RoundButton(
                  icon: Icon(
                    Icons.close_rounded,
                    size: 20.spMin,
                  ),
                  size: 30.0,
                  backgroundColor: AppColors.white,
                  onPressed: widget.onClosePressed,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _iconBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final iconPath = ref.watch(
          provider.select(
            (value) => value.hazard.iconPath,
          ),
        );
        final fallbackIconPath = ref.watch(
          provider.select(
            (value) => value.hazard.fallbackIconPath,
          ),
        );
        final fallbackIconPath2 = ref.watch(
          provider.select(
            (value) => value.hazard.fallbackIconPath2,
          ),
        );
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Image.asset(
            iconPath,
            width: 30.spMin,
            height: 30.spMin,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              fallbackIconPath,
              width: 30.spMin,
              height: 30.spMin,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                fallbackIconPath2,
                width: 30.spMin,
                height: 30.spMin,
                fit: BoxFit.contain,
              ),
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
            (value) => value.hazard.shortDescription?.trim(),
          ),
        );
        final callToAction = ref.watch(
          provider.select(
            (value) => value.hazard.callToAction?.trim(),
          ),
        );

        final text = [
          if (shortDescription?.isNotEmpty ?? false) shortDescription,
          if (callToAction?.isNotEmpty ?? false) callToAction!,
        ].join(' ');

        return Text(
          text,
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
        final isExpired = ref.watch(
          provider.select((value) => value.hazard.isExpired),
        );

        return TrustMeter(
          updateOnPressed: !isExpired,
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
    final isExpired = ref.read(provider).hazard.isExpired;
    if (isExpired) {
      context.showErrorToast(
        message: 'Cannot vote on an expired hazard.',
      );
      return;
    }

    ref.read(provider.notifier).voteHazard(voteType: type);
  }
}
