import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/shared/enums/ai_confidence_types.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/enums/video_priority_types.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/date_time_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/video_id_priority_model.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/states/view_hazard_provider_state.dart';
import 'package:hazard_app/features/shared/providers/video_preview_lifecycle_provider.dart';
import 'package:hazard_app/features/shared/providers/view_hazard_provider.dart';
import 'package:hazard_app/features/shared/utils/open_link.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/small_map_view.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_medias_carousel.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'dart:math' as math;

class ViewHazardScreenArgs {
  ViewHazardScreenArgs({required this.hazard});

  /// The hazard to be viewed.
  final Hazard hazard;
}

class ViewHazardScreen extends ConsumerStatefulWidget {
  const ViewHazardScreen({
    super.key,
    required this.args,
  });

  /// The arguments for the screen.
  final ViewHazardScreenArgs args;

  static const route = '/view-hazard';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewHazardScreenState();
}

class _ViewHazardScreenState extends ConsumerState<ViewHazardScreen> {
  late final provider = providerOfViewHazard(widget.args.hazard.id!);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.args.hazard.id == null) {
      throw Exception('Hazard ID is required to view hazard.');
    }

    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));
    _registerVideoPriorityProviders();

    _listenToTheDeleteHazardState();

    final loggedInUserId = ref.watch(
      providerOfLoggedInUser.select((value) => value?.id),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  24.spMin.hSizedBox,

                  // Review feedback section (if applicable)
                  Consumer(
                    builder: (context, ref, child) {
                      final reportedById = ref.watch(
                        provider.select(
                          (value) => value.hazard?.reportedBy?.id,
                        ),
                      );
                      final reviewStatus = ref.watch(
                        provider.select((value) => value.hazard?.reviewStatus),
                      );
                      final reviewFeedback = ref.watch(
                        provider.select(
                          (value) => value.hazard?.reviewFeedback,
                        ),
                      );

                      final isRejectedAndHasFeedback =
                          reportedById == loggedInUserId &&
                          reviewStatus == HazardReviewStatus.rejected &&
                          (reviewFeedback?.isNotEmpty ?? false);

                      if (!isRejectedAndHasFeedback) {
                        return const SizedBox.shrink();
                      }

                      return Column(
                        children: [
                          _buildReviewFeedbackSectionNew(),
                          24.spMin.hSizedBox,
                        ],
                      );
                    },
                  ),

                  // White Content Section
                  _buildWhiteContentSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Consumer(
      builder: (context, ref, child) {
        final hazardColor = ref.watch(
          provider.select(
            (value) => value.hazard?.color == AppColors.transparent
                ? AppColors.white
                : value.hazard?.color,
          ),
        );
        final hasMedia = ref.watch(
          provider.select(
            (value) => value.hazard?.processedMedias.isNotEmpty ?? false,
          ),
        );

        return SliverAppBar(
          expandedHeight: hasMedia ? 400.spMin : 260.spMin,
          floating: false,
          pinned: true,
          backgroundColor: hazardColor,
          foregroundColor: AppColors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 80.spMin,
          leading: Center(
            child: _buildBackButton().pB(7.0),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                color: hazardColor,
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final hazard = ref.watch(
                    provider.select((value) => value.hazard),
                  );
                  if (hazard?.processedMedias.isNotEmpty ?? false) {
                    return HazardMediasCarousel(
                      id: hazard!.id!,
                      medias: hazard.processedMedias,
                      registerVideoLifecycle: false,
                      videoPriority: VideoPriority.level2,
                    );
                  }
                  return _buildHeaderContent();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackButton() {
    return Container(
      margin: EdgeInsets.only(right: 16.spMin, top: 8.spMin),
      child: RoundButton(
        icon: Icon(
          Icons.close,
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
        borderSide: BorderSide(
          color: AppColors.black,
          width: 2,
        ),
        onPressed: () => context.pop(),
      ),
    );
  }

  Widget _buildHeaderContent() {
    return Consumer(
      builder: (context, ref, child) {
        final isUserAlert = ref.watch(
          provider.select(
            (value) => value.hazard?.isUserReported ?? false,
          ),
        );
        final isAwsCompliant = ref.watch(
          provider.select(
            (value) => value.hazard?.isAwsCompliant ?? false,
          ),
        );
        final severity = ref.watch(
          provider.select(
            (value) => value.hazard?.severity,
          ),
        );
        final severityTitle = ref.watch(
          provider.select(
            (value) => value.hazard?.severityTitle,
          ),
        );
        final categoryName = ref.watch(
          provider.select(
            (value) =>
                value.hazard?.category?.parent?.name ??
                value.hazard?.category?.name,
          ),
        );
        final upvoteCount = ref.watch(
          provider.select(
            (value) => value.hazard?.upvoteCount ?? 0,
          ),
        );

        return Column(
          children: [
            Column(
              children: [
                // Top spacing
                110.hSizedBox,

                // Icon - Centered in white circle
                _iconBuilder(),

                20.hSizedBox,

                // Pills Row - Centered
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.spMin,
                  runSpacing: 8.spMin,
                  children: [
                    // Severity Pill (only for AWS compliant alerts)
                    if (isAwsCompliant && severityTitle != null)
                      _buildPill(severityTitle),

                    // Category Pill (Official/AWS/User)
                    _buildPill(
                      _getCategoryLabel(isUserAlert, isAwsCompliant),
                      2,
                    ),

                    // Alert Type
                    if (categoryName != null) _buildPill(categoryName, 2),
                  ],
                ),

                20.hSizedBox,

                // Badges Row - Centered
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Verification Badge
                    if (!isUserAlert)
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Icon(
                          Icons.verified,
                          color: AppColors.blue,
                          size: 24.spMin,
                        ),
                      ),

                    // Upvotes Badge
                    if (isUserAlert)
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(20.spMin),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.spMin,
                          vertical: 6.spMin,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: AppColors.white,
                              size: 16.spMin,
                            ),
                            SizedBox(width: 4.spMin),
                            Text(
                              'x$upvoteCount',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            if (severity == HazardSeverity.unknown && !isUserAlert)
              Divider().pT(11.0),
          ],
        );
      },
    );
  }

  Widget _buildPill(String label, [final int flex = 1]) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.spMin,
        vertical: 6.spMin,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        border: Border.all(
          color: AppColors.black,
          width: 2,
        ),
      ),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.spMin,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _getCategoryLabel(
    final bool isUserReported,
    final bool isAwsCompliant,
  ) {
    if (isUserReported) {
      return 'User';
    }
    if (isAwsCompliant == true) {
      return 'AWS';
    }
    return 'Official';
  }

  Widget _iconBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final iconPath = ref.watch(
          provider.select(
            (value) => value.hazard?.iconPath,
          ),
        );
        if (iconPath == null) {
          return const SizedBox.shrink();
        }

        final fallbackIconPath = ref.watch(
          provider.select(
            (value) => value.hazard?.fallbackIconPath,
          ),
        );
        if (fallbackIconPath == null) {
          return const SizedBox.shrink();
        }

        final fallbackIconPath2 = ref.watch(
          provider.select(
            (value) => value.hazard?.fallbackIconPath2,
          ),
        );
        if (fallbackIconPath2 == null) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 80.spMin,
          width: 80.spMin,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
              color: AppColors.black,
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 25,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.all(12.spMin),
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

  Widget _buildHeaderSection() {
    return Consumer(
      builder: (context, ref, child) {
        final hazard =
            ref.watch(
              provider.select((value) => value.hazard),
            ) ??
            widget.args.hazard;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'hazard_title_${hazard.id}',
              child: Text(
                hazard.title ?? 'Hazard Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.spMin,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWhiteContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map Preview Card
        _buildMapPreviewCard(),
        24.hSizedBox,

        // What We Know Section
        _buildWhatWeKnowSection(),

        // What To Do Section
        _buildWhatToDoSection(),

        // Official Description Section
        _buildOfficialDescriptionSection(),

        // Source Section
        _buildSourceSectionNew(),
        40.hSizedBox,
      ],
    );
  }

  Widget _buildMapPreviewCard() {
    return Consumer(
      builder: (context, ref, child) {
        final latitude = ref.watch(
          provider.select((value) => value.hazard?.latitude),
        );
        final longitude = ref.watch(
          provider.select((value) => value.hazard?.longitude),
        );
        final locationName = ref.watch(
          provider.select((value) => value.hazard?.locationName),
        );
        final occurredAt = ref.watch(
          provider.select((value) => value.hazard?.occurredAt),
        );
        final createdAt = ref.watch(
          provider.select((value) => value.hazard?.createdAt),
        );
        final hazard = ref.watch(
          provider.select((value) => value.hazard),
        );
        final loggedInUser = ref.watch(
          providerOfLoggedInUser.select((value) => value),
        );

        if (latitude == null || longitude == null) {
          return const SizedBox.shrink();
        }

        final distance = loggedInUser?.distanceTo(
          latitude,
          longitude,
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.extraLightGrey.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16.spMin),
            border: Border.all(
              color: AppColors.lightGrey.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(12.spMin),
          child: Column(
            children: [
              // Map placeholder or actual map
              ClipRRect(
                borderRadius: BorderRadius.circular(12.spMin),
                child: Container(
                  height: 220.spMin,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.spMin),
                    color: AppColors.lightGrey.withValues(alpha: 0.3),
                    border: Border.all(
                      color: AppColors.lightGrey.withValues(alpha: 0.7),
                      width: 1.0,
                    ),
                  ),
                  child: SmallMapView(
                    hazard: hazard!,
                    height: 220.0,
                    borderRadius: 11.0,
                  ),
                ),
              ),
              12.spMin.hSizedBox,

              // Address and Time Info
              Column(
                children: [
                  // Address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.spMin,
                      ),
                      8.spMin.wSizedBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (locationName != null) ...[
                              Text(
                                locationName,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.spMin,
                                ),
                              ),
                              4.spMin.hSizedBox,
                              if (distance != null)
                                Text(
                                  '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} from your location',
                                  style: TextStyle(
                                    fontSize: 12.spMin,
                                    color: AppColors.grey,
                                  ),
                                ),
                            ] else ...[
                              if (distance != null)
                                Text(
                                  '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} from your location',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.spMin,
                                  ),
                                ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  12.spMin.hSizedBox,

                  // Time
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16.spMin,
                      ),
                      8.spMin.wSizedBox,
                      Text(
                        (occurredAt ?? createdAt ?? DateTime.now())
                            .formattedWithTime,
                        style: TextStyle(
                          fontSize: 14.spMin,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWhatWeKnowSection() {
    return Consumer(
      builder: (context, ref, child) {
        final aiSummary = ref.watch(
          provider.select((value) => value.hazard?.aiSummary),
        );

        if (aiSummary?.isEmpty ?? true) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.spMin),
            border: Border(
              left: BorderSide(
                color: AppColors.red,
                width: 4,
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.spMin, 16.spMin, 8.spMin, 16.spMin),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What We Know',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.spMin.hSizedBox,
                    Text(
                      aiSummary!,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).pB(24.0);
      },
    );
  }

  Widget _buildWhatToDoSection() {
    return Consumer(
      builder: (context, ref, child) {
        final callToAction = ref.watch(
          provider.select((value) => value.hazard?.callToAction),
        );
        final isUserReported = ref.watch(
          provider.select((value) => value.hazard?.isUserReported),
        );
        final severity = ref.watch(
          provider.select((value) => value.hazard?.severity),
        );

        final shouldShow =
            (isUserReported == true ||
                (severity != null && severity != HazardSeverity.unknown)) &&
            (callToAction?.isNotEmpty ?? false);

        if (!shouldShow) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.red.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12.spMin),
            border: Border(
              left: BorderSide(
                color: AppColors.red,
                width: 4,
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.spMin, 16.spMin, 8.spMin, 16.spMin),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What To Do',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.spMin.hSizedBox,
                    Text(
                      callToAction!,
                      style: TextStyle(
                        color: AppColors.black.withValues(alpha: 0.9),
                        fontSize: 14.spMin,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).pB(24.0);
      },
    );
  }

  Widget _buildOfficialDescriptionSection() {
    return Consumer(
      builder: (context, ref, child) {
        final description = ref.watch(
          provider.select((value) => value.hazard?.description),
        );

        if (description?.isEmpty ?? true) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12.spMin),
            border: Border(
              left: BorderSide(
                color: AppColors.blue,
                width: 4,
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.spMin, 16.spMin, 8.spMin, 16.spMin),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Official Description',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.spMin.hSizedBox,
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).pB(24.0);
      },
    );
  }

  Widget _buildSourceSectionNew() {
    return Consumer(
      builder: (context, ref, child) {
        final source = ref.watch(
          provider.select((value) => value.hazard?.source),
        );
        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard?.isUserReported ?? false,
          ),
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.extraLightGrey.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(12.spMin),
            border: Border.all(
              color: AppColors.lightGrey.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(16.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Source',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.spMin.hSizedBox,

              GestureDetector(
                onTap: source?.url != null
                    ? () => openLink(context: context, link: source!.url!)
                    : null,
                child: Container(
                  padding: EdgeInsets.all(12.spMin),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.spMin),
                    border: Border.all(
                      color: AppColors.lightGrey.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.spMin,
                        height: 40.spMin,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8.spMin),
                        ),
                        child: Icon(
                          isUserReported == true
                              ? Icons.person_outline_rounded
                              : Icons.shield_outlined,
                          size: 20.spMin,
                          color: AppColors.grey,
                        ),
                      ),
                      12.spMin.wSizedBox,

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              source?.name ?? 'Community Report',
                              style: TextStyle(
                                fontSize: 14.spMin,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (isUserReported)
                              Text(
                                'Community',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  color: AppColors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (source?.url != null)
                        Icon(
                          Icons.open_in_new,
                          size: 16.spMin,
                          color: AppColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReviewFeedbackSectionNew() {
    return Consumer(
      builder: (context, ref, child) {
        final reviewFeedback = ref.watch(
          provider.select((value) => value.hazard?.reviewFeedback),
        );
        final reviewStatus = ref.watch(
          provider.select((value) => value.hazard?.reviewStatus),
        );

        if (reviewFeedback?.isEmpty ?? true) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.spMin,
          children: [
            Text(
              'Only visible to you',
              style: TextStyle(
                fontSize: 12.spMin,
                color: AppColors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.spMin),
              decoration: BoxDecoration(
                color: reviewStatus == HazardReviewStatus.accepted
                    ? AppColors.green.withValues(alpha: 0.05)
                    : AppColors.red.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12.spMin),
                border: Border.all(
                  color: reviewStatus == HazardReviewStatus.accepted
                      ? AppColors.green.withValues(alpha: 0.2)
                      : AppColors.red.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.spMin,
                    height: 50.spMin,
                    decoration: BoxDecoration(
                      color: reviewStatus == HazardReviewStatus.accepted
                          ? AppColors.green.withValues(alpha: 0.1)
                          : AppColors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(25.spMin),
                      border: Border.all(
                        color: reviewStatus == HazardReviewStatus.accepted
                            ? AppColors.green.withValues(alpha: 0.3)
                            : AppColors.red.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      reviewStatus == HazardReviewStatus.accepted
                          ? Icons.feedback_outlined
                          : Icons.warning_outlined,
                      color: reviewStatus == HazardReviewStatus.accepted
                          ? AppColors.green
                          : AppColors.red,
                      size: 24.spMin,
                    ),
                  ),
                  16.spMin.wSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reviewer Feedback',
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w600,
                            color: reviewStatus == HazardReviewStatus.accepted
                                ? AppColors.green
                                : AppColors.red,
                          ),
                        ),
                        4.hSizedBox,
                        Text(
                          reviewFeedback!,
                          style: TextStyle(
                            fontSize: 14.spMin,
                            color: AppColors.black,
                            height: 1.4,
                          ),
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

  void _onInit() {
    ref.read(provider.notifier).updateHazard(widget.args.hazard);
  }

  /// Register video priority providers for all video medias.
  void _registerVideoPriorityProviders() {
    final videoMedias = ref.read(
      provider.select(
        (value) =>
            value.hazard?.processedMedias
                .where((media) => media.type == AlrtMediaType.video)
                .toList() ??
            [],
      ),
    );

    for (final videoMedia in videoMedias) {
      ref.watch(
        providerOfVideoPreviewLifecycle(
          VideoIdPriority(
            id: videoMedia.id,
            priority: VideoPriority.level2,
          ),
        ).select((value) => null),
      );
    }
  }

  /// Listen to the delete hazard state and handle success or error.
  void _listenToTheDeleteHazardState() {
    ref.listen(
      provider.select(
        (value) => value.deleteHazardState,
      ),
      (previous, next) {
        if (previous != next) {
          next.maybeWhen(
            success: context.pop,
            error: _handleError,
            orElse: () {},
          );
        }
      },
    );
  }

  /// Handle error by showing a toast message.
  void _handleError(final AppError error) {
    context.showErrorToast(
      message: error.message,
    );
  }
}

class ConfidenceDialPainter extends CustomPainter {
  final AIConfidence confidence;
  final Color backgroundColor;
  final Color activeColor;
  final double animatedPercentage;

  ConfidenceDialPainter({
    required this.confidence,
    required this.backgroundColor,
    required this.activeColor,
    this.animatedPercentage = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 8;
    final strokeWidth = 6.0;

    // Background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Active arc
    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = (animatedPercentage / 100) * 2 * math.pi;
    const startAngle = -math.pi / 2; // Start from top

    if (sweepAngle > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        activePaint,
      );

      // Add a subtle glow effect
      final glowPaint = Paint()
        ..color = activeColor.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth + 2
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        glowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(ConfidenceDialPainter oldDelegate) {
    return oldDelegate.animatedPercentage != animatedPercentage ||
        oldDelegate.confidence != confidence ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
