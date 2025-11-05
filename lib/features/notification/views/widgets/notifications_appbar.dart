import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hazard_app/features/notification/providers/notifications_feed_provider.dart';
import 'package:hazard_app/features/notification/providers/states/notifications_feed_provider_state.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/filter_widgets/hazard_filters_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class NotificationsAppBar extends ConsumerStatefulWidget {
  const NotificationsAppBar({super.key});

  static const filtersKey = 'NotificationsAppBarFilters';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsAppBarState();
}

class _NotificationsAppBarState extends ConsumerState<NotificationsAppBar> {
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(providerOfNotificationsFeed).searchString;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isHazardsLoading = ref.watch(
          providerOfNotificationsFeed.select(
            (value) => value.getNotificationsFeed.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
          ),
        );
        final isHazardsPresent = ref.watch(
          providerOfNotificationsFeed.select(
            (value) =>
                value.searchString.isNotEmpty ? true : value.hazards.isNotEmpty,
          ),
        );
        return SliverAppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          surfaceTintColor: AppColors.transparent,
          floating: true,
          pinned: true,
          leading: const SizedBox(),
          leadingWidth: 0.0,
          toolbarHeight: 50.spMin,
          title: Text(
            'ALRT Feed',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          bottom: !isHazardsPresent && !isHazardsLoading
              ? PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Divider(
                    height: 0.0,
                    color: AppColors.lightGrey.withValues(alpha: 0.5),
                  ),
                )
              : PreferredSize(
                  preferredSize: Size.fromHeight(63.spMin),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _searchbarBuilder()),
                          _filtersButtonBuilder(),
                        ],
                      ).pX(20.0),
                      15.hSizedBox,
                      Divider(
                        height: 0.0,
                        color: AppColors.lightGrey.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _searchbarBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isSearchActive = ref.watch(
          providerOfNotificationsFeed.select(
            (value) => value.searchString.isNotEmpty,
          ),
        );
        return TextFormField(
          focusNode: _searchFocusNode,
          controller: _searchController,
          textInputAction: TextInputAction.search,
          onChanged: _handleSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search hazards around you...',
            contentPadding: EdgeInsets.only(
              top: 5.spMin,
              bottom: 5.spMin,
              left: 20.spMin,
              right: 10.spMin,
            ),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 25.spMin,
                  height: 25.spMin,
                ).pL(15.0),
              ],
            ),
            suffixIcon: !isSearchActive
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: _handleClearSearchPressed,
                        icon: Icon(
                          Icons.close_rounded,
                          size: 20.spMin,
                          color: AppColors.black,
                        ),
                      ).pR(5.0),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _filtersButtonBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isFiltersAvailable = ref.watch(
          providerOfHazardFiltersForNotifications.select(
            (value) =>
                value.hazardCategories.isNotEmpty ||
                value.hazardSeveritiesAws.isNotEmpty ||
                value.hazardSeveritiesNonAws.isNotEmpty,
          ),
        );
        if (!isFiltersAvailable) {
          return const SizedBox.shrink();
        }
        return HazardFiltersButton(
          filtersKey: NotificationsAppBar.filtersKey,
          onCategoriesSelectionUpdated: (_) => _getHazards(),
          onSeveritiesSelectionUpdated: (_) => _getHazards(),
          buttonShadow: [],
        ).pL(10.0);
      },
    );
  }

  /// Updates the state with the given search string.
  void _handleSearchChanged(String value) {
    ref.read(providerOfNotificationsFeed.notifier)
      ..updateSearchString(value.trim())
      ..updateGetNotificationsFeedStateToLoading();
    EasyDebounce.debounce(
      'notifications-search',
      const Duration(milliseconds: 300),
      () {
        if (!mounted) return;
        ref.read(providerOfNotificationsFeed.notifier).getNotificationsFeed();
      },
    );
  }

  /// Clears the search input field.
  void _handleClearSearchPressed() {
    _searchController.clear();
    _searchFocusNode.unfocus();
    ref.read(providerOfNotificationsFeed.notifier)
      ..updateSearchString('')
      ..getNotificationsFeed();
  }

  /// Fetches the hazards for the notifications feed.
  void _getHazards() {
    ref.read(providerOfNotificationsFeed.notifier).getNotificationsFeed();
  }
}
