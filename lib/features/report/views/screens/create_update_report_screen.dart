import 'dart:math';

import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/views/screens/select_location_screen.dart';
import 'package:hazard_app/features/profile/views/screens/my_hazards_screen.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_categories_list.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_medias_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/media_service.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/dotted_border_container.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:hazard_app/others/app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CreateUpdateReportScreenArgs {
  CreateUpdateReportScreenArgs({this.hazardToUpdate});

  /// The hazard to update, if any.
  /// If null, a new hazard report will be created.
  final Hazard? hazardToUpdate;
}

class CreateUpdateReportScreen extends ConsumerStatefulWidget {
  /// Displays the screen for creating or updating a hazard report.
  const CreateUpdateReportScreen({
    super.key,
    this.args,
  });

  /// The arguments for the screen.
  final CreateUpdateReportScreenArgs? args;

  static const createRoute = '/report/create';
  static const updateRoute = '/report/update';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateUpdateReportScreenState();
}

class _CreateUpdateReportScreenState
    extends ConsumerState<CreateUpdateReportScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  MediaService get _mediaService => ref.read(providerOfMediaService);

  @override
  void initState() {
    super.initState();
    _titleController.text =
        widget.args?.hazardToUpdate?.title ??
        ref.read(providerOfCreateReport).hazardToCreateOrUpdate.title ??
        '';
    _descriptionController.text =
        widget.args?.hazardToUpdate?.description ??
        ref.read(providerOfCreateReport).hazardToCreateOrUpdate.description ??
        '';

    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.orange300,
                AppColors.red200,
              ],
            ),
          ),
        ),
        centerTitle: false,
        title: Consumer(
          builder: (context, ref, child) {
            final isUpdating = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.id?.isNotEmpty ?? false,
              ),
            );
            final reportSubmitted = ref.watch(
              providerOfCreateReport.select(
                (value) => value.reportSubmitted,
              ),
            );
            if (reportSubmitted) {
              return _submittedAppbarTitleBuilder();
            }

            return Text(
              isUpdating ? 'Update an ALRT' : 'Report an ALRT',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24.spMin,
              ),
            );
          },
        ),
        foregroundColor: AppColors.white,
        actions: [
          _clearAllBuilder(),
          15.wSizedBox,
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final reportSubmitted = ref.watch(
            providerOfCreateReport.select(
              (value) => value.reportSubmitted,
            ),
          );
          return reportSubmitted ? _submittedBuilder() : _formBuilder();
        },
      ).pB(20.0),
    ).keyboardDismisser(context);
  }

  Widget _formBuilder() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitleBuilder(
            title: 'Select Category',
            isRequired: true,
            requiredWidget: const SizedBox(),
          ),
          10.hSizedBox,
          _categoriesBuilder(),
          Consumer(
            builder: (context, ref, child) {
              final hasSelectedCategory = ref.watch(
                providerOfCreateReport.select(
                  (value) => value.hazardToCreateOrUpdate.category != null,
                ),
              );
              if (!hasSelectedCategory) return const SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24.spMin,
                children: [
                  _locationBuilder(),
                  // _titleBuilder(),
                  _descriptionBuilder(),
                  _mediaBuilder(),
                  _submitButtonBuilder().pT(10.0),
                ],
              ).pT(24.0);
            },
          ),
        ],
      ),
    );
  }

  Widget _categoriesBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final showCategoriesSelector = ref.watch(
          providerOfCreateReport.select(
            (value) => value.showCategoriesSelector,
          ),
        );
        final selectedCategory = ref.watch(
          providerOfCreateReport.select(
            (value) => value.hazardToCreateOrUpdate.category,
          ),
        );
        if (showCategoriesSelector || selectedCategory == null) {
          return CreateReportCategoriesList(
            onCategorySelected: (_) => _updateShowCategoriesSelector(false),
          );
        }

        final categoryColor = selectedCategory.color ?? AppColors.orange;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.spMin),
            boxShadow: [
              BoxShadow(
                color: categoryColor.withValues(alpha: 0.4),
                blurRadius: 6.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
            border: Border.all(
              color: categoryColor,
              width: 1.5,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.spMin),
            ),
            padding: EdgeInsets.all(15.spMin),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/hazards/non_aws/${selectedCategory.id}_user.png',
                  width: 50.spMin,
                  height: 50.spMin,
                  fit: BoxFit.contain,
                ),
                12.wSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedCategory.name ?? 'Unnamed Category',
                        style: TextStyle(
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.extraLightGrey,
                    borderRadius: BorderRadius.circular(10.spMin),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.spMin,
                    vertical: 5.spMin,
                  ),
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                ).onPressed(() => _updateShowCategoriesSelector(true)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _submittedAppbarTitleBuilder() {
    return Row(
      children: [
        Container(
          width: 38.spMin,
          height: 38.spMin,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            LucideIcons.star,
            size: 16.spMin,
            color: AppColors.white,
          ),
        ),
        8.wSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your ALRT has been submitted!',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.4,
                  letterSpacing: -0.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: AppTheme.defaultFontFamily,
                  ),
                  children: [
                    TextSpan(
                      text: 'Once approved you will gain ',
                    ),
                    TextSpan(
                      text: '+10 points ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: '- keep it up!',
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _submittedBuilder() {
    final line = Center(
      child: Container(
        height: 15.spMin,
        width: 2.5,
        decoration: BoxDecoration(
          color: const Color(0xFF3CBE5F),
          borderRadius: BorderRadius.circular(10.spMin),
        ),
      ),
    );
    final offset = 6.spMin;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 110.spMin,
                width: 110.spMin,
                decoration: BoxDecoration(
                  color: Color(0xFF3CBE5F).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColorLight,
                      blurRadius: 6.0,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 80.spMin,
                    height: 80.spMin,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3CBE5F).withValues(alpha: 0.8),
                          AppColors.darkGreen.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.white.withValues(alpha: 0.4),
                          blurRadius: 20.spMin,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 50.spMin,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              /// Top line
              Positioned(
                top: -offset,
                left: 0.0,
                right: 0.0,
                child: line,
              ),

              /// Bottom line
              Positioned(
                bottom: -offset,
                left: 0.0,
                right: 0.0,
                child: line,
              ),

              /// Left line
              Positioned(
                top: 0.0,
                bottom: 0.0,
                left: -offset,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: line,
                ),
              ),

              /// Right line
              Positioned(
                top: 0.0,
                bottom: 0.0,
                right: -offset,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: line,
                ),
              ),

              /// Top-left corner line
              Positioned(
                top: offset + 6.0,
                left: offset + 6.0,
                child: Center(
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: line,
                  ),
                ),
              ),

              /// Top-right corner line
              Positioned(
                top: offset + 6.0,
                right: offset + 6.0,
                child: Center(
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: line,
                  ),
                ),
              ),

              /// Bottom-left corner line
              Positioned(
                bottom: offset + 6.0,
                left: offset + 6.0,
                child: Center(
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: line,
                  ),
                ),
              ),

              /// Bottom-right corner line
              Positioned(
                bottom: offset + 6.0,
                right: offset + 6.0,
                child: Center(
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: line,
                  ),
                ),
              ),
            ],
          ),
          30.hSizedBox,
          Text(
            'ALRT Submitted!',
            style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w600,
            ),
          ),
          5.hSizedBox,
          Text(
            'Thank you for keeping your community safe.\nYour ALRT has been submitted for review.',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.normal,
              color: AppColors.mediumGrey,
            ),
            textAlign: TextAlign.center,
          ),
          20.hSizedBox,
          _xpPointsBuilder(),
          12.hSizedBox,
          _submitAnotherButtonBuilder(),
          12.hSizedBox,
          _seeActiveReportsButtonBuilder(),
        ],
      ).pX(20.0),
    );
  }

  Widget _sectionTitleBuilder({
    required final String title,
    final Color? color,
    final bool isRequired = false,
    final Widget? requiredWidget,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.spMin,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        isRequired
            ? requiredWidget ??
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.orange300,
                          AppColors.red200,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.spMin),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.spMin,
                      vertical: 2.spMin,
                    ),
                    child: Text(
                      'Required',
                      style: TextStyle(
                        fontSize: 10.spMin,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ).pL(5.0)
            : Text(
                ' (Optional)',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey.withValues(alpha: 0.6),
                ),
              ),
      ],
    );
  }

  Widget _inputBuilder({
    required final String hintText,
    final TextEditingController? controller,
    final String? value,
    final int? maxLines,
    final int? minLines,
    final TextCapitalization textCapitalization = TextCapitalization.none,
    final TextInputType? keyboardType,
    final EdgeInsetsGeometry? contentPadding,
    final bool enabled = true,
    final VoidCallback? onPressed,
    final Function(String)? onChanged,
  }) {
    return TextFormField(
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      controller: controller ?? TextEditingController(text: value),
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.grey.withValues(alpha: 0.8),
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: contentPadding,
        disabledBorder: context.theme.inputDecorationTheme.border?.copyWith(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
      ),
      onChanged: onChanged,
    ).onPressed(onPressed);
  }

  // ignore: unused_element
  Widget _titleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.spMin,
      children: [
        _sectionTitleBuilder(title: 'Title'),
        _inputBuilder(
          hintText: 'Brief description',
          controller: _titleController,
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) => _updateTitle(value.trim()),
        ),
      ],
    );
  }

  Widget _locationBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.spMin,
      children: [
        _sectionTitleBuilder(
          title: 'Location',
          isRequired: true,
        ),
        Consumer(
          builder: (context, ref, child) {
            final locationName = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.locationName,
              ),
            );
            return _inputBuilder(
              hintText: 'Where is it happening?',
              value: locationName,
              enabled: false,
              onPressed: _gotoSelectLocationScreen,
            );
          },
        ),
      ],
    );
  }

  Widget _descriptionBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.spMin,
      children: [
        _sectionTitleBuilder(title: 'Description'),
        _inputBuilder(
          hintText: "Describe what you're seeing...",
          controller: _descriptionController,
          minLines: 5,
          maxLines: 10,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.multiline,
          contentPadding: EdgeInsets.all(15.spMin),
          onChanged: (value) => _updateDescription(value.trim()),
        ),
      ],
    );
  }

  Widget _mediaBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.spMin,
      children: [
        _sectionTitleBuilder(title: 'Upload Media'),
        Consumer(
          builder: (context, ref, child) {
            final hasMedias = ref.watch(
              providerOfCreateReport.select(
                (value) => value.medias.isNotEmpty,
              ),
            );
            if (!hasMedias) return _mediaPickerBuilder();
            return CreateReportMediasList();
          },
        ),
      ],
    );
  }

  Widget _mediaPickerBuilder() {
    return Row(
      spacing: 10.spMin,
      children: [
        // Camera Button
        Expanded(
          child: _mediaPickerButtonBuilder(
            icon: LucideIcons.camera,
            label: 'Camera',
            onPressed: _handleCameraPress,
          ),
        ),
        // Gallery Button
        Expanded(
          child: _mediaPickerButtonBuilder(
            icon: LucideIcons.image,
            label: 'Gallery',
            onPressed: _handleGalleryPress,
          ),
        ),
      ],
    );
  }

  Widget _mediaPickerButtonBuilder({
    required final IconData icon,
    required final String label,
    required final VoidCallback onPressed,
  }) {
    return DottedBorderContainer(
      strokeWidth: 1.2,
      borderRadius: 12.spMin,
      borderColor: AppColors.lightGrey,
      child: Container(
        width: double.infinity,
        height: 115.spMin,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.spMin),
        ),
        child: Column(
          spacing: 6.spMin,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.grey.withValues(alpha: 0.6),
              size: 30.spMin,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.grey.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ).onPressed(onPressed),
    );
  }

  Widget _submitButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final reportSubmitted = ref.watch(
          providerOfCreateReport.select(
            (value) => value.reportSubmitted,
          ),
        );
        if (reportSubmitted) return const SizedBox.shrink();

        final hasSelectedCategory = ref.watch(
          providerOfCreateReport.select(
            (value) => value.hazardToCreateOrUpdate.category != null,
          ),
        );
        if (!hasSelectedCategory) return const SizedBox.shrink();

        final hasAllRequiredDataEntered = _hasAllRequiredDataEntered(ref);

        return Button.gradient(
          value: 'Submit Report',
          icon: Icon(Icons.check_rounded),
          onPressed: !hasAllRequiredDataEntered ? null : _handleSubmitReport,
        );
      },
    );
  }

  Widget _xpPointsBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final xpPointsAfterSubmission = ref.watch(
          providerOfLoggedInUser.select(
            (value) => (value?.xpPoints ?? 0) + 10,
          ),
        );
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 6.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.spMin),
          child: Row(
            spacing: 14.spMin,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.spMin),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.orange300,
                      AppColors.red200,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 10.0,
                      offset: Offset(0, 0.0),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.spMin,
                  vertical: 7.spMin,
                ),
                child: Row(
                  spacing: 5.spMin,
                  children: [
                    Icon(
                      LucideIcons.star,
                      size: 16.spMin,
                      color: AppColors.white,
                    ),
                    Text(
                      '+10',
                      style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Points pending approval',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Your total: ',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey.withValues(alpha: 0.6),
                          ),
                        ),
                        Text(
                          '$xpPointsAfterSubmission',
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w700,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _submitAnotherButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isUpdating = ref.watch(
          providerOfCreateReport.select(
            (value) => value.hazardToCreateOrUpdate.id?.isNotEmpty ?? false,
          ),
        );
        if (isUpdating) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 6.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.spMin,
            vertical: 15.spMin,
          ),
          child: Center(
            child: Row(
              spacing: 10.spMin,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: AppColors.black,
                ),
                Text(
                  'Submit Another Report',
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ).onPressed(_handleAnotherReport);
      },
    );
  }

  Widget _seeActiveReportsButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isUpdating = ref.watch(
          providerOfCreateReport.select(
            (value) => value.hazardToCreateOrUpdate.id?.isNotEmpty ?? false,
          ),
        );
        if (isUpdating) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 6.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.spMin,
            vertical: 15.spMin,
          ),
          child: Center(
            child: Row(
              spacing: 10.spMin,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_rounded, color: AppColors.black),
                Text(
                  'See My Active Reports',
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ).onPressed(() {
          ref.read(providerOfHomeTab.notifier).state = HomeTab.profile;
          context.push(MyHazardsScreen.route);
        });
      },
    );
  }

  Widget _clearAllBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final hasAnyDataEntered = _hasAnyDataEntered(ref);
        if (!hasAnyDataEntered) {
          return const SizedBox.shrink();
        }
        return Container(
          width: 32.spMin,
          height: 32.spMin,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8.spMin),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Icon(
            LucideIcons.trash2,
            color: AppColors.white.withValues(alpha: 0.8),
            size: 16.spMin,
          ),
        ).onPressed(_clearAll);
      },
    );
  }

  /// Checks if any data has been entered in the form.
  bool _hasAnyDataEntered(final WidgetRef ref) {
    return ref.watch(
      providerOfCreateReport.select(
        (value) =>
            value.hazardToCreateOrUpdate.category != null ||
            (value.hazardToCreateOrUpdate.title?.isNotEmpty ?? false) ||
            value.hazardToCreateOrUpdate.locationName != null ||
            (value.hazardToCreateOrUpdate.description?.isNotEmpty ?? false) ||
            value.medias.isNotEmpty,
      ),
    );
  }

  /// Checks if all required data has been entered in the form.
  bool _hasAllRequiredDataEntered(final WidgetRef ref) {
    return ref.watch(
      providerOfCreateReport.select(
        (value) =>
            value.hazardToCreateOrUpdate.category != null &&
            value.hazardToCreateOrUpdate.locationName != null,
      ),
    );
  }

  void _onInit() {
    ref.read(providerOfCreateReport.notifier).updateReportSubmitted(false);

    ref.read(providerOfCreateReport.notifier)
      ..updateHazardToCreateOrUpdate(widget.args?.hazardToUpdate ?? Hazard())
      ..updateMedias(widget.args?.hazardToUpdate?.processedMedias ?? [])
      ..updateShowCategoriesSelector(
        widget.args?.hazardToUpdate?.category == null,
      );
  }

  /// Navigates to the Select Location screen.
  void _gotoSelectLocationScreen() async {
    context.unfocusInputs();

    final selectedLocation = ref.read(
      providerOfCreateReport.select(
        (value) =>
            value.hazardToCreateOrUpdate.latitude == null ||
                value.hazardToCreateOrUpdate.longitude == null
            ? null
            : AlrtLocation(
                latitude: value.hazardToCreateOrUpdate.latitude!,
                longitude: value.hazardToCreateOrUpdate.longitude!,
                name: value.hazardToCreateOrUpdate.locationName,
              ),
      ),
    );
    final userLocation = ref.read(
      providerOfLocation.select(
        (value) => value.location,
      ),
    );

    final location = await context.push(
      SelectLocationScreen.route,
      extra: SelectLocationScreenArgs(
        initialLocation: selectedLocation,
        getSubUrbOnly: true,
        centerLocation: userLocation,
        radiusInMeters: 5000,
      ),
    );
    if (!mounted) return;

    if (location != null && location is AlrtLocation) {
      _updateLocation(location);
    }
  }

  /// Updates the title in the state.
  void _updateTitle(final String title) {
    ref.read(providerOfCreateReport.notifier).updateTitle(title);
  }

  /// Updates the location in the state.
  void _updateLocation(final AlrtLocation location) {
    ref.read(providerOfCreateReport.notifier).updateLocation(location);
  }

  /// Updates the description in the state.
  void _updateDescription(final String description) {
    ref.read(providerOfCreateReport.notifier).updateDescription(description);
  }

  /// Clears all the inputs and resets the state.
  void _clearAll() {
    context.unfocusInputs();
    _titleController.clear();
    _descriptionController.clear();
    ref.read(providerOfCreateReport.notifier).resetAllFields();
  }

  /// Handles the submission of the report.
  void _handleSubmitReport() {
    final isUpdating = ref.read(
      providerOfCreateReport.select(
        (value) => value.hazardToCreateOrUpdate.id?.isNotEmpty ?? false,
      ),
    );

    if (isUpdating) {
      showConfirmationSheet(
        context: context,
        title: 'Update Report',
        description:
            'Are you sure you want to update this report? This will reset your votes that you have received in this alert and send the alert back for review.',
        onPressedConfirm: (context, ref) {
          ref.read(providerOfCreateReport.notifier).createOrUpdateReport();
          _clearAll();
        },
      );
    } else {
      ref.read(providerOfCreateReport.notifier).createOrUpdateReport();
      _clearAll();
    }
  }

  /// Handles the action when user wants to submit another report.
  void _handleAnotherReport() {
    ref.read(providerOfCreateReport.notifier).updateReportSubmitted(false);
  }

  Future<void> _handleCameraPress() async {
    final result = await _mediaService.pickImage(
      source: ImageSource.camera,
    );
    if (!mounted) return;

    result.when(
      (media) {
        if (media != null) {
          ref.read(providerOfCreateReport.notifier).addMedias([media]);
        }
      },
      (error) {
        context.showErrorToast(
          message: 'We were unable to pick media. Please try again.',
        );
      },
    );
  }

  Future<void> _handleGalleryPress() async {
    final result = await _mediaService.pickMedias();
    if (!mounted) return;

    result.when(
      (medias) {
        ref.read(providerOfCreateReport.notifier).addMedias(medias);
      },
      (error) {
        context.showErrorToast(
          message: 'We were unable to pick media. Please try again.',
        );
      },
    );
  }

  /// Updates the show categories selector in the state.
  void _updateShowCategoriesSelector(final bool showCategoriesSelector) {
    ref
        .read(providerOfCreateReport.notifier)
        .updateShowCategoriesSelector(showCategoriesSelector);
  }
}
