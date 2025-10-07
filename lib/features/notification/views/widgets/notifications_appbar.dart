import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/search/views/widgets/hazard_categories_list.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class NotificationsAppBar extends ConsumerStatefulWidget {
  const NotificationsAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsAppBarState();
}

class _NotificationsAppBarState extends ConsumerState<NotificationsAppBar> {
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
        'ALRT Feed',
        style: TextStyle(
          color: AppColors.black,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.spMin),
        child: Column(
          children: [
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
}
