import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/map/providers/location_provider.dart';
import 'package:hazard_app/features/map/providers/places_provider.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/views/screens/select_location_on_map_screen.dart';
import 'package:hazard_app/features/map/views/widgets/place_search_results_list.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
import 'package:hazard_app/others/app_colors.dart';

class SelectLocationScreenArgs {
  SelectLocationScreenArgs({
    this.initialLocation,
  });

  /// The initial location to be displayed on the map when the screen loads.
  final AlrtLocation? initialLocation;
}

class SelectLocationScreen extends ConsumerStatefulWidget {
  const SelectLocationScreen({
    super.key,
    this.args,
  });

  final SelectLocationScreenArgs? args;

  static const String route = '/select-location';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectLocationScreenState();
}

class _SelectLocationScreenState extends ConsumerState<SelectLocationScreen> {
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.args?.initialLocation?.name ??
        widget.args?.initialLocation?.address ??
        '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_searchController.text.isNotEmpty) {
        _handleSearchChanged(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          10.hSizedBox.sliverBox,
          SafeArea(
            bottom: false,
            child: _searchbarBuilder().pX(20.0),
          ).sliverBox,
          20.hSizedBox.sliverBox,
          _yourLocationBuilder().sliverBox,
          _chooseOnTheMapBuilder().sliverBox,
          Divider().pX(20.0).sliverBox,
          PlaceSearchResultsList(
            onPlaceSelected: _handlePlaceSelected,
          ),
        ],
      ),
    ).keyboardDismisser(context);
  }

  Widget _searchbarBuilder() {
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
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search place, locality, area...',
          contentPadding: EdgeInsets.only(
            top: 5.spMin,
            bottom: 5.spMin,
            right: 10.spMin,
          ),
          filled: true,
          fillColor: AppColors.white,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: BackButtonIcon(),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final isSearchActive = ref.watch(
                    providerOfPlaces.select(
                      (value) => value.searchString.isNotEmpty,
                    ),
                  );
                  if (!isSearchActive) return const SizedBox();

                  return IconButton(
                    onPressed: _handleClearSearchPressed,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 20.spMin,
                      color: AppColors.black,
                    ),
                  ).pR(5.0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _yourLocationBuilder() {
    return ListTile(
      leading: RoundButton(
        icon: Icon(
          Icons.my_location_rounded,
          color: AppColors.blue,
          size: 22.spMin,
        ),
      ),
      title: Text(
        'Your location',
        style: TextStyle(
          fontSize: 16.spMin,
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: _handleYourLocationPressed,
    );
  }

  Widget _chooseOnTheMapBuilder() {
    return ListTile(
      leading: RoundButton(
        icon: Icon(
          Icons.map_rounded,
          size: 22.spMin,
          color: AppColors.blue,
        ),
      ),
      title: Text(
        'Choose on the map',
        style: TextStyle(
          fontSize: 16.spMin,
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: _gotoSelectLocationOnMapScreen,
    );
  }

  /// Updates the search string in the [PlacesProvider] and triggers a debounced to fetch places.
  void _handleSearchChanged(final String value) {
    ref.read(providerOfPlaces.notifier)
      ..updateSearchString(value.trim())
      ..updateGetPlacesToLoading();

    EasyDebounce.debounce(
      'location-search-debounce',
      const Duration(milliseconds: 500),
      () {
        ref.read(providerOfPlaces.notifier).getPlaces();
      },
    );
  }

  /// Clears the search input field and refocuses it.
  void _handleClearSearchPressed() {
    _searchController.clear();
    _searchFocusNode.requestFocus();
    _handleSearchChanged('');
  }

  /// Fetches the user's current location from the [LocationProvider] and pops the screen with that location.
  void _handleYourLocationPressed() {
    final currentUserLocation = ref.read(providerOfLocation).location;
    context.pop(currentUserLocation);
  }

  /// Navigates to the [SelectLocationOnMapScreen] to allow the user to select a location on the map.
  void _gotoSelectLocationOnMapScreen() async {
    final location = await context.push(
      SelectLocationOnMapScreen.route,
      extra: SelectLocationOnMapScreenArgs(
        initialLocation: widget.args?.initialLocation,
      ),
    );
    if (!mounted) return;

    if (location != null && location is AlrtLocation) {
      ref
          .read(providerOfMapService)
          .getAddressFromCoordinates(coordinates: location.latLng);
      context.pop(location);
    }
  }

  /// Handles the selection of a place from the search results and pops the screen with the selected location.
  void _handlePlaceSelected(final GooglePlace place) {
    context.pop(place.toAlrtLocation);
  }
}
