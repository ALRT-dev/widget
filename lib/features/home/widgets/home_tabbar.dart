import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/avatar.dart';
import 'package:hazard_app/others/app_colors.dart';

class HomeTabbar extends ConsumerStatefulWidget {
  const HomeTabbar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends ConsumerState<HomeTabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withValues(alpha: 0.8),
            blurRadius: 0.5,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: SafeArea(
        child: TabBar(
          controller: widget.tabController,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          dividerHeight: 0.0,
          onTap: (index) => _onTabChanged(HomeTab.values[index]),
          tabs: HomeTab.values
              .map((tab) => Tab(icon: _tabBuilder(tab)))
              .toList(),
        ).pT(5.0),
      ),
    );
  }

  Widget _tabBuilder(final HomeTab tab) {
    if (tab == HomeTab.profile) {
      return _profileTabBuilder();
    }

    return Consumer(
      builder: (context, ref, child) {
        final iconPath = ref.watch(
          providerOfHomeTab.select(
            (value) =>
                value == tab ? tab.selectedIconPath : tab.unselectedIconPath,
          ),
        );

        return Tab(
          icon: iconPath.endsWith('.svg')
              ? SvgPicture.asset(
                  iconPath,
                  width: 26.spMin,
                  height: 26.spMin,
                )
              : Image.asset(
                  iconPath,
                  width: 30.spMin,
                  height: 30.spMin,
                ),
        );
      },
    );
  }

  Widget _profileTabBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final isSelected = ref.watch(
          providerOfHomeTab.select(
            (value) => value == HomeTab.profile,
          ),
        );
        final initials = ref.watch(
          providerOfLoggedInUser.select(
            (user) => user?.initials ?? 'U',
          ),
        );

        final processedProfilePicture = ref.watch(
          providerOfLoggedInUser.select(
            (user) => user?.processedProfilePicture,
          ),
        );

        if (processedProfilePicture != null) {
          return Avatar.profileMedia(
            profileMedia: processedProfilePicture,
            size: 30.0,
            foregroundColor: AppColors.black,
            backgroundColor: AppColors.yellow,
            borderColor: isSelected ? AppColors.black : AppColors.transparent,
            borderWidth: isSelected ? 1.5 : 0.0,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: AppColors.shadowColor,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [],
          );
        }

        return Avatar.initials(
          initials: initials,
          size: 30.0,
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.yellow,
          borderColor: isSelected ? AppColors.black : AppColors.transparent,
          borderWidth: isSelected ? 1.5 : 0.0,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: AppColors.shadowColor,
                    offset: Offset(0, 0),
                  ),
                ]
              : [],
        );
      },
    ).onPressed(
      () => _onTabChanged(HomeTab.profile),
    );
  }

  /// Updates the current selected tab.
  void _onTabChanged(final HomeTab tab) {
    ref.read(providerOfHomeTab.notifier).state = tab;
  }
}
