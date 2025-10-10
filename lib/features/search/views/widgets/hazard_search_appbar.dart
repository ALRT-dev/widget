import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/providers/places_provider.dart';
import 'package:hazard_app/features/map/views/widgets/places_search_results_menu_content.dart';
import 'package:hazard_app/features/search/providers/main_search_provider.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_categories_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/dropdown.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardSearchAppBar extends ConsumerStatefulWidget {
  const HazardSearchAppBar({super.key});

  static const placesSearchKey = 'HazardSearchAppBar';
  static const categoriesKey = 'HazardSearchAppBar';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSearchAppBarState();
}

class _HazardSearchAppBarState extends ConsumerState<HazardSearchAppBar> {
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  final _dropdownController = AlrtDropdownController();

  late final providerOfPlacesForSearch = providerOfPlaces(
    HazardSearchAppBar.placesSearchKey,
  );

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(providerOfPlacesForSearch).searchString;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isCategoriesPresent = ref.watch(
          providerOfHazardCategoriesForSearch.select(
            (value) => value.hazardCategories.isNotEmpty,
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
            'ALRT Intelligent Search',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              isCategoriesPresent ? 118.spMin : 63.spMin,
            ),
            child: Column(
              children: [
                _searchbarBuilder().pX(20.0),
                15.hSizedBox,
                HazardCategoriesList(
                  categoriesKey: HazardSearchAppBar.categoriesKey,
                ),
                if (isCategoriesPresent) 15.hSizedBox,
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
    return AlrtDropdown(
      controller: _dropdownController,
      button: Consumer(
        builder: (context, ref, child) {
          final isSearchActive = ref.watch(
            providerOfPlacesForSearch.select(
              (value) => value.searchString.isNotEmpty,
            ),
          );
          return TextFormField(
            focusNode: _searchFocusNode,
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onChanged: _handleSearchChanged,
            decoration: InputDecoration(
              hintText: 'Subscribe to place, locality, area...',
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
      ),
      menuContent: (context, close) {
        return PlacesSearchResultsMenuContent(
          placesSearchKey: HazardSearchAppBar.placesSearchKey,
          onPlaceSelected: _handleSearchResultSelected,
        );
      },
    );
  }

  /// Updates the state with the given search string.
  void _handleSearchChanged(String value) {
    if (value.trim().isEmpty) {
      _dropdownController.close();
    } else {
      _dropdownController.open();
    }

    ref.read(providerOfPlacesForSearch.notifier)
      ..updateSearchString(value.trim())
      ..updateGetPlacesToLoading();
    EasyDebounce.debounce(
      'hazards-search',
      const Duration(milliseconds: 300),
      () {
        if (!mounted) return;
        ref.read(providerOfPlacesForSearch.notifier).getPlaces();
      },
    );
  }

  /// Clears the search input field.
  void _handleClearSearchPressed() {
    _searchController.clear();
    _searchFocusNode.unfocus();
    ref.read(providerOfPlacesForSearch.notifier).updateSearchString('');
    _dropdownController.close();

    // also clear the searched location and hazards from the main search provider
    ref.read(providerOfMainSearch.notifier)
      ..updateSearchedLocation(null)
      ..updateGetHazardsByLocationStateToInitial();

    // clear hazard categories as well
    ref
        .read(providerOfHazardCategoriesForSearch.notifier)
        .updateGetHazardCategoriesStateToInitial();
  }

  /// Handles the selection of a search result place.
  void _handleSearchResultSelected(final GooglePlace place) {
    _searchFocusNode.unfocus();
    _dropdownController.close();
    _searchController.text = place.name;

    // update the main search provider with the selected location and fetch hazards.
    ref.read(providerOfMainSearch.notifier)
      ..updateSearchedLocation(place.toAlrtLocation)
      ..getHazards();

    // fetch hazard categories for the selected location
    ref
        .read(providerOfHazardCategoriesForSearch.notifier)
        .getHazardCategories();
  }
}
