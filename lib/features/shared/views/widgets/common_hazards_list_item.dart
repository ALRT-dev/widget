import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/notification/views/widgets/confirmation_buttons.dart';
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
import 'package:hazard_app/features/shared/views/widgets/button.dart';
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

    final hazardColor = ref.watch(
      provider.select(
        (value) => value.hazard?.color ?? AppColors.black,
      ),
    );

    return InkWell(
      onTap: widget.isInfoWindow ? null : _gotoViewHazard,
      borderRadius: BorderRadius.circular(14.spMin),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.spMin),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 8.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.spMin),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.spMin),
              border: Border(
                left: BorderSide(
                  color: hazardColor == AppColors.transparent
                      ? AppColors.black
                      : hazardColor,
                  width: 4.0,
                ),
                top: BorderSide(
                  color: hazardColor == AppColors.transparent
                      ? AppColors.black
                      : hazardColor,
                  width: 1.0,
                ),
                right: BorderSide(
                  color: hazardColor == AppColors.transparent
                      ? AppColors.black
                      : hazardColor,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: hazardColor == AppColors.transparent
                      ? AppColors.black
                      : hazardColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                _headerBuilder(),
                                8.hSizedBox,
                                _titleBuilder(),
                                4.hSizedBox,
                                _dateAndDistanceBuilder(),
                              ],
                            ),
                          ),
                          if (widget.hazard.isUserReported)
                            _votesCountBuilder(),
                        ],
                      ),
                    ),
                  ],
                ).pX(16.0).pT(16.0),
                8.hSizedBox,
                _shortDescriptionBuilder().pX(16.0),
                14.hSizedBox,
                if (widget.showTrustMeter && widget.hazard.isUserReported) ...[
                  _confirmationButtonsBuilder().pX(16.0),
                ],
                if (widget.isInfoWindow) ...[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      16.0.spMin,
                      0.0,
                      16.0.spMin,
                      14.0.spMin,
                    ),
                    child: _viewDetailsButtonBuilder(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ).pX(widget.horizontalPadding);
  }

  Widget _headerBuilder() {
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
            ? '${distance.toStringAsFixed(1)} m away'
            : '${(distance / 1000).toStringAsFixed(1)} km away';

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
                    Icons.access_time_outlined,
                    size: 14.spMin,
                    color: hasExpired ? AppColors.red : AppColors.grey,
                  ),
                  4.wSizedBox,
                  Text(
                    hasExpired ? 'Expired' : timeago.format(dateTime),
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: hasExpired ? AppColors.red : AppColors.grey,
                    ),
                  ),
                ],
              ),

            if (distanceText != null)
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.spMin,
                    color: AppColors.grey,
                  ),
                  4.wSizedBox,
                  Text(
                    distanceText,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
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
        final callsToAction = ref.watch(
          provider.select(
            (value) => value.hazard!.callsToAction,
          ),
        );
        final callToActionText = callsToAction
            ?.where((s) => s.trim().isNotEmpty)
            .join(' ');

        final text = isUserReported
            ? [
                if (aiSummary?.isNotEmpty ?? false) aiSummary,
                if (callToActionText?.isNotEmpty ?? false) callToActionText!,
              ].join(' ')
            : [
                if (shortDescription.isNotEmpty) shortDescription,
                if (callToActionText?.isNotEmpty ?? false) callToActionText!,
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

  Widget _viewDetailsButtonBuilder() {
    return Button.filled(
      value: 'View Details',
      padding: EdgeInsets.symmetric(
        vertical: 8.spMin,
      ),
      color: AppColors.primary,
      isIconLeft: false,
      valueStyle: TextStyle(
        fontSize: 14.spMin,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14.spMin,
        color: AppColors.white,
      ),
      onPressed: _gotoViewHazard,
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
