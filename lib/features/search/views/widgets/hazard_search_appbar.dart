import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hazard_app/features/search/providers/hazards_provider.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardSearchAppBar extends ConsumerStatefulWidget {
  const HazardSearchAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HazardSearchAppBarState();
}

class _HazardSearchAppBarState extends ConsumerState<HazardSearchAppBar> {
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text =
        ref.read(providerOfHazards).tempSearchParams.searchString ?? '';
  }

  @override
  Widget build(BuildContext context) {
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
        preferredSize: Size.fromHeight(118.spMin),
        child: Column(
          children: [
            _searchbarBuilder().pX(20.0),
            15.hSizedBox,
            HazardCategoriesList(),
            15.hSizedBox,
            Divider(
              height: 0.0,
              color: AppColors.lightGrey.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchbarBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        return TextFormField(
          focusNode: _searchFocusNode,
          controller: _searchController,
          textInputAction: TextInputAction.search,
          onChanged: _handleSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search place, locality, area...',
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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final isSearchActive = ref.watch(
                      providerOfHazards.select(
                        (value) =>
                            value.tempSearchParams.searchString?.isNotEmpty ==
                            true,
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
        );
      },
    );
  }

  /// Updates the state with the given search string.
  void _handleSearchChanged(String value) {
    ref.read(providerOfHazards.notifier)
      ..updateTempSearchString(value.trim())
      ..updateGetHazardsStateToLoading();
    EasyDebounce.debounce(
      'hazards-search',
      const Duration(milliseconds: 300),
      () {
        if (!mounted) return;
        ref.read(providerOfHazards.notifier).getHazards();
      },
    );
  }

  /// Clears the search input field.
  void _handleClearSearchPressed() {
    _searchController.clear();
    _searchFocusNode.unfocus();
    ref.read(providerOfHazards.notifier)
      ..updateTempSearchString(null)
      ..getHazards();
  }
}
