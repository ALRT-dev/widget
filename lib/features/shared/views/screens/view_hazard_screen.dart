import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/report/views/screens/create_update_report_screen.dart';
import 'package:hazard_app/features/shared/enums/ai_confidence_types.dart';
import 'package:hazard_app/features/shared/enums/alrt_media_types.dart';
import 'package:hazard_app/features/shared/enums/bushfire_alert_level_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/enums/video_priority_types.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
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
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/small_map_view.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_expiry_timer.dart';
import 'package:hazard_app/features/shared/views/widgets/view_hazard_widgets/hazard_medias_carousel.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;
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
                  if (widget.args.hazard.reportedBy?.id == loggedInUserId &&
                      widget.args.hazard.reviewStatus ==
                          HazardReviewStatus.rejected &&
                      (widget.args.hazard.reviewFeedback?.isNotEmpty ??
                          false)) ...[
                    _buildReviewFeedbackSection(),
                    24.spMin.hSizedBox,
                  ],
                  _buildLocationSection(),
                  24.spMin.hSizedBox,
                  if (widget.args.hazard.aiSummary?.isNotEmpty ?? false) ...[
                    _buildAISummarySection(),
                    24.spMin.hSizedBox,
                  ],
                  if (widget.args.hazard.callToAction?.isNotEmpty ?? false) ...[
                    _buildCallToActionSection(),
                    24.spMin.hSizedBox,
                  ],
                  if (!widget.args.hazard.isUserReported &&
                      (widget.args.hazard.description?.isNotEmpty ??
                          false)) ...[
                    _buildDescriptionSection(),
                    24.spMin.hSizedBox,
                  ],
                  if ((widget.args.hazard.bushFireAlertLevel == null ||
                          widget.args.hazard.bushFireAlertLevel ==
                              BushfireAlertLevel.advice) &&
                      widget.args.hazard.severity !=
                          HazardSeverity.unknown) ...[
                    _buildSeveritySection(),
                    24.spMin.hSizedBox,
                  ],
                  if (widget.args.hazard.source != null) ...[
                    _buildSourceSection(),
                    24.spMin.hSizedBox,
                  ],
                  _buildTimestampSection(),
                  32.spMin.hSizedBox,
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
        final hasMedia = ref.watch(
          provider.select(
            (value) => value.hazard?.medias.isNotEmpty ?? false,
          ),
        );
        return SliverAppBar(
          expandedHeight: hasMedia ? 400.spMin : 150.spMin,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          elevation: 0,
          leading: Center(
            child: RoundButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
              ),
              onPressed: () => context.pop(),
            ),
          ).pL(5.0),
          actions: [
            _buildDeleteButton(),
            _buildEditButton(),
            10.wSizedBox,
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    widget.args.hazard.color.withValues(alpha: 0.1),
                    AppColors.white,
                  ],
                ),
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

                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 80.spMin),
                      child: _iconBuilder(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeleteButton() {
    return Consumer(
      builder: (context, ref, child) {
        final loggedInUserId = ref.watch(
          providerOfLoggedInUser.select((value) => value?.id),
        );
        final isOwner = ref.watch(
          provider.select(
            (value) => value.hazard?.reportedBy?.id == loggedInUserId,
          ),
        );
        if (!isOwner) {
          return const SizedBox.shrink();
        }

        return RoundButton(
          icon: Icon(
            Icons.delete_outline_rounded,
          ),
          onPressed: _handleDeletePressed,
        );
      },
    );
  }

  Widget _buildEditButton() {
    return Consumer(
      builder: (context, ref, child) {
        final loggedInUserId = ref.watch(
          providerOfLoggedInUser.select((value) => value?.id),
        );
        final isOwner = ref.watch(
          provider.select(
            (value) => value.hazard?.reportedBy?.id == loggedInUserId,
          ),
        );

        if (!isOwner) {
          return const SizedBox.shrink();
        }

        return RoundButton(
          icon: Icon(
            Icons.edit_rounded,
          ),
          onPressed: _handleEditPressed,
        ).pL(10.0);
      },
    );
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 25,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Image.asset(
            iconPath,
            width: 80.spMin,
            height: 80.spMin,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              fallbackIconPath,
              width: 80.spMin,
              height: 80.spMin,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                fallbackIconPath2,
                width: 80.spMin,
                height: 80.spMin,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getSeverityIcon(HazardSeverity severity) {
    switch (severity) {
      case HazardSeverity.unknown:
        return Icons.help_outline;
      case HazardSeverity.info:
        return Icons.info_outline;
      case HazardSeverity.advice:
        return Icons.lightbulb_outline;
      case HazardSeverity.watchAndAct:
        return Icons.warning_amber_outlined;
      case HazardSeverity.emergency:
        return Icons.emergency;
    }
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'hazard_title_${widget.args.hazard.id}',
          child: Text(
            widget.args.hazard.title ?? 'Hazard Report',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.spMin,
            ),
          ),
        ),
        8.spMin.hSizedBox,
        Row(
          children: [
            _buildSource(),
            if ((widget.args.hazard.category?.parent ??
                    widget.args.hazard.category) !=
                null) ...[
              8.spMin.wSizedBox,
              _buildCategory(),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildSource() {
    final source = widget.args.hazard.source;
    final reportedBy = widget.args.hazard.reportedBy;
    final color = source != null
        ? AppColors.blue
        : (reportedBy?.reportsStatus.color == AppColors.lightGrey
                  ? AppColors.grey
                  : reportedBy?.reportsStatus.color) ??
              AppColors.grey;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.spMin,
        vertical: 6.spMin,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.spMin),
      ),
      child: Text(
        source != null ? 'Official' : 'Crowd Sourced',
        style: TextStyle(
          fontSize: 12.spMin,
          fontWeight: FontWeight.w500,
          color: color.isLight ? AppColors.black : AppColors.white,
        ),
      ),
    );
  }

  Widget _buildCategory() {
    final category =
        widget.args.hazard.category?.parent ?? widget.args.hazard.category;
    final color = category?.color ?? widget.args.hazard.color;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.spMin),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 6.spMin,
            horizontal: 12.spMin,
          ),
          child: Text(
            category!.name!,
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w500,
              color: color.isLight ? AppColors.black : AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    if (widget.args.hazard.latitude == null ||
        widget.args.hazard.longitude == null) {
      return const SizedBox.shrink();
    }

    return _buildSection(
      title: 'Location',
      icon: Icons.location_on_outlined,
      child: Column(
        children: [
          if (widget.args.hazard.latitude != null &&
              widget.args.hazard.longitude != null) ...[
            SmallMapView(
              hazard: widget.args.hazard,
              height: 200,
              borderRadius: 12,
            ),
            10.hSizedBox,
          ],
          Container(
            padding: EdgeInsets.all(16.spMin),
            decoration: BoxDecoration(
              color: AppColors.extraLightGrey,
              borderRadius: BorderRadius.circular(12.spMin),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.red,
                  size: 20.spMin,
                ),
                12.spMin.wSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.args.hazard.locationName != null
                            ? 'Address'
                            : 'Coordinates',
                        style: TextStyle(
                          fontSize: 12.spMin,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.spMin.hSizedBox,
                      Text(
                        widget.args.hazard.locationName ??
                            '${widget.args.hazard.latitude!.toStringAsFixed(6)}, ${widget.args.hazard.longitude!.toStringAsFixed(6)}',
                        style: TextStyle(
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    final description =
        widget.args.hazard.description ?? widget.args.hazard.shortDescription;

    if (description == null || description.isEmpty) {
      return const SizedBox.shrink();
    }

    return _buildSection(
      title: 'Full Description',
      icon: Icons.description_outlined,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.extraLightGrey,
          borderRadius: BorderRadius.circular(12.spMin),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16.spMin,
                  height: 1.5,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeveritySection() {
    final severity = widget.args.hazard.severity;
    if (severity == null || severity == HazardSeverity.unknown) {
      return const SizedBox.shrink();
    }

    final hazardColor = widget.args.hazard.color;
    final severityTitle = widget.args.hazard.severityTitle;

    return _buildSection(
      title: 'Severity Level',
      icon: Icons.priority_high_outlined,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: hazardColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.spMin),
          border: Border.all(
            color: hazardColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              _getSeverityIcon(severity),
              color: hazardColor,
              size: 24.spMin,
            ),
            12.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    severityTitle,
                    style: TextStyle(
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.bold,
                      color: hazardColor,
                    ),
                  ),
                  4.spMin.hSizedBox,
                  Text(
                    _getSeverityDescription(severity),
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSeverityDescription(HazardSeverity severity) {
    switch (severity) {
      case HazardSeverity.unknown:
        return 'Severity level is unknown';
      case HazardSeverity.info:
        return 'General information about potential hazards';
      case HazardSeverity.advice:
        return 'Take necessary precautions and stay safe';
      case HazardSeverity.watchAndAct:
        return 'Conditions are changing, stay alert';
      case HazardSeverity.emergency:
        return 'Immediate action required for safety';
    }
  }

  Widget _buildSourceSection() {
    final source = widget.args.hazard.source;
    if (source == null) return const SizedBox.shrink();

    return _buildSection(
      title: 'Source',
      icon: Icons.source_outlined,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.extraLightGrey,
          borderRadius: BorderRadius.circular(12.spMin),
        ),
        child: Column(
          children: [
            if (source.name != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.label_outline,
                    color: AppColors.grey,
                    size: 20.spMin,
                  ),
                  12.spMin.wSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Source Name',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.spMin.hSizedBox,
                        Text(
                          source.name!,
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (source.url != null) 16.spMin.hSizedBox,
            ],
            if (source.url != null)
              Row(
                children: [
                  Icon(
                    Icons.link_outlined,
                    color: AppColors.blue,
                    size: 20.spMin,
                  ),
                  12.spMin.wSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Source URL',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.spMin.hSizedBox,
                        GestureDetector(
                          onTap: () => openLink(
                            context: context,
                            link: source.url!,
                          ),
                          child: Text(
                            source.url!,
                            style: TextStyle(
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.blue,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimestampSection() {
    return _buildSection(
      title: 'Timeline',
      icon: Icons.schedule_outlined,
      child: Column(
        children: [
          if (widget.args.hazard.occurredAt != null) ...[
            _buildTimestampRow(
              label: 'Occurred',
              dateTime: widget.args.hazard.occurredAt!,
              icon: Icons.event_outlined,
            ),
            12.hSizedBox,
          ],
          if (widget.args.hazard.createdAt != null) ...[
            _buildTimestampRow(
              label: 'Posted',
              dateTime: widget.args.hazard.createdAt!,
              icon: Icons.post_add_outlined,
            ),
            12.spMin.hSizedBox,
          ],
          if (widget.args.hazard.updatedAt != null &&
              widget.args.hazard.updatedAt != widget.args.hazard.createdAt) ...[
            _buildTimestampRow(
              label: 'Updated',
              dateTime: widget.args.hazard.updatedAt!,
              icon: Icons.update_outlined,
            ),
            12.spMin.hSizedBox,
          ],
          if (widget.args.hazard.expiresAt != null) ...[
            _buildTimestampRow(
              label: 'Expires',
              dateTime: widget.args.hazard.expiresAt!,
              dateTimeWidget: HazardExpiryTimer(
                expiryDateTime: widget.args.hazard.expiresAt!,
              ),
              icon: Icons.timer_outlined,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimestampRow({
    required final String label,
    required final IconData icon,
    required final DateTime dateTime,
    final Widget? dateTimeWidget,
  }) {
    return Container(
      padding: EdgeInsets.all(12.spMin),
      decoration: BoxDecoration(
        color: AppColors.extraLightGrey,
        borderRadius: BorderRadius.circular(8.spMin),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18.spMin,
            color: AppColors.grey,
          ),
          12.spMin.wSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.spMin,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.spMin.hSizedBox,
                dateTimeWidget ??
                    Text(
                      timeago.format(dateTime),
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAISummarySection() {
    return _buildSection(
      title: 'What We Know',
      icon: Icons.lightbulb_outline_rounded,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.blue.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.spMin),
          border: Border.all(
            color: AppColors.blue.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lightbulb,
              color: AppColors.blue,
              size: 20.spMin,
            ),
            12.spMin.wSizedBox,
            Expanded(
              child: Text(
                widget.args.hazard.aiSummary!,
                style: TextStyle(
                  fontSize: 14.spMin,
                  height: 1.5,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToActionSection() {
    return _buildSection(
      title: 'What To Do',
      icon: Icons.lightbulb_outline_rounded,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.orange.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.spMin),
          border: Border.all(
            color: AppColors.orange.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lightbulb,
              color: AppColors.orange,
              size: 20.spMin,
            ),
            12.spMin.wSizedBox,
            Expanded(
              child: Text(
                widget.args.hazard.callToAction!,
                style: TextStyle(
                  fontSize: 14.spMin,
                  height: 1.5,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildAIAnalysisSection() {
    return _buildSection(
      title: 'AI Analysis',
      icon: Icons.psychology_outlined,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.green.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.spMin),
          border: Border.all(
            color: AppColors.green.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildConfidenceDial(widget.args.hazard.aiConfidence!),
            16.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Confidence Level',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                  4.spMin.hSizedBox,
                  Text(
                    _getConfidenceTitle(widget.args.hazard.aiConfidence!),
                    style: TextStyle(
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  4.spMin.hSizedBox,
                  Text(
                    _getConfidenceDescription(
                      widget.args.hazard.aiConfidence!,
                    ),
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewFeedbackSection() {
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
            color:
                widget.args.hazard.reviewStatus == HazardReviewStatus.accepted
                ? AppColors.green.withValues(alpha: 0.05)
                : AppColors.red.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12.spMin),
            border: Border.all(
              color:
                  widget.args.hazard.reviewStatus == HazardReviewStatus.accepted
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
                  color:
                      widget.args.hazard.reviewStatus ==
                          HazardReviewStatus.accepted
                      ? AppColors.green.withValues(alpha: 0.1)
                      : AppColors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25.spMin),
                  border: Border.all(
                    color:
                        widget.args.hazard.reviewStatus ==
                            HazardReviewStatus.accepted
                        ? AppColors.green.withValues(alpha: 0.3)
                        : AppColors.red.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  widget.args.hazard.reviewStatus == HazardReviewStatus.accepted
                      ? Icons.feedback_outlined
                      : Icons.warning_outlined,
                  color:
                      widget.args.hazard.reviewStatus ==
                          HazardReviewStatus.accepted
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
                        color:
                            widget.args.hazard.reviewStatus ==
                                HazardReviewStatus.accepted
                            ? AppColors.green
                            : AppColors.red,
                      ),
                    ),
                    4.hSizedBox,
                    Text(
                      widget.args.hazard.reviewFeedback!,
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
  }

  Widget _buildConfidenceDial(AIConfidence confidence) {
    return SizedBox(
      width: 80.spMin,
      height: 80.spMin,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeOutCubic,
        tween: Tween<double>(
          begin: 0.0,
          end: _getConfidencePercentage(confidence).toDouble(),
        ),
        builder: (context, value, child) {
          return CustomPaint(
            painter: ConfidenceDialPainter(
              confidence: confidence,
              backgroundColor: AppColors.extraLightGrey,
              activeColor: _getConfidenceColor(confidence),
              animatedPercentage: value,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<int>(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeOutCubic,
                    tween: IntTween(
                      begin: 0,
                      end: _getConfidencePercentage(confidence),
                    ),
                    builder: (context, animatedValue, child) {
                      return Text(
                        '$animatedValue%',
                        style: TextStyle(
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.bold,
                          color: _getConfidenceColor(confidence),
                        ),
                      );
                    },
                  ),
                  Text(
                    _getConfidenceLabel(confidence),
                    style: TextStyle(
                      fontSize: 10.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getConfidenceColor(AIConfidence confidence) {
    switch (confidence) {
      case AIConfidence.low:
        return AppColors.red;
      case AIConfidence.medium:
        return AppColors.orange;
      case AIConfidence.high:
        return AppColors.green;
    }
  }

  int _getConfidencePercentage(AIConfidence confidence) {
    switch (confidence) {
      case AIConfidence.low:
        return 35;
      case AIConfidence.medium:
        return 70;
      case AIConfidence.high:
        return 95;
    }
  }

  String _getConfidenceLabel(AIConfidence confidence) {
    switch (confidence) {
      case AIConfidence.low:
        return 'LOW';
      case AIConfidence.medium:
        return 'MED';
      case AIConfidence.high:
        return 'HIGH';
    }
  }

  String _getConfidenceTitle(AIConfidence confidence) {
    switch (confidence) {
      case AIConfidence.low:
        return 'Low Confidence';
      case AIConfidence.medium:
        return 'Medium Confidence';
      case AIConfidence.high:
        return 'High Confidence';
    }
  }

  String _getConfidenceDescription(AIConfidence confidence) {
    switch (confidence) {
      case AIConfidence.low:
        return 'AI has limited certainty about this analysis. Manual verification recommended.';
      case AIConfidence.medium:
        return 'AI has moderate certainty about this analysis. Consider additional verification.';
      case AIConfidence.high:
        return 'AI has high certainty about this analysis. Results are reliable.';
    }
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20.spMin,
              color: AppColors.grey,
            ),
            8.spMin.wSizedBox,
            Text(
              title,
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        12.spMin.hSizedBox,
        child,
      ],
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

  /// Handle delete button pressed.
  void _handleDeletePressed() {
    showConfirmationSheet(
      context: context,
      title: 'Delete Alrt',
      description:
          'Are you sure you want to delete this alrt report? This action cannot be undone.',
      confirmButtonText: 'Delete',
      onPressedConfirmAsync: (context, ref) =>
          ref.read(provider.notifier).deleteHazard(),
    );
  }

  /// Handle edit button pressed.
  void _handleEditPressed() {
    final isExpired = ref.read(
      provider.select(
        (value) => value.hazard?.isExpired == true,
      ),
    );
    if (isExpired) {
      context.showErrorToast(
        message: 'Cannot edit an expired hazard report.',
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
