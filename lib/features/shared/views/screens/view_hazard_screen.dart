import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/family/views/widgets/family_safe_strip.dart';
import 'package:hazard_app/features/learn/views/widgets/guide_strip_card.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/report/views/screens/create_update_report_screen.dart';
import 'package:hazard_app/features/shared/enums/ai_confidence_types.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/enums/video_priority_types.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
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
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/features/shared/utils/open_link.dart';
import 'package:hazard_app/features/shared/utils/share_alert.dart';
import 'package:hazard_app/features/shared/views/widgets/small_map_view.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_medias_carousel.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'dart:math' as math;

import 'package:lucide_icons_flutter/lucide_icons.dart';

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
    final hasHazard = ref.watch(
      provider.select(
        (value) => value.hazard != null,
      ),
    );
    if (!hasHazard) {
      return const SizedBox.shrink();
    }

    // register this provider to the lifecycle of this widget
    ref.watch(provider.select((value) => null));
    _registerVideoPriorityProviders();

    _listenToTheDeleteHazardState();

    final loggedInUserId = ref.watch(
      providerOfLoggedInUser.select((value) => value?.id),
    );

    final isMyReport = ref.watch(
      provider.select(
        (value) => value.hazard?.reportedBy?.id == loggedInUserId,
      ),
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
                  if (isMyReport) ...[
                    _buildEditDeleteRow(),
                    16.hSizedBox,
                  ],
                  _buildHeaderV2(),
                  16.hSizedBox,

                  // Review feedback section (if applicable)
                  Consumer(
                    builder: (context, ref, child) {
                      final reportedById = ref.watch(
                        provider.select(
                          (value) => value.hazard?.reportedBy?.id,
                        ),
                      );
                      final reviewFeedback = ref.watch(
                        provider.select(
                          (value) => value.hazard?.reviewFeedback,
                        ),
                      );

                      final hasFeedback =
                          reportedById == loggedInUserId &&
                          (reviewFeedback?.isNotEmpty ?? false);

                      if (!hasFeedback) {
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

    return SliverAppBar(
      pinned: true,
      backgroundColor: hazardColor == AppColors.transparent
          ? AppColors.white
          : hazardColor,
      foregroundColor: AppColors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 80.spMin,
      title: Row(
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
          Spacer(),
          _buildShareButton(
            backgroundColor: pillBackgroundColor,
            backgroundColorAlpha: pillBackgroundColorAlpha,
            foregroundColor: pillForegroundColor,
            borderColor: pillBorderColor,
          ),
          _buildBackButton(
            backgroundColor: pillBackgroundColor,
            backgroundColorAlpha: pillBackgroundColorAlpha,
            foregroundColor: pillForegroundColor,
            borderColor: pillBorderColor,
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton({
    required final Color backgroundColor,
    required final Color foregroundColor,
    required final double backgroundColorAlpha,
    required final Color? borderColor,
  }) {
    final hazard = ref.watch(provider.select((value) => value.hazard));
    if (hazard == null || !isAlertShareable(hazard)) {
      return const SizedBox.shrink();
    }

    return Container(
      width: 35.spMin,
      height: 35.spMin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor.withValues(alpha: backgroundColorAlpha),
        border: Border.all(
          color: borderColor ?? AppColors.transparent,
          width: 1,
        ),
      ),
      child: Icon(
        LucideIcons.share,
        color: foregroundColor,
        size: 18.spMin,
      ),
    ).onPressed(() => shareAlert(hazard: hazard, from: 'detail'));
  }

  Widget _buildBackButton({
    required final Color backgroundColor,
    required final Color foregroundColor,
    required final double backgroundColorAlpha,
    required final Color? borderColor,
  }) {
    return Container(
      width: 35.spMin,
      height: 35.spMin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor.withValues(alpha: backgroundColorAlpha),
        border: Border.all(
          color: borderColor ?? AppColors.transparent,
          width: 1,
        ),
      ),
      child: Icon(
        LucideIcons.x500,
        color: foregroundColor,
        size: 22.spMin,
      ),
    ).onPressed(() => context.pop());
  }

  Widget _buildEditDeleteRow() {
    return Row(
      spacing: 12.spMin,
      children: [
        Expanded(child: _buildEditButton()),
        Expanded(child: _buildDeleteButton()),
      ],
    );
  }

  Widget _buildEditButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isExpired = ref.watch(
          provider.select(
            (value) => value.hazard?.isExpired ?? false,
          ),
        );
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.spMin),
          child: Icon(
            LucideIcons.pencil,
            color: isExpired
                ? AppColors.grey.withValues(alpha: 0.5)
                : AppColors.black,
            size: 20.spMin,
          ),
        ).onPressed(() => _handleEditHazard());
      },
    );
  }

  Widget _buildDeleteButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.spMin),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColorLight,
            blurRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.spMin),
      child: Icon(
        LucideIcons.trash2,
        color: AppColors.red,
        size: 20.spMin,
      ),
    ).onPressed(() => _handleDeleteHazard());
  }

  Widget _buildHeaderV2() {
    return Consumer(
      builder: (context, ref, child) {
        final title = ref.watch(
          provider.select(
            (value) => value.hazard?.isUserReported ?? false
                ? value.hazard?.category?.name ?? 'Alert Report'
                : value.hazard?.title ?? 'Alert',
          ),
        );
        final categoryId = ref.watch(
          provider.select(
            (value) => value.hazard?.category?.id,
          ),
        );
        final categoryName = ref.watch(
          provider.select(
            (value) =>
                value.hazard?.category?.parent?.name ??
                value.hazard?.category?.name ??
                'Other',
          ),
        );
        final categoryColor = ref.watch(
          provider.select(
            (value) =>
                value.hazard?.category?.effectiveColor ?? AppColors.black,
          ),
        );
        final darkenCategoryColor = categoryId == 'utilitiesAndInfrastructure'
            ? categoryColor.darken(0.3)
            : categoryColor.darken(0.2);

        final latitude = ref.watch(
          provider.select((value) => value.hazard?.latitude),
        );
        final longitude = ref.watch(
          provider.select((value) => value.hazard?.longitude),
        );
        final distance = latitude == null || longitude == null
            ? null
            : ref.watch(
                providerOfLocation.select(
                  (value) => value.distanceTo(latitude, longitude),
                ),
              );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.spMin),
          child: Column(
            children: [
              Row(
                spacing: 12.spMin,
                children: [
                  _buildIcon(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6.spMin,
                      children: [
                        // Title of the hazard
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.spMin,
                          ),
                        ),

                        // Category Pill
                      ],
                    ),
                  ),
                ],
              ),
              10.hSizedBox,
              Row(
                spacing: 10.spMin,
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
                  if (distance != null)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.extraLightGrey,
                        border: Border.all(
                          color: AppColors.grey.withValues(alpha: 0.5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.spMin),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.spMin,
                        vertical: 6.spMin,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.mapPin,
                            size: 14.spMin,
                            color: AppColors.grey.withValues(alpha: 0.8),
                          ),
                          4.wSizedBox,
                          Text(
                            '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} away',
                            style: TextStyle(
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              _buildAwsAlertLevel(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon() {
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

        return SizedBox(
          height: 70.spMin,
          width: 70.spMin,
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

  Widget _buildAwsAlertLevel() {
    return Consumer(
      builder: (context, ref, child) {
        final isAwsCompliant = ref.watch(
          provider.select(
            (value) => value.hazard?.isAwsCompliant ?? false,
          ),
        );
        if (!isAwsCompliant) return const SizedBox.shrink();

        final alrtLevelTitle = ref.watch(
          provider.select(
            (value) => value.hazard?.severity?.titleAws,
          ),
        );

        if (alrtLevelTitle == null) {
          return const SizedBox.shrink();
        }

        return Row(
          children: [
            Text(
              'Alert Level: ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.spMin,
              ),
            ),
            Text(
              alrtLevelTitle,
              style: TextStyle(
                fontSize: 16.spMin,
              ),
            ),
          ],
        ).pT(16.0);
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
        horizontal: 12.spMin,
        vertical: 5.spMin,
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
              fontSize: 13.spMin,
              fontWeight: FontWeight.w700,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map Preview Card
        _buildMapPreviewCard(),
        16.hSizedBox,

        // What We Know Section
        _buildWhatWeKnowSection(),

        // What To Do Section
        _buildWhatToDoSection(),

        // Official Description Section
        // _buildOfficialDescriptionSection(),

        // Medias Section
        _buildMediasSection(),

        // Source Section
        _buildSourceSection(),
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
        final createdAt = ref.watch(
          provider.select(
            (value) => value.hazard?.createdAt,
          ),
        );
        final updatedAt = ref.watch(
          provider.select((value) => value.hazard?.updatedAt),
        );
        final hazard = ref.watch(
          provider.select((value) => value.hazard),
        );

        if (latitude == null || longitude == null) {
          return const SizedBox.shrink();
        }

        final distance = ref.watch(
          providerOfLocation.select(
            (value) => value.distanceTo(
              latitude,
              longitude,
            ),
          ),
        );

        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard?.isUserReported ?? false,
          ),
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            border: Border.all(
              color: AppColors.lightGrey.withValues(alpha: 0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.spMin),
            child: Column(
              children: [
                // Map placeholder or actual map
                Container(
                  height: 220.spMin,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.spMin),
                    color: AppColors.extraLightGrey,
                  ),
                  child: SmallMapView(
                    hazard: hazard!,
                    height: 220.0,
                  ),
                ),

                // Address and Time Info
                Column(
                  children: [
                    // Address
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          LucideIcons.mapPin,
                          size: 14.spMin,
                          color: AppColors.grey.withValues(alpha: 0.8),
                        ).pT(1.0),
                        8.spMin.wSizedBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey.withValues(alpha: 0.7),
                                  fontSize: 12.spMin,
                                ),
                              ),
                              4.spMin.hSizedBox,
                              if (locationName != null) ...[
                                Text(
                                  locationName,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                2.spMin.hSizedBox,
                                if (!isUserReported)
                                  Text(
                                    '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} from your location',
                                    style: TextStyle(
                                      fontSize: 12.spMin,
                                      color: AppColors.grey.withValues(
                                        alpha: 0.9,
                                      ),
                                    ),
                                  ),
                              ] else ...[
                                if (!isUserReported)
                                  Text(
                                    '${(distance < 1000 ? '${distance.toStringAsFixed(1)} m' : '${(distance / 1000).toStringAsFixed(1)} km')} from your location',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.spMin,
                                    ),
                                  ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),

                    Divider(
                      color: AppColors.extraLightGrey,
                      height: 30.spMin,
                    ),

                    // Time
                    if (createdAt != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            LucideIcons.clock,
                            size: 14.spMin,
                            color: AppColors.grey.withValues(alpha: 0.7),
                          ).pT(1.0),
                          8.spMin.wSizedBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Posted'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey.withValues(alpha: 0.7),
                                  fontSize: 12.spMin,
                                ),
                              ),
                              4.spMin.hSizedBox,
                              Text(
                                createdAt.timeAgo,
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              2.spMin.hSizedBox,
                              if (updatedAt != null)
                                Text(
                                  'Updated ${updatedAt.timeAgo}',
                                  style: TextStyle(
                                    fontSize: 12.spMin,
                                    color: AppColors.grey.withValues(
                                      alpha: 0.9,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ).pad(16.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMediasSection() {
    return Consumer(
      builder: (context, ref, child) {
        final hazardId = ref.watch(
          provider.select((value) => value.hazard?.id),
        );
        final processedMedias = ref.watch(
          provider.select((value) => value.hazard?.processedMedias ?? []),
        );

        if (processedMedias.isEmpty || hazardId == null) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uploaded Medias',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
            12.spMin.hSizedBox,
            HazardMediasCarousel(
              id: hazardId,
              medias: processedMedias,
              videoPriority: VideoPriority.level1,
              registerVideoLifecycle: true,
            ),
            16.hSizedBox,
          ],
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
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.yellow.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16.spMin),
              border: Border(
                left: BorderSide(
                  color: AppColors.yellow,
                  width: 4,
                ),
                right: BorderSide(
                  color: AppColors.yellow,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: AppColors.yellow,
                  width: 1,
                ),
                top: BorderSide(
                  color: AppColors.yellow,
                  width: 1,
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
          ),
        ).pB(16.0);
      },
    );
  }

  Widget _buildWhatToDoSection() {
    return Consumer(
      builder: (context, ref, child) {
        final callsToAction = ref.watch(
          provider.select((value) => value.hazard?.callsToAction),
        );

        final shouldShow = (callsToAction?.isNotEmpty ?? false);

        if (!shouldShow) return const SizedBox.shrink();

        final color = AppColors.orange200;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16.spMin),
              border: Border(
                left: BorderSide(
                  color: color,
                  width: 4,
                ),
                right: BorderSide(
                  color: color,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: color,
                  width: 1,
                ),
                top: BorderSide(
                  color: color,
                  width: 1,
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
                      ...callsToAction!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final action = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index < callsToAction.length - 1
                                ? 8.spMin
                                : 0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(
                                  color: AppColors.black.withValues(alpha: 0.9),
                                  fontSize: 14.spMin,
                                  height: 1.5,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  action,
                                  style: TextStyle(
                                    color: AppColors.black.withValues(
                                      alpha: 0.9,
                                    ),
                                    fontSize: 14.spMin,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      // Deep link into the matching safety guide, if any.
                      Consumer(
                        builder: (context, ref, child) {
                          final categoryId = ref.watch(
                            provider.select(
                              (value) => value.hazard?.category?.id,
                            ),
                          );
                          return GuideStripCard(categoryId: categoryId);
                        },
                      ),
                      // One-tap "I'm safe" for family circle members.
                      Consumer(
                        builder: (context, ref, child) {
                          final hazard = ref.watch(
                            provider.select((value) => value.hazard),
                          );
                          if (hazard == null) return const SizedBox.shrink();
                          return FamilySafeStrip(hazard: hazard);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).pB(16.0);
      },
    );
  }

  // ignore: unused_element
  Widget _buildOfficialDescriptionSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isUserReported = ref.watch(
          provider.select(
            (value) => value.hazard?.isUserReported ?? false,
          ),
        );
        if (isUserReported) return const SizedBox.shrink();

        final description = ref.watch(
          provider.select((value) => value.hazard?.description),
        );

        if (description?.isEmpty ?? true) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16.spMin),
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

  Widget _buildSourceSection() {
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
        final sourceLink = ref.watch(
          provider.select(
            (value) => value.hazard?.link ?? value.hazard?.source?.url,
          ),
        );
        final copyrightText = ref.watch(
          provider.select(
            (value) => value.hazard?.source?.copyrightText,
          ),
        );
        final advisoryText = ref.watch(
          provider.select(
            (value) => value.hazard?.source?.advisoryText,
          ),
        );

        final license = ref.watch(
          provider.select(
            (value) => value.hazard?.source?.license,
          ),
        );

        final copyrightLink = ref.watch(
          provider.select(
            (value) => value.hazard?.source?.copyrightLink,
          ),
        );

        final color = const Color(0xFF37CAFF);

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(16.spMin),
              border: Border(
                left: BorderSide(
                  color: color,
                  width: 4,
                ),
                right: BorderSide(
                  color: color,
                  width: 1,
                ),
                bottom: BorderSide(
                  color: color,
                  width: 1,
                ),
                top: BorderSide(
                  color: color,
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.all(16.spMin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Attribution Title
                Text(
                  'DATA ATTRIBUTION',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.spMin,
                  ),
                ),
                12.spMin.hSizedBox,

                // Source Row
                GestureDetector(
                  onTap: sourceLink != null
                      ? () => openLink(
                          context: context,
                          link: sourceLink,
                        )
                      : null,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 12.spMin),
                    decoration: BoxDecoration(
                      border:
                          isUserReported ||
                              (license == null &&
                                  (advisoryText?.isEmpty ?? true))
                          ? null
                          : Border(
                              bottom: BorderSide(
                                color: AppColors.lightGrey,
                                width: 1,
                              ),
                            ),
                    ),
                    child: Row(
                      children: [
                        // Source Icon
                        Container(
                          width: 40.spMin,
                          height: 40.spMin,
                          decoration: BoxDecoration(
                            color: AppColors.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.spMin),
                          ),
                          child: Center(
                            child: isUserReported == true
                                ? Icon(
                                    Icons.person_outline_rounded,
                                    size: 24.spMin,
                                    color: AppColors.blue,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/shield.svg',
                                    width: 24.spMin,
                                    height: 24.spMin,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.blue,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                          ),
                        ),
                        12.spMin.wSizedBox,

                        // Source Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                source?.name ?? 'Community Report',
                                style: TextStyle(
                                  fontSize: 15.spMin,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              2.spMin.hSizedBox,
                              Text(
                                isUserReported
                                    ? 'Community'
                                    : 'Official Source',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // External Link Icon
                        if (sourceLink != null)
                          Container(
                            width: 32.spMin,
                            height: 32.spMin,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8.spMin),
                            ),
                            child: Icon(
                              Icons.open_in_new,
                              size: 16.spMin,
                              color: AppColors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // License Row (only for non-user-reported)
                if (!isUserReported) ...[
                  if (license != null) ...[
                    12.spMin.hSizedBox,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.spMin,
                        vertical: 10.spMin,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8.spMin),
                      ),
                      child: Row(
                        children: [
                          // License Badge
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.spMin,
                              vertical: 4.spMin,
                            ),
                            decoration: BoxDecoration(
                              color: license.backgroundColor,
                              borderRadius: BorderRadius.circular(4.spMin),
                            ),
                            child: Text(
                              license.badgeText,
                              style: TextStyle(
                                fontSize: 11.spMin,
                                fontWeight: FontWeight.w600,
                                color: license.foregroundColor,
                              ),
                            ),
                          ),
                          10.spMin.wSizedBox,

                          // License Text
                          Expanded(
                            child: Text(
                              license.licenseText,
                              style: TextStyle(
                                fontSize: 12.spMin,
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // View Link
                          if (copyrightLink != null || license.link != null)
                            GestureDetector(
                              onTap: () => openLink(
                                context: context,
                                link: copyrightLink ?? license.link!,
                              ),
                              child: Text(
                                'View',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],

                  // Advisory Text
                  if (advisoryText?.isNotEmpty ?? false) ...[
                    10.hSizedBox,
                    Text(
                      advisoryText!,
                      style: TextStyle(
                        fontSize: 11.spMin,
                        color: AppColors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],

                  // Copyright Notice
                  if (copyrightText?.isNotEmpty ?? false) ...[
                    10.hSizedBox,
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 11.spMin,
                          color: AppColors.grey,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: copyrightText,
                          ),
                          if (license?.link?.isNotEmpty ?? false) ...[
                            TextSpan(
                              text: ' Used under ',
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () => openLink(
                                  context: context,
                                  link: license.link!,
                                ),
                                child: Text(
                                  license!.badgeText,
                                  style: TextStyle(
                                    fontSize: 11.spMin,
                                    color: AppColors.blue,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(text: ' license.'),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ],
            ),
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
            priority: VideoPriority.level1,
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

  /// Handle edit hazard action.
  void _handleEditHazard() {
    final isExpired = ref.read(
      provider.select(
        (value) => value.hazard?.isExpired == true,
      ),
    );
    if (isExpired) {
      context.showErrorToast(
        message:
            'Cannot edit an expired alert. You can delete this and create a new one.',
      );
      return;
    }

    context.push(
      CreateUpdateReportScreen.updateRoute,
      extra: CreateUpdateReportScreenArgs(
        hazardToUpdate: widget.args.hazard,
      ),
    );
  }

  /// Handle delete hazard action.
  void _handleDeleteHazard() {
    showConfirmationSheet(
      context: context,
      title: 'Delete Report',
      description:
          'Are you sure you want to delete this report? This action cannot be undone.',
      onPressedConfirmAsync: (context, ref) =>
          ref.read(provider.notifier).deleteHazard(),
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
