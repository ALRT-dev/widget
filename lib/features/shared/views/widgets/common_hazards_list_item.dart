import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/notification/views/widgets/confirmation_buttons.dart';
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
import 'package:hazard_app/features/shared/utils/share_alert.dart';
import 'package:hazard_app/features/shared/views/screens/view_hazard_screen.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommonHazardsListItem extends ConsumerStatefulWidget {
  const CommonHazardsListItem({
    super.key,
    required this.hazard,
    this.showCloseButton = false,
    this.onClosePressed,
    this.showTrustMeter = true,
    this.showSourceHeader = true,
    this.horizontalPadding = 20.0,
    this.isInfoWindow = false,
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

  /// Whether this list item is being shown inside an InfoWindow.
  final bool isInfoWindow;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommonHazardsListItemState();
}

class _CommonHazardsListItemState extends ConsumerState<CommonHazardsListItem> {
  late final provider = providerOfHazardItem(widget.hazard.id ?? 'unknown');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isHazardNull = ref.read(provider).hazard == null;
        if (isHazardNull) {
          ref.read(provider.notifier).updateHazard(widget.hazard);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));

    _listenToVoteHazardState();

    final isHazardNull = ref.watch(
      provider.select(
        (value) => value.hazard == null,
      ),
    );
    if (isHazardNull) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: widget.isInfoWindow ? null : _gotoViewHazard,
      borderRadius: BorderRadius.circular(14.spMin),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.spMin),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 5.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _coloredHeaderBuilder(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _iconBuilder(),
                  12.wSizedBox,
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _titleBuilder(),
                              4.hSizedBox,
                              _dateAndDistanceBuilder(),
                            ],
                          ),
                        ),
                        if (widget.hazard.isUserReported) _votesCountBuilder(),
                      ],
                    ),
                  ),
                ],
              ).pX(16.0).pT(16.0),
              if (!widget.isInfoWindow) ...[
                8.hSizedBox,
                _shortDescriptionBuilder().pX(16.0),
              ],
              14.hSizedBox,
              if (widget.showTrustMeter && widget.hazard.isUserReported) ...[
                _confirmationButtonsBuilder().pX(16.0),
              ],
              _categoryAndViewDetailsBuilder(),
            ],
          ),
        ),
      ),
    ).pX(widget.horizontalPadding);
  }

  // ignore: unused_element
  Widget _normalHeaderBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard!.isUserReported,
          ),
        );
        final isAwsCompliant = ref.watch(
          provider.select(
            (value) => value.hazard!.isAwsCompliant ?? false,
          ),
        );
        final severityTitle = ref.watch(
          provider.select(
            (value) => value.hazard!.severityTitle,
          ),
        );
        final source = ref.watch(
          provider.select(
            (value) => value.hazard!.source,
          ),
        );

        final isVerified = source != null;

        final categoryLabel = isUserReported
            ? 'USER'
            : isAwsCompliant
            ? 'AWS'
            : 'OFFICIAL';

        return Row(
          spacing: 8.spMin,
          children: [
            // Category Pill
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.spMin,
                vertical: 4.spMin,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.spMin),
                border: Border.all(
                  color: AppColors.lightGrey,
                  width: 1.0,
                ),
              ),
              child: Text(
                categoryLabel,
                style: TextStyle(
                  fontSize: 10.spMin,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            // Severity/Category Text
            if (isAwsCompliant)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.spMin,
                  vertical: 4.spMin,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.spMin),
                  border: Border.all(
                    color: AppColors.lightGrey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  severityTitle,
                  style: TextStyle(
                    fontSize: 10.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
            // Verification Badge
            if (isVerified)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Icon(
                      Icons.verified_rounded,
                      size: 18.spMin,
                      color: AppColors.blue,
                    ),
                  ),
                  if (widget.showCloseButton && widget.onClosePressed != null)
                    33.wSizedBox,
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _coloredHeaderBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard!.isUserReported,
          ),
        );
        final isAwsCompliant = ref.watch(
          provider.select(
            (value) => value.hazard!.isAwsCompliant ?? false,
          ),
        );
        final severityTitle = ref.watch(
          provider.select(
            (value) => value.hazard!.severityTitle,
          ),
        );
        final source = ref.watch(
          provider.select(
            (value) => value.hazard!.source,
          ),
        );
        final hazardColor = ref.watch(
          provider.select(
            (value) => value.hazard?.color ?? AppColors.black,
          ),
        );

        final isVerified = source != null;

        final pillForegroundColor = hazardColor.isLight
            ? AppColors.grey
            : AppColors.white;
        final pillBackgroundColor = isUserReported
            ? AppColors.white
            : hazardColor.isLight
            ? AppColors.grey
            : AppColors.black;
        final pillBackgroundColorAlpha = isUserReported
            ? 0.6
            : hazardColor == AppColors.transparent
            ? 0.06
            : 0.2;
        final pillBorderColor = hazardColor == AppColors.transparent
            ? AppColors.lightGrey
            : null;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.spMin),

          decoration: BoxDecoration(
            color: hazardColor == AppColors.transparent
                ? AppColors.white
                : hazardColor,
            border: hazardColor == AppColors.transparent
                ? Border(
                    bottom: BorderSide(
                      color: AppColors.lightGrey.withValues(alpha: 0.5),
                      width: 1.0,
                    ),
                  )
                : null,
          ),
          child: Row(
            spacing: 10.spMin,
            children: [
              if (isAwsCompliant &&
                  severityTitle.isNotEmpty &&
                  severityTitle != 'Unknown')
                _headerPillBuilder(
                  label: severityTitle.toUpperCase(),
                  foregroundColor: pillForegroundColor,
                  backgroundColor: pillBackgroundColor,
                  backgroundColorAlpha: pillBackgroundColorAlpha,
                  borderColor: pillBorderColor,
                ),
              if (isUserReported)
                _headerPillBuilder(
                  label: 'USER',
                  foregroundColor: pillForegroundColor,
                  backgroundColor: pillBackgroundColor,
                  backgroundColorAlpha: pillBackgroundColorAlpha,
                  borderColor: pillBorderColor,
                ),
              if (isAwsCompliant)
                _headerPillBuilder(
                  label: 'AWS',
                  foregroundColor: pillForegroundColor,
                  backgroundColor: pillBackgroundColor,
                  backgroundColorAlpha: pillBackgroundColorAlpha,
                  borderColor: pillBorderColor,
                ),
              if (isVerified)
                _headerPillBuilder(
                  label: 'OFFICIAL',
                  foregroundColor: pillForegroundColor,
                  backgroundColor: pillBackgroundColor,
                  backgroundColorAlpha: pillBackgroundColorAlpha,
                  borderColor: pillBorderColor,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _headerPillBuilder({
    required final String label,
    final Color backgroundColor = AppColors.black,
    final Color foregroundColor = AppColors.white,
    final Color? borderColor,
    final double backgroundColorAlpha = 0.2,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor.withValues(
          alpha: backgroundColorAlpha,
        ),
        borderRadius: BorderRadius.circular(20.spMin),
        border: borderColor != null
            ? Border.all(color: borderColor, width: 1.0)
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.spMin,
        vertical: 4.spMin,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.spMin,
            height: 6.spMin,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: foregroundColor,
            ),
          ),
          5.wSizedBox,
          Text(
            label,
            style: TextStyle(
              fontSize: 11.spMin,
              fontWeight: FontWeight.w700,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final iconPath = ref.watch(
          provider.select(
            (value) => value.hazard!.iconPath,
          ),
        );
        final fallbackIconPath = ref.watch(
          provider.select(
            (value) => value.hazard!.fallbackIconPath,
          ),
        );
        final fallbackIconPath2 = ref.watch(
          provider.select(
            (value) => value.hazard!.fallbackIconPath2,
          ),
        );

        return SizedBox(
          width: 48.spMin,
          height: 48.spMin,
          child: Image.asset(
            iconPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              fallbackIconPath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                fallbackIconPath2,
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
            (value) => value.hazard?.isUserReported ?? false
                ? value.hazard?.category?.name ?? 'Alert Report'
                : value.hazard!.title ?? 'Alert',
          ),
        );

        return Text(
          title,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  Widget _votesCountBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final voteCount = ref.watch(
          provider.select(
            (value) => value.hazard!.voteCount,
          ),
        );
        if (voteCount == 0) {
          return const SizedBox.shrink();
        }

        return Container(
          decoration: BoxDecoration(
            color: voteCount > 0 ? AppColors.green : AppColors.red,
            borderRadius: BorderRadius.circular(14.spMin),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.spMin,
            vertical: 4.spMin,
          ),
          child: Row(
            children: [
              Icon(
                voteCount > 0
                    ? Icons.thumb_up_alt_rounded
                    : Icons.thumb_down_alt_rounded,
                size: 14.spMin,
                color: AppColors.white,
              ),
              4.wSizedBox,
              Text(
                '$voteCount',
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ).pL(5.0);
      },
    );
  }

  Widget _dateAndDistanceBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final dateTime = ref.watch(
          provider.select(
            (value) =>
                value.hazard!.updatedAt ??
                value.hazard!.occurredAt ??
                value.hazard!.createdAt,
          ),
        );

        final latitude = ref.watch(
          provider.select(
            (value) => value.hazard!.latitude,
          ),
        );
        final longitude = ref.watch(
          provider.select(
            (value) => value.hazard!.longitude,
          ),
        );

        final distance = ref.watch(
          providerOfLocation.select(
            (value) => latitude == null || longitude == null
                ? null
                : value.distanceTo(latitude, longitude),
          ),
        );

        final distanceText = distance == null
            ? null
            : distance < 1000
            ? '${distance.toStringAsFixed(1)} m'
            : '${(distance / 1000).toStringAsFixed(1)} km';

        final hasExpired = ref.watch(
          provider.select(
            (value) => value.hazard!.isExpired,
          ),
        );

        return Row(
          spacing: 8.spMin,
          children: [
            if (dateTime != null)
              Row(
                children: [
                  Icon(
                    LucideIcons.clock,
                    size: 12.spMin,
                    color: hasExpired
                        ? AppColors.red
                        : AppColors.grey.withValues(alpha: 0.6),
                  ),
                  4.wSizedBox,
                  Text(
                    hasExpired ? 'Expired' : timeago.format(dateTime),
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: hasExpired ? AppColors.red : AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

            if (distanceText != null)
              Row(
                children: [
                  Icon(
                    LucideIcons.mapPin,
                    size: 12.spMin,
                    color: AppColors.grey.withValues(alpha: 0.6),
                  ),
                  4.wSizedBox,
                  Text(
                    distanceText,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _shortDescriptionBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard!.isUserReported,
          ),
        );

        final shortDescription = ref.watch(
          provider.select(
            (value) =>
                '${value.hazard!.category?.name} alert reported near ${value.hazard!.locationName}.',
          ),
        );

        final aiSummary = ref.watch(
          provider.select(
            (value) => value.hazard!.aiSummary?.trim(),
          ),
        );

        final text = isUserReported
            ? [
                if (aiSummary?.isNotEmpty ?? false) aiSummary,
              ].join(' ')
            : [
                if (shortDescription.isNotEmpty) shortDescription,
              ].join(' ');

        if (text.isEmpty) {
          return const SizedBox.shrink();
        }

        return Text(
          text,
          style: TextStyle(
            fontSize: 12.spMin,
            color: AppColors.grey,
          ),
        );
      },
    );
  }

  Widget _confirmationButtonsBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final loggedinUserId = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.id,
          ),
        );
        final isOwnHazard = ref.watch(
          provider.select(
            (value) => value.hazard!.reportedBy?.id == loggedinUserId,
          ),
        );
        if (isOwnHazard) {
          return const SizedBox.shrink();
        }

        final voteType = ref.watch(
          provider.select((value) => value.hazard!.userVoteType),
        );
        final voteCount = ref.watch(
          provider.select((value) => value.hazard!.voteCount),
        );
        final isExpired = ref.watch(
          provider.select((value) => value.hazard!.isExpired),
        );

        final latitude = ref.watch(
          provider.select(
            (value) => value.hazard!.latitude,
          ),
        );
        final longitude = ref.watch(
          provider.select(
            (value) => value.hazard!.longitude,
          ),
        );
        final distance = ref.watch(
          providerOfLocation.select(
            (value) => latitude == null || longitude == null
                ? null
                : value.distanceTo(latitude, longitude),
          ),
        );
        if (distance == null || distance > 1000) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.spMin,
          children: [
            Text(
              'Is this alert still active?',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            ConfirmationButtons(
              updateOnPressed: !isExpired,
              initialVoteType: voteType,
              initialVoteCount: voteCount,
              onVotePressed: _voteOnHazard,
            ),
          ],
        ).pT(2.0).pB(16.0);
      },
    );
  }

  Widget _categoryAndViewDetailsBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final categoryId = ref.watch(
          provider.select(
            (value) => value.hazard!.category?.id,
          ),
        );
        final categoryName = ref.watch(
          provider.select(
            (value) =>
                value.hazard!.category?.parent?.name ??
                value.hazard!.category?.name ??
                'Other',
          ),
        );
        final categoryColor = ref.watch(
          provider.select(
            (value) =>
                value.hazard!.category?.effectiveColor ?? AppColors.black,
          ),
        );
        final darkenCategoryColor = categoryId == 'utilitiesAndInfrastructure'
            ? categoryColor.darken(0.3)
            : categoryColor.darken(0.2);

        return Column(
          children: [
            Divider(
              color: AppColors.lightGrey.withValues(alpha: 0.5),
              height: 1.0,
              thickness: 1.0,
            ).pX(10.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.spMin,
                vertical: 12.spMin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.spMin,
                      vertical: 6.spMin,
                    ),
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20.spMin),
                      border: Border.all(
                        color: darkenCategoryColor,
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      categoryName,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                        color: darkenCategoryColor,
                      ),
                    ),
                  ),
                  if (!widget.isInfoWindow) ...[
                    const Spacer(),
                    _shareButtonBuilder(),
                    12.wSizedBox,
                  ],
                  GestureDetector(
                    onTap: _gotoViewHazard,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                  height: 1.0,
                                ),
                              ),
                              0.6.hSizedBox,
                              Container(
                                height: 1.0,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                        6.wSizedBox,
                        Icon(
                          Icons.arrow_forward,
                          size: 16.spMin,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _shareButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hazard = ref.watch(provider.select((value) => value.hazard));
        if (hazard == null || !isAlertShareable(hazard)) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () => shareAlert(hazard: hazard, from: 'card'),
          child: Padding(
            padding: EdgeInsets.all(4.spMin),
            child: Icon(
              LucideIcons.share,
              size: 17.spMin,
              color: AppColors.grey,
            ),
          ),
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
    if (hazard == null) return;

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
    final isExpired = ref.read(provider).hazard?.isExpired ?? false;
    if (isExpired) {
      context.showErrorToast(
        message: 'Cannot confirm an expired alert.',
      );
      return;
    }

    ref.read(provider.notifier).voteHazard(voteType: type);
  }
}
