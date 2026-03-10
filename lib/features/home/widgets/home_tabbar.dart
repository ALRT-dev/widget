import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:hazard_app/others/app_theme.dart';

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
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.spMin),
          topRight: Radius.circular(30.spMin),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10.0,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: SafeArea(
        child: TabBar(
          controller: widget.tabController,
          labelColor: AppColors.orange,
          labelStyle: TextStyle(
            fontSize: 12.spMin,
            fontFamily: AppTheme.defaultFontFamily,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: AppColors.grey,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          dividerHeight: 0.0,
          onTap: (index) => _onTabChanged(HomeTab.values[index]),
          labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(vertical: 5.spMin),
          tabs: HomeTab.values
              .map((tab) => Tab(icon: _tabBuilder(tab)))
              .toList(),
        ).pT(5.0),
      ),
    );
  }

  Widget _tabBuilder(final HomeTab tab) {
    return Consumer(
      builder: (context, ref, child) {
        return Tab(
          icon: tab == HomeTab.list
              ? Image.asset(
                  'assets/logos/alrt_logo.png',
                  height: 22.spMin,
                )
              : Icon(
                  tab.iconData,
                  size: 24.spMin,
                  color: ref.watch(
                    providerOfHomeTab.select(
                      (value) =>
                          value == tab ? AppColors.orange : AppColors.grey,
                    ),
                  ),
                ),
          text: tab.title,
        );
      },
    );
  }

  /// Updates the current selected tab.
  void _onTabChanged(final HomeTab tab) {
    ref.read(providerOfHomeTab.notifier).state = tab;
  }
}
