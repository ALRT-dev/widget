import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/views/screens/select_location_screen.dart';
import 'package:hazard_app/features/profile/views/screens/my_hazards_screen.dart';
import 'package:hazard_app/features/report/providers/create_update_report_provider.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_categories_list.dart';
import 'package:hazard_app/features/report/views/widgets/create_report_medias_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
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
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _scrollController = ScrollController();

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      controller: _scrollController,
      padding: EdgeInsets.all(20.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitleBuilder(
            title: 'Select Category',
            isRequired: true,
          ),
          10.hSizedBox,
          CreateReportCategoriesList(
            onCategorySelected: (_) => _scrollToEnd(),
          ),
          24.hSizedBox,
          Consumer(
            builder: (context, ref, child) {
              final hasSelectedCategory = ref.watch(
                providerOfCreateReport.select(
                  (value) => value.hazardToCreateOrUpdate.category != null,
                ),
              );
              if (!hasSelectedCategory) return const SizedBox.shrink();

              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24.spMin,
                    children: [
                      _locationBuilder(),
                      _titleBuilder(),
                      _descriptionBuilder(),
                      _mediaBuilder(),
                    ],
                  ),
                ],
              );
            },
          ),
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
            color: AppColors.green,
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
          10.hSizedBox,
          _seeActiveReportsButtonBuilder(),
        ],
      ).pX(20.0),
    );
  }

  Widget _sectionTitleBuilder({
    required final String title,
    final bool isRequired = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!isRequired)
          Text(
            ' (Optional)',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
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

  Widget _titleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
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
      spacing: 8.h,
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
      spacing: 8.h,
      children: [
        _sectionTitleBuilder(title: 'Description'),
        _inputBuilder(
          hintText: 'Provide details...',
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
        _sectionTitleBuilder(title: 'Upload Media'),
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

        return Button.bordered(
          width: 300.0,
          value: 'Submit Another Report',
          icon: Icon(Icons.add_rounded),
          onPressed: _handleAnotherReport,
        );
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

        return Button.bordered(
          width: 300.0,
          value: 'See My Active Reports',
          icon: Icon(Icons.list_rounded),
          onPressed: () {
            ref.read(providerOfHomeTab.notifier).state = HomeTab.profile;
            context.push(MyHazardsScreen.route);
          },
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
      ..updateMedias(widget.args?.hazardToUpdate?.processedMedias ?? []);
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

  /// Scrolls to the end of the screen.
  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
