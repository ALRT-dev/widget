import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/profile/providers/profile_provider.dart';
import 'package:hazard_app/features/profile/providers/states/profile_provider_state.dart';
import 'package:hazard_app/features/profile/views/widgets/needs_update_reports_widgets/needs_update_reports_list.dart';
import 'package:hazard_app/features/profile/views/widgets/recent_reports_widgets/recent_reports_list.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/features/shared/views/widgets/avatar.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:hazard_app/others/app_wrapper.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    _listenToLogoutState();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserInfoSection(),
                  24.spMin.hSizedBox,
                  _buildScoresSection(),
                  24.spMin.hSizedBox,
                  _buildStatsSection(),
                  24.spMin.hSizedBox,
                  _buildSubmittedHazardsSection(),
                  _buildFailedReviewsSection(),
                  24.spMin.hSizedBox,
                  _buildLogoutSection(),
                  32.spMin.hSizedBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200.spMin,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the collapse ratio
          final collapsedHeight =
              kToolbarHeight + MediaQuery.of(context).padding.top;
          final currentHeight = constraints.maxHeight;

          // When currentHeight equals collapsedHeight, it's fully collapsed
          final isCollapsed =
              currentHeight <= collapsedHeight + 10; // Small buffer

          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsets.only(
              left: 20.spMin,
              bottom: 16.spMin,
            ),
            title: isCollapsed
                ? Row(
                    spacing: 10.spMin,
                    children: [
                      _buildUserAvatar(
                        size: 40.0,
                        backgroundColor: AppColors.black,
                        borderColor: AppColors.white,
                        borderWidth: 2.0,
                      ),
                      _buildUserName(
                        color: AppColors.black,
                        fontSize: 20.0,
                      ),
                    ],
                  )
                : null,
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withValues(alpha: 0.85),
                    AppColors.black,
                  ],
                ),
              ),
              child: Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    final userEmail = ref.watch(
                      providerOfLoggedInUser.select(
                        (value) => value?.email,
                      ),
                    );
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        40.spMin.hSizedBox,
                        _buildUserAvatar(),
                        12.spMin.hSizedBox,
                        _buildUserName(),
                        if (userEmail != null) 4.spMin.hSizedBox,
                        if (userEmail != null)
                          Text(
                            userEmail,
                            style: TextStyle(
                              fontSize: 14.spMin,
                              color: AppColors.white.withValues(alpha: 0.8),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserName({
    final double fontSize = 24.0,
    final Color color = AppColors.white,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final userName = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.name ?? 'User',
          ),
        );
        return Text(
          userName,
          style: TextStyle(
            fontSize: fontSize.spMin,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        );
      },
    );
  }

  Widget _buildUserAvatar({
    final double size = 80.0,
    final Color? backgroundColor,
    final Color foregroundColor = AppColors.white,
    final Color borderColor = AppColors.white,
    final double borderWidth = 3,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final userName = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.name ?? 'User',
          ),
        );
        return Hero(
          tag: 'profile_avatar',
          child: Avatar.initials(
            initials: _getInitials(userName),
            size: size,
            backgroundColor:
                backgroundColor ??
                AppColors.white.withValues(
                  alpha: 0.2,
                ),
            foregroundColor: foregroundColor,
            borderWidth: borderWidth,
            borderColor: borderColor,
          ),
        );
      },
    );
  }

  Widget _buildUserInfoSection() {
    return _buildSection(
      title: 'Account Information',
      icon: Icons.person_outline,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.extraLightGrey,
          borderRadius: BorderRadius.circular(12.spMin),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final userCreatedAt = ref.watch(
              providerOfLoggedInUser.select(
                (value) => value?.createdAt,
              ),
            );
            return Column(
              spacing: 12.spMin,
              children: [
                if (userCreatedAt != null)
                  _buildInfoRow(
                    'Joined',
                    timeago.format(userCreatedAt),
                    Icons.calendar_today_outlined,
                  ),
                _buildInfoRow(
                  'Last Active',
                  'now',
                  Icons.access_time_outlined,
                  valueColor: AppColors.green,
                ),
                _buildInfoRow(
                  'Member Status',
                  'Normal',
                  Icons.verified_outlined,
                  valueColor: AppColors.black,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildScoresSection() {
    return _buildSection(
      title: 'Performance Metrics',
      icon: Icons.trending_up_outlined,
      child: Row(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final xpPoints = ref.watch(
                  providerOfLoggedInUser.select(
                    (value) => value?.xpPoints ?? 0,
                  ),
                );
                return _buildScoreCard(
                  'XP Score',
                  xpPoints.toString(),
                  Icons.star_outline,
                  AppColors.orange,
                  '',
                );
              },
            ),
          ),
          16.spMin.wSizedBox,
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final reliabilityScore = ref.watch(
                  providerOfLoggedInUser.select(
                    (value) => (value?.reliabilityScore ?? 0.0) * 100,
                  ),
                );

                return _buildScoreCard(
                  'Reliability',
                  '${reliabilityScore.toStringAsFixed(0)}%',
                  Icons.shield_outlined,
                  AppColors.green,
                  '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return _buildSection(
      title: 'Activity Stats',
      icon: Icons.analytics_outlined,
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.extraLightGrey,
          borderRadius: BorderRadius.circular(12.spMin),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final alertsViewed = ref.watch(
                  providerOfLoggedInUser.select(
                    (value) => value?.hazardsViewedCount ?? 0,
                  ),
                );
                return _buildStatItem(
                  'Alrts Viewed',
                  alertsViewed.toString(),
                  Icons.visibility_outlined,
                );
              },
            ),
            Container(
              width: 1,
              height: 40.spMin,
              color: AppColors.lightGrey,
            ),
            Consumer(
              builder: (context, ref, child) {
                final alertsMade = ref.watch(
                  providerOfLoggedInUser.select(
                    (value) => value?.hazardsReportedCount ?? 0,
                  ),
                );
                return _buildStatItem(
                  'Alrts Made',
                  alertsMade.toString(),
                  Icons.report_outlined,
                );
              },
            ),
            Container(
              width: 1,
              height: 40.spMin,
              color: AppColors.lightGrey,
            ),
            Consumer(
              builder: (context, ref, child) {
                final upvotesReceived = ref.watch(
                  providerOfLoggedInUser.select(
                    (value) => value?.upvotesReceivedCount ?? 0,
                  ),
                );
                return _buildStatItem(
                  'Upvotes Received',
                  upvotesReceived.toString(),
                  Icons.thumb_up_alt_outlined,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmittedHazardsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isEmpty = ref.watch(
          providerOfProfile.select(
            (value) => value.myAcceptedHazards.isEmpty,
          ),
        );
        if (isEmpty) return const SizedBox();

        return _buildSection(
          title: 'Recent Reports',
          icon: Icons.list_alt_outlined,
          child: Column(
            spacing: 12.spMin,
            children: [
              RecentReportsList(),
              _buildViewAllButton(
                'View All Reports',
              ),
            ],
          ),
        ).pB(24.0);
      },
    );
  }

  Widget _buildFailedReviewsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isEmpty = ref.watch(
          providerOfProfile.select(
            (value) => value.myRejectedHazards.isEmpty,
          ),
        );
        if (isEmpty) return const SizedBox();

        return _buildSection(
          title: 'Needs Update',
          icon: Icons.warning_amber_outlined,
          child: Column(
            spacing: 12.spMin,
            children: [
              NeedsUpdateReportsList(),
              _buildViewAllButton('View All Pending'),
            ],
          ),
        ).pB(24.0);
      },
    );
  }

  // ignore: unused_element
  Widget _buildEmergencyContactsSection() {
    return _buildSection(
      title: 'Emergency Contacts',
      icon: Icons.contact_phone_outlined,
      child: Column(
        children: [
          _buildContactItem(
            'Local Emergency Services',
            '911',
            Icons.local_hospital_outlined,
            AppColors.red,
          ),
          12.spMin.hSizedBox,
          _buildContactItem(
            'Fire Department',
            '(555) 123-4567',
            Icons.fire_truck_outlined,
            AppColors.orange,
          ),
          12.spMin.hSizedBox,
          _buildContactItem(
            'Non-Emergency Police',
            '(555) 987-6543',
            Icons.local_police_outlined,
            AppColors.blue,
          ),
          12.spMin.hSizedBox,
          InkWell(
            onTap: () {
              // Navigate to manage contacts
            },
            borderRadius: BorderRadius.circular(8.spMin),
            child: Container(
              padding: EdgeInsets.all(12.spMin),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8.spMin),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16.spMin,
                    color: AppColors.blue,
                  ),
                  8.spMin.wSizedBox,
                  Text(
                    'Add Emergency Contact',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutSection() {
    return Button.filled(
      value: 'Logout',
      icon: Icon(Icons.logout),
      onPressed: () {
        _showLogoutDialog();
      },
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20.spMin,
              color: AppColors.grey,
            ),
            8.spMin.wSizedBox,
            Text(
              title,
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        12.spMin.hSizedBox,
        child,
      ],
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
    IconData icon, {
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.spMin,
          color: AppColors.grey,
        ),
        12.spMin.wSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.spMin,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              2.spMin.hSizedBox,
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScoreCard(
    String title,
    String score,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      padding: EdgeInsets.all(16.spMin),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.spMin),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24.spMin,
            color: color,
          ),
          8.spMin.hSizedBox,
          Text(
            score,
            style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          4.spMin.hSizedBox,
          Text(
            title,
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          2.spMin.hSizedBox,
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10.spMin,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20.spMin,
          color: AppColors.blue,
        ),
        4.spMin.hSizedBox,
        Text(
          value,
          style: TextStyle(
            fontSize: 18.spMin,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        2.spMin.hSizedBox,
        Text(
          label,
          style: TextStyle(
            fontSize: 10.spMin,
            color: AppColors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    String name,
    String number,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12.spMin),
      decoration: BoxDecoration(
        color: AppColors.extraLightGrey,
        borderRadius: BorderRadius.circular(8.spMin),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.spMin),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.spMin),
            ),
            child: Icon(
              icon,
              size: 20.spMin,
              color: color,
            ),
          ),
          12.spMin.wSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                2.spMin.hSizedBox,
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 12.spMin,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Call emergency contact
            },
            icon: Icon(
              Icons.call,
              size: 20.spMin,
              color: AppColors.green,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.green.withValues(alpha: 0.1),
              minimumSize: Size(32.spMin, 32.spMin),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton(String text) {
    return InkWell(
      onTap: () {
        // Navigate to full list
      },
      borderRadius: BorderRadius.circular(8.spMin),
      child: Container(
        padding: EdgeInsets.all(12.spMin),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8.spMin),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14.spMin,
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.spMin.wSizedBox,
            Icon(
              Icons.arrow_forward_ios,
              size: 12.spMin,
              color: AppColors.blue,
            ),
          ],
        ),
      ),
    );
  }

  /// Listens to the logout state changes and navigates to the AppWrapper on success.
  void _listenToLogoutState() {
    ref.listen<LogoutState>(
      providerOfProfile.select((value) => value.logoutState),
      (previous, next) {
        next.maybeWhen(
          success: () => context.go(AppWrapper.route),
          orElse: () {},
        );
      },
    );
  }

  /// Shows a confirmation dialog for logging out.
  void _showLogoutDialog() {
    showConfirmationSheet(
      context: context,
      title: 'Are you sure you want to logout?',
      description: 'You will need to log in again to access your account.',
      onPressedConfirmAsync: (context, ref) =>
          ref.read(providerOfProfile.notifier).logout(),
    );
  }

  String _getInitials(String name) {
    final words = name.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    } else if (words.isNotEmpty) {
      return words[0][0].toUpperCase();
    }
    return 'U';
  }
}
