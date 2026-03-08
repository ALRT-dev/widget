import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/providers/map_provider.dart';
import 'package:hazard_app/features/map/providers/map_search_text_editing_controller_provider.dart';
import 'package:hazard_app/features/map/providers/places_provider.dart';
import 'package:hazard_app/features/map/views/widgets/places_search_results_menu_content.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/dropdown.dart';
import 'package:hazard_app/others/app_colors.dart';

class MapSearchbar extends ConsumerStatefulWidget {
  const MapSearchbar({super.key});

  static const placesSearchKey = 'MapSearchbar';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapSearchbarState();
}

class _MapSearchbarState extends ConsumerState<MapSearchbar> {
  final _searchFocusNode = FocusNode();
  TextEditingController get _searchController =>
      ref.read(providerOfMapSearchTextEditingController);

  final _dropdownController = AlrtDropdownController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(providerOfPlacesForMap).searchString;
  }

  @override
  Widget build(BuildContext context) {
    return AlrtDropdown(
      controller: _dropdownController,
      button: (context, isOpen) => Consumer(
        builder: (context, ref, child) {
          final isSearchActive = ref.watch(
            providerOfPlacesForMap.select(
              (value) => value.searchString.isNotEmpty,
            ),
          );

          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10.0,
                  offset: Offset(0, 0.0),
                ),
              ],
            ),
            child: TextFormField(
              focusNode: _searchFocusNode,
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onChanged: _handleSearchChanged,
              style: TextStyle(
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Search the location...',
                hintStyle: TextStyle(
                  color: AppColors.grey.withValues(alpha: 0.7),
                ),
                contentPadding: EdgeInsets.only(
                  top: 5.spMin,
                  bottom: 5.spMin,
                  left: 20.spMin,
                  right: 10.spMin,
                ),
                filled: true,
                fillColor: AppColors.white,
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 25.spMin,
                      height: 25.spMin,
                      color: AppColors.grey.withValues(alpha: 0.6),
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
            ),
          );
        },
      ),
      menuContent: (context, close) {
        return PlacesSearchResultsMenuContent(
          placesSearchKey: MapSearchbar.placesSearchKey,
          onPlaceSelected: _handleSearchResultSelected,
        );
      },
    );
  }

  /// Handles changes in the search input field with a debounce.
  void _handleSearchChanged(final String value) {
    if (value.trim().isEmpty) {
      _dropdownController.close();
    } else {
      _dropdownController.open();
    }

    ref.read(providerOfPlacesForMap.notifier)
      ..updateSearchString(value.trim())
      ..updateGetPlacesToLoading();
    EasyDebounce.debounce(
      'map-search',
      const Duration(milliseconds: 500),
      () {
        if (!mounted) return;
        ref.read(providerOfPlacesForMap.notifier).getPlaces();
      },
    );
  }

  /// Clears the search input field and unfocuses it.
  void _handleClearSearchPressed() {
    final isRoutePresent = ref.read(
      providerOfMap.select(
        (value) => value.currentRoutePlan != null,
      ),
    );

    // if a route is present, only clear the route but keep the selected place
    // else clear both selected place and route
    if (isRoutePresent) {
      ref.read(providerOfMap.notifier)
        ..updateCurrentRoutePlan(null)
        ..stopNavigation();
    } else {
      _searchFocusNode.unfocus();
      _searchController.clear();
      _dropdownController.close();
      ref.read(providerOfPlacesForMap.notifier).updateSearchString('');
      ref.read(providerOfMap.notifier)
        ..updateSelectedLocation(null)
        ..removeSelectedLocationMarker();
    }
  }

  /// Updates the selected place in the map provider when a search result is selected.
  void _handleSearchResultSelected(final GooglePlace place) {
    _dropdownController.close();
    _searchFocusNode.unfocus();
    _searchController.text = place.name;

    ref.read(providerOfPlacesForMap.notifier).updateSearchString(place.name);
    ref.read(providerOfMap.notifier)
      // update selected location
      ..updateSelectedLocation(place.toAlrtLocation)
      // clear any selected hazard when a new place is selected
      ..updateSelectedHazard(null);

    // move camera to the selected place
    ref
        .read(providerOfMap.notifier)
        .animateTo(
          position: LatLng(place.latitude, place.longitude),
          zoom: 20.0,
        );

    // add a marker to the selected place
    ref
        .read(providerOfMap.notifier)
        .addSelectedLocationMarker(LatLng(place.latitude, place.longitude));
  }
}
