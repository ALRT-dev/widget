import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/views/screens/select_location_screen.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_medias_list.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/date_time_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/categories_dropdown.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/features/shared/views/widgets/severities_dropdown.dart';
import 'package:hazard_app/others/app_colors.dart';

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
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        title: Consumer(
          builder: (context, ref, child) {
            final isUpdating = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.id?.isNotEmpty ?? false,
              ),
            );

            return Text(
              isUpdating ? 'Update an ALRT' : 'Report an ALRT',
              style: TextStyle(
                color: AppColors.black,
              ),
            );
          },
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        foregroundColor: AppColors.black,
        actions: [
          _clearAllBuilder(),
          15.wSizedBox,
        ],
      ),
      bottomNavigationBar: _submitButtonBuilder(),
      body: Consumer(
        builder: (context, ref, child) {
          final reportSubmitted = ref.watch(
            providerOfCreateReport.select(
              (value) => value.reportSubmitted,
            ),
          );
          return reportSubmitted ? _submittedBuilder() : _formBuilder();
        },
      ),
    ).keyboardDismisser(context);
  }

  Widget _formBuilder() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          _dateTimeBuilder(),
          _categoryBuilder(),
          _locationBuilder(),
          _descriptionBuilder(),
          _mediaBuilder(),
          0.hSizedBox,
        ],
      ),
    );
  }

  Widget _submittedBuilder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: AppColors.black,
            size: 80.spMin,
          ),
          10.hSizedBox,
          Text(
            'Report Submitted!',
            style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
            ),
          ),
          5.hSizedBox,
          Text(
            'Your report has been submitted. We will review it shortly and let you know afterwards.',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          20.hSizedBox,
          _submitAnotherButtonBuilder(),
        ],
      ).pX(20.0),
    );
  }

  Widget _titleBuilder(final String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
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
          color: AppColors.black,
          fontWeight: FontWeight.normal,
        ),
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

  Widget _dateTimeBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        _titleBuilder('Date & Time'),
        Consumer(
          builder: (context, ref, child) {
            final dateTime = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.occurredAt,
              ),
            );

            return _inputBuilder(
              hintText: 'Select a date & time',
              value: dateTime?.formattedWithTime,
              enabled: false,
              onPressed: _openDateTimePicker,
            );
          },
        ),
      ],
    );
  }

  Widget _categoryBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        _titleBuilder('Category'),
        Consumer(
          builder: (context, ref, child) {
            final selectedCategory = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.category,
              ),
            );
            return CategoriesDropdown(
              button: _inputBuilder(
                hintText: 'Select a category',
                value: selectedCategory?.name,
                enabled: false,
              ),
              onCategorySelected: (category) => _updateCategory(
                category,
              ),
            );
          },
        ),
      ],
    );
  }

  // ignore: unused_element
  Widget _severityBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        _titleBuilder('Severity'),
        Consumer(
          builder: (context, ref, child) {
            final selectedSeverity = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.severity,
              ),
            );
            return SeveritiesDropdown(
              button: _inputBuilder(
                hintText: 'Select severity',
                value: selectedSeverity == null
                    ? null
                    : '${selectedSeverity.emojiNonAws} ${selectedSeverity.titleNonAws}',
                enabled: false,
              ),
              onSeveritySelected: (severity) => _updateSeverity(
                severity,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _locationBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        _titleBuilder('Location'),
        Consumer(
          builder: (context, ref, child) {
            final locationName = ref.watch(
              providerOfCreateReport.select(
                (value) => value.hazardToCreateOrUpdate.locationName,
              ),
            );
            return _inputBuilder(
              hintText: 'Select a location',
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
      spacing: 8.h,
      children: [
        _titleBuilder('Description'),
        _inputBuilder(
          hintText: 'Write a description of the hazard',
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
      spacing: 8.h,
      children: [
        _titleBuilder('Media'),
        CreateReportMediasList(),
      ],
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

        final hasAllRequiredDataEntered = _hasAllRequiredDataEntered(ref);
        if (!hasAllRequiredDataEntered) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorMedium,
                blurRadius: 3,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          padding: EdgeInsets.all(10.spMin),
          child: SafeArea(
            child: Button.filled(
              value: 'Submit Report',
              icon: Icon(Icons.check_rounded),
              onPressed: _handleSubmitReport,
            ),
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

        return Button.filled(
          width: 300.0,
          value: 'Submit Another Report',
          icon: Icon(Icons.add_rounded),
          onPressed: _handleAnotherReport,
        );
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
        return RoundButton(
          icon: Icon(
            Icons.delete_rounded,
            color: AppColors.black,
            size: 24.spMin,
          ),
          size: 35.0,
          backgroundColor: AppColors.lightGrey.withValues(alpha: 0.7),
          onPressed: _clearAll,
        );
      },
    );
  }

  /// Checks if any data has been entered in the form.
  bool _hasAnyDataEntered(final WidgetRef ref) {
    return ref.watch(
      providerOfCreateReport.select(
        (value) =>
            value.hazardToCreateOrUpdate.occurredAt != null ||
            value.hazardToCreateOrUpdate.locationName != null ||
            value.hazardToCreateOrUpdate.category != null ||
            (value.hazardToCreateOrUpdate.description != null &&
                value.hazardToCreateOrUpdate.description!.isNotEmpty) ||
            (value.medias.isNotEmpty),
      ),
    );
  }

  /// Checks if all required data has been entered in the form.
  bool _hasAllRequiredDataEntered(final WidgetRef ref) {
    return ref.watch(
      providerOfCreateReport.select(
        (value) =>
            value.hazardToCreateOrUpdate.occurredAt != null &&
            value.hazardToCreateOrUpdate.category != null &&
            value.hazardToCreateOrUpdate.locationName != null,
      ),
    );
  }

  void _onInit() {
    ref.read(providerOfCreateReport.notifier).updateReportSubmitted(false);

    ref.read(providerOfCreateReport.notifier)
      ..updateHazardToCreateOrUpdate(widget.args?.hazardToUpdate ?? Hazard())
      ..updateMedias(widget.args?.hazardToUpdate?.processedMedias ?? []);
  }

  /// Opens a date and time picker dialog.
  void _openDateTimePicker() {
    context.unfocusInputs();

    final initialDate =
        ref.read(providerOfCreateReport).hazardToCreateOrUpdate.occurredAt ??
        // DateTime.now() is not working here somehow so using this workaround
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          DateTime.now().hour,
          DateTime.now().minute,
        );

    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      theme: DatePickerTheme(
        headerColor: AppColors.primary,
        backgroundColor: AppColors.white,
        itemStyle: TextStyle(
          color: AppColors.black,
          fontSize: 18.sp,
        ),
        doneStyle: TextStyle(
          color: AppColors.white,
          fontSize: 16.sp,
        ),
        cancelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 16.sp,
        ),
        containerHeight: 400.h,
      ),
      minTime: DateTime(DateTime.now().year - 1),
      maxTime: DateTime.now(),
      onConfirm: _updateDateTime,
      currentTime: initialDate,
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

    final location = await context.push(
      SelectLocationScreen.route,
      extra: SelectLocationScreenArgs(
        initialLocation: selectedLocation,
        getSubUrbOnly: true,
      ),
    );
    if (!mounted) return;

    if (location != null && location is AlrtLocation) {
      _updateLocation(location);
    }
  }

  /// Updates the datetime in the state.
  void _updateDateTime(final DateTime dateTime) {
    ref.read(providerOfCreateReport.notifier).updateDateTime(dateTime);
  }

  /// Updates the category in the state.
  void _updateCategory(final HazardCategory category) {
    ref.read(providerOfCreateReport.notifier).updateCategory(category);
  }

  /// Updates the severity in the state.
  void _updateSeverity(final HazardSeverity severity) {
    ref.read(providerOfCreateReport.notifier).updateSeverity(severity);
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
    _descriptionController.clear();
    ref.read(providerOfCreateReport.notifier).resetAllFields();
  }

  /// Handles the submission of the report.
  void _handleSubmitReport() {
    ref.read(providerOfCreateReport.notifier).createOrUpdateReport();
    _clearAll();
  }

  /// Handles the action when user wants to submit another report.
  void _handleAnotherReport() {
    ref.read(providerOfCreateReport.notifier).updateReportSubmitted(false);
  }
}
