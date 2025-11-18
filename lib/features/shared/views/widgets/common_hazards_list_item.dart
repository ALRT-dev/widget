import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/notification/views/widgets/trust_meter.dart';
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
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_medias_carousel.dart';
import 'package:hazard_app/others/app_colors.dart';

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

    return InkWell(
      onTap: widget.isInfoWindow ? null : _gotoViewHazard,
      borderRadius: BorderRadius.circular(12.spMin),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
            width: 2.0,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.spMin),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 8.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showSourceHeader) ...[
              _headerBuilder(),
            ],
            if (widget.hazard.processedMedias.isNotEmpty) ...[
              3.hSizedBox,
              HazardMediasCarousel(
                id: widget.hazard.id!,
                medias: widget.hazard.processedMedias,
              ),
              15.hSizedBox,
            ],
            Row(
              crossAxisAlignment: !widget.isInfoWindow
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                _iconBuilder(),
                12.wSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleBuilder(),
                      4.hSizedBox,
                      _locationBuilder(),
                      if (!widget.isInfoWindow) ...[
                        4.hSizedBox,
                        _shortDescriptionBuilder(),
                      ],
                    ],
                  ),
                ),
              ],
            ).pX(16.0).pT(16.0),
            if (widget.isInfoWindow) ...[
              8.hSizedBox,
              _shortDescriptionBuilder().pX(16.0),
            ],
            16.hSizedBox,
            if (widget.showTrustMeter && widget.hazard.source == null) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.0.spMin,
                  0.0,
                  16.0.spMin,
                  16.0.spMin,
                ),
                child: _trustMeterBuilder(),
              ),
            ],
            if (widget.isInfoWindow) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.0.spMin,
                  0.0,
                  16.0.spMin,
                  16.0.spMin,
                ),
                child: _viewDetailsButtonBuilder(),
              ),
            ],
          ],
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
        final hazardColor = ref.watch(
          provider.select(
            (value) => value.hazard!.color,
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

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: hazardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.spMin),
                  topRight: Radius.circular(10.spMin),
                ),
                border: hazardColor == AppColors.transparent
                    ? Border(
                        bottom: BorderSide(
                          color: AppColors.black,
                          width: 2.0,
                        ),
                      )
                    : null,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.spMin,
                vertical: 8.spMin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        color: AppColors.black,
                        width: 1.6,
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
                    Text(
                      severityTitle,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                        color: hazardColor.isLight
                            ? AppColors.black
                            : AppColors.white,
                      ),
                    ),
                  // Verification Badge
                  if (isVerified)
                    Icon(
                      Icons.verified_rounded,
                      size: 20.spMin,
                      color: hazardColor.isLight
                          ? AppColors.blue
                          : AppColors.white,
                    ),
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

        return Container(
          width: 48.spMin,
          height: 48.spMin,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
              color: AppColors.black,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.spMin),
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
            (value) => value.hazard!.title ?? 'Unknown Hazard',
          ),
        );

        return Text(
          title,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  Widget _locationBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final otherLatitude = ref.watch(
          provider.select(
            (value) => value.hazard!.latitude,
          ),
        );
        final otherLongitude = ref.watch(
          provider.select(
            (value) => value.hazard!.longitude,
          ),
        );
        final locationName = ref.watch(
          provider.select(
            (value) => value.hazard!.locationName?.trim(),
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

        final distanceText = distance < 1000
            ? '${distance.toStringAsFixed(1)} m away'
            : '${(distance / 1000).toStringAsFixed(1)} km away';

        return Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16.spMin,
              color: AppColors.grey,
            ),
            4.wSizedBox,
            Expanded(
              child: Text(
                locationName?.isNotEmpty ?? false
                    ? '$locationName · $distanceText'
                    : distanceText,
                style: TextStyle(
                  fontSize: 12.spMin,
                  color: AppColors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _shortDescriptionBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final shortDescription = ref.watch(
          provider.select(
            (value) => value.hazard!.aiSummary?.trim(),
          ),
        );
        final callToAction = ref.watch(
          provider.select(
            (value) =>
                !value.hazard!.isUserReported &&
                    value.hazard!.severity == HazardSeverity.unknown
                ? null
                : value.hazard!.callToAction?.trim(),
          ),
        );

        final text = [
          if (shortDescription?.isNotEmpty ?? false) shortDescription,
          if (callToAction?.isNotEmpty ?? false) callToAction!,
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

  Widget _trustMeterBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final voteType = ref.watch(
          provider.select((value) => value.hazard!.userVoteType),
        );
        final voteCount = ref.watch(
          provider.select((value) => value.hazard!.voteCount),
        );
        final isExpired = ref.watch(
          provider.select((value) => value.hazard!.isExpired),
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

  Widget _viewDetailsButtonBuilder() {
    return Button.filled(
      value: 'View Details',
      padding: EdgeInsets.symmetric(
        vertical: 12.spMin,
      ),
      isIconLeft: false,
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.spMin,
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
        message: 'Cannot vote on an expired hazard.',
      );
      return;
    }

    ref.read(provider.notifier).voteHazard(voteType: type);
  }
}
