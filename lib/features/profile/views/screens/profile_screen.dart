import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/providers/home_tab_provider.dart';
import 'package:hazard_app/features/notification/views/screens/manage_notifications_screen.dart';
import 'package:hazard_app/features/profile/enums/my_hazards_tab_types.dart';
import 'package:hazard_app/features/profile/views/screens/support_request_screen.dart';
import 'package:hazard_app/features/profile/providers/my_hazards_provider.dart';
import 'package:hazard_app/features/profile/providers/profile_provider.dart';
import 'package:hazard_app/features/profile/providers/states/profile_provider_state.dart';
import 'package:hazard_app/features/profile/views/screens/delete_account_screen.dart';
import 'package:hazard_app/features/profile/views/screens/my_hazards_screen.dart';
import 'package:hazard_app/features/profile/views/widgets/accepted_hazards_widgets/my_accepted_hazards_list.dart';
import 'package:hazard_app/features/profile/views/widgets/profile_trust_card.dart';
import 'package:hazard_app/features/profile/views/widgets/profile_xp_progress.dart';
import 'package:hazard_app/features/profile/views/widgets/rejected_hazards_widgets/my_rejected_hazards_list.dart';
import 'package:hazard_app/features/shared/enums/user_badge_enum.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/utils/dialogs.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:hazard_app/others/app_wrapper.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    _listenToUpdateProfilePictureState();
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
                  _buildStatsSection(),
                  14.spMin.hSizedBox,
                  const ProfileTrustCard(),
                  24.spMin.hSizedBox,
                  _buildFamilySafetyCard(),
                  14.spMin.hSizedBox,
                  _buildLearnAndPrepareCard(),
                  24.spMin.hSizedBox,
                  _buildSubmittedHazardsSection(),
                  _buildFailedReviewsSection(),
                  _buildAccountSettingsSection(),
                  30.spMin.hSizedBox,
                  _buildLogoutSection(),
                  30.spMin.hSizedBox,
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
      expandedHeight: 220.spMin,
      floating: false,
      pinned: true,
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
                        fontSize: 20.0,
                        borderRadius: 10.0,
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
                color: AppColors.black.withValues(alpha: 0.9),
              ),
              padding: EdgeInsets.all(20.spMin),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10.spMin,
                      children: [
                        Expanded(
                          child: Row(
                            spacing: 15.spMin,
                            children: [
                              _buildUserAvatar(),
                              _buildUserName(
                                color: AppColors.white.withValues(alpha: 0.9),
                              ),
                            ],
                          ),
                        ),
                        _buildUserBadge(),
                      ],
                    ),
                    20.hSizedBox,
                    ProfileXpProgress().pB(10.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserName({
    final double fontSize = 20.0,
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
    final double size = 65.0,
    final double fontSize = 30.0,
    final double borderRadius = 20.0,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final userName = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.name ?? 'User',
          ),
        );
        return Container(
          width: size.spMin,
          height: size.spMin,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.orange300,
                AppColors.red200,
              ],
            ),
            borderRadius: BorderRadius.circular(borderRadius.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.orange300.withValues(alpha: 0.6),
                blurRadius: 10.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Center(
            child: Text(
              _getInitials(userName),
              style: TextStyle(
                fontSize: fontSize.spMin,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserBadge() {
    return Consumer(
      builder: (context, ref, child) {
        final userBadge = ref.watch(
          providerOfLoggedInUser.select(
            (value) => value?.userBadge ?? UserBadge.watcher,
          ),
        );

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.spMin,
            vertical: 5.spMin,
          ),
          decoration: BoxDecoration(
            color: AppColors.orange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.spMin),
            border: Border.all(
              color: AppColors.orange.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Text(
            '⚡️ ${userBadge.title}',
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.orange300,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatsSection() {
    return Row(
      spacing: 8.spMin,
      children: [
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final alertsMade = ref.watch(
                providerOfLoggedInUser.select(
                  (value) => value?.hazardsReportedCount ?? 0,
                ),
              );
              return _buildStatItem(
                value: alertsMade,
                label: 'ALRTs Made',
                valueColor: const Color(0xFFFF7F44),
              );
            },
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final alertsViewed = ref.watch(
                providerOfLoggedInUser.select(
                  (value) => value?.hazardsViewedCount ?? 0,
                ),
              );
              return _buildStatItem(
                value: alertsViewed,
                label: 'Viewed',
                valueColor: const Color(0xFF6199FF),
              );
            },
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final upvotesReceived = ref.watch(
                providerOfLoggedInUser.select(
                  (value) => value?.upvotesReceivedCount ?? 0,
                ),
              );
              return _buildStatItem(
                value: upvotesReceived,
                label: 'Upvotes',
                valueColor: const Color(0xFF39C05D),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubmittedHazardsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isEmpty = ref.watch(
          providerOfMyHazards.select(
            (value) => value.myAcceptedHazards.isEmpty,
          ),
        );
        if (isEmpty) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.spMin,
          children: [
            Text(
              'Recent ALRTs'.toUpperCase(),
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.grey.withValues(alpha: 0.6),
              ),
            ),
            MyAcceptedHazardsList(
              limit: 3,
              shinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            _buildViewAllButton(
              text: 'View All ALRTs',
              onPressed: _gotoMyAcceptedReportsScreen,
            ),
          ],
        ).pB(24.0);
      },
    );
  }

  Widget _buildFailedReviewsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final isEmpty = ref.watch(
          providerOfMyHazards.select(
            (value) => value.myRejectedHazards.isEmpty,
          ),
        );
        if (isEmpty) return const SizedBox();

        return Column(
          spacing: 10.spMin,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Needs Update'.toUpperCase(),
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.grey.withValues(alpha: 0.6),
              ),
            ),
            MyRejectedHazardsList(
              limit: 3,
              shinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            _buildViewAllButton(
              text: 'View All Pending',
              onPressed: _gotoMyRejectedReportsScreen,
            ),
          ],
        ).pB(24.0);
      },
    );
  }

  Widget _buildAccountSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.spMin,
      children: [
        Text(
          'Account'.toUpperCase(),
          style: TextStyle(
            fontSize: 14.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.grey.withValues(alpha: 0.6),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.spMin),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColorLight,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildAccountSettingsItem(
                title: 'Notifications',
                subtitle: 'Alert preferences & push settings',
                icon: LucideIcons.bell,
                color: AppColors.orange,
                onTap: _gotoManageNotificationsScreen,
              ),
              _buildAccountSettingsItem(
                title: 'Subscribed Locations',
                subtitle: 'Manage your subscribed locations',
                icon: LucideIcons.mapPin,
                color: AppColors.blue,
                onTap: _gotoSubscribedLocationsScreen,
              ),
              _buildAccountSettingsItem(
                title: 'Language',
                subtitle: _currentLanguageLabel(),
                icon: LucideIcons.globe,
                color: AppColors.purple,
                onTap: _showLanguagePicker,
              ),
              _buildAccountSettingsItem(
                title: 'Support Request',
                subtitle: 'Get help or submit feedback',
                icon: LucideIcons.messageSquare,
                color: AppColors.green,
                onTap: _gotoSupportRequestScreen,
              ),
              _buildAccountSettingsItem(
                title: 'Delete Account',
                subtitle: 'Permanently delete your account and data',
                icon: LucideIcons.trash2,
                color: AppColors.red,
                onTap: _gotoDeleteAccountScreen,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutSection() {
    return Button.gradient(
      value: 'Logout',
      icon: Icon(Icons.logout),
      onPressed: () {
        _showLogoutDialog();
      },
    );
  }

  /// Indigo hero card promoting Family Safety — jumps to the Family tab.
  Widget _buildFamilySafetyCard() {
    const familyIndigo = Color(0xFF5B5BD6);
    return GestureDetector(
      onTap: () =>
          ref.read(providerOfHomeTab.notifier).state = HomeTab.family,
      child: Container(
        padding: EdgeInsets.all(18.spMin),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [familyIndigo, Color(0xFF7C7CE0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.spMin),
          boxShadow: [
            BoxShadow(
              color: familyIndigo.withValues(alpha: 0.35),
              blurRadius: 12.0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46.spMin,
              height: 46.spMin,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(14.spMin),
              ),
              child: Icon(
                LucideIcons.users,
                color: AppColors.white,
                size: 24.spMin,
              ),
            ),
            14.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Family Safety',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17.spMin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Check in and see who is near an alert',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.85),
                      fontSize: 12.spMin,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevronRight,
              color: AppColors.white,
              size: 20.spMin,
            ),
          ],
        ),
      ),
    );
  }

  /// Learn & Prepare card — opens the safety guides hub.
  Widget _buildLearnAndPrepareCard() {
    return GestureDetector(
      onTap: () => context.push('/learn'),
      child: Container(
        padding: EdgeInsets.all(18.spMin),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.spMin),
          border: Border.all(
            color: AppColors.orange.withValues(alpha: 0.4),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColorLight,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46.spMin,
              height: 46.spMin,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.orange, Color(0xFFE8492E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14.spMin),
              ),
              child: Icon(
                LucideIcons.bookOpen,
                color: AppColors.white,
                size: 24.spMin,
              ),
            ),
            14.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learn & Prepare',
                    style: TextStyle(
                      fontSize: 17.spMin,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Safety guides for before, during and after',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.spMin,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevronRight,
              color: AppColors.grey,
              size: 20.spMin,
            ),
          ],
        ),
      ),
    );
  }

  String _currentLanguageLabel() {
    return switch (context.locale.languageCode) {
      'es' => 'Español',
      _ => 'English',
    };
  }

  /// Bottom sheet to switch between the supported languages.
  void _showLanguagePicker() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.spMin)),
      ),
      builder: (sheetContext) {
        final currentCode = context.locale.languageCode;
        Widget languageTile({
          required String code,
          required String title,
          required String subtitle,
        }) {
          final isSelected = currentCode == code;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: isSelected
                  ? AppColors.orange
                  : AppColors.grey.withValues(alpha: 0.15),
              child: Text(
                code.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.grey,
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(subtitle, style: TextStyle(fontSize: 12.spMin)),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: AppColors.orange)
                : null,
            onTap: () {
              context.setLocale(Locale(code));
              Navigator.of(sheetContext).pop();
            },
          );
        }

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.spMin),
                child: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              languageTile(
                code: 'en',
                title: 'English',
                subtitle: 'English',
              ),
              // Spanish hidden until the app is actually localised — only ~5
              // strings are translated today, so switching locale changes
              // nothing visible. Restore this tile when full l10n lands.
              // languageTile(
              //   code: 'es',
              //   title: 'Español',
              //   subtitle: 'Spanish',
              // ),
              Padding(
                padding: EdgeInsets.all(16.spMin),
                child: Text(
                  'Official warnings are shown in their original English wording where a verified translation is not yet available.',
                  style: TextStyle(
                    fontSize: 11.spMin,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem({
    required final int value,
    required final String label,
    required final Color valueColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColorLight,
            blurRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 14.spMin,
        horizontal: 10.spMin,
      ),
      child: Column(
        spacing: 2.spMin,
        children: [
          Text(
            NumberFormat.compact().format(value),
            style: GoogleFonts.poppins(
              fontSize: 30.spMin,
              fontWeight: FontWeight.bold,
              color: valueColor,
              height: 1.0,
            ),
          ),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12.spMin,
              color: AppColors.grey.withValues(alpha: 0.5),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsItem({
    required final String title,
    required final String subtitle,
    required final IconData icon,
    required final Color color,
    required final VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 48.spMin,
            height: 48.spMin,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14.spMin),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 20.spMin,
                color: color,
              ),
            ),
          ),
          16.wSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                2.spMin.hSizedBox,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.spMin,
                    color: AppColors.grey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.lightGrey,
            size: 20.spMin,
          ),
        ],
      ),
    ).onPressed(onTap);
  }

  Widget _buildViewAllButton({
    required final String text,
    final Function()? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16.spMin),
      child: Container(
        padding: EdgeInsets.all(16.spMin),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.lightGrey.withValues(alpha: 0.5),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(16.spMin),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColorLight,
              blurRadius: 2.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14.spMin,
                color: AppColors.grey.withValues(alpha: 0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            8.spMin.wSizedBox,
            Icon(
              LucideIcons.arrowRight500,
              size: 16.spMin,
              color: AppColors.grey.withValues(alpha: 0.7),
            ),
          ],
        ),
      ),
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

  // ignore: unused_element
  String _reliabilityDescription(double score) {
    if (score >= 0.8) {
      return 'Excellent';
    } else if (score >= 0.6) {
      return 'Good';
    } else if (score >= 0.4) {
      return 'Average';
    } else if (score >= 0.2) {
      return 'Below Average';
    } else {
      return 'Poor';
    }
  }

  /// Listens to the profile picture update state changes and shows appropriate toasts.
  void _listenToUpdateProfilePictureState() {
    ref.listen<ProfilePictureUpdateState>(
      providerOfProfile.select(
        (value) => value.profilePictureUpdateState,
      ),
      (previous, next) {
        next.maybeWhen(
          error: (_) => context.showErrorToast(
            message: 'Failed to update profile picture. Please try again.',
          ),
          orElse: () {},
        );
      },
    );
  }

  /// Listens to the logout state changes and navigates to the AppWrapper on success.
  void _listenToLogoutState() {
    ref.listen<LogoutState>(
      providerOfProfile.select((value) => value.logoutState),
      (previous, next) {
        next.maybeWhen(
          success: () => context.go(AppWrapper.route),
          error: (_) => context.showErrorToast(
            message: 'Failed to logout. Please try again.',
          ),
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

  /// Navigates to the My Accepted Reports screen.
  void _gotoMyAcceptedReportsScreen() {
    context.push(
      MyHazardsScreen.route,
      extra: const MyHazardsScreenArgs(
        initialTab: MyHazardsTab.accepted,
      ),
    );
  }

  /// Navigates to the My Rejected Reports screen.
  void _gotoMyRejectedReportsScreen() {
    context.push(
      MyHazardsScreen.route,
      extra: const MyHazardsScreenArgs(
        initialTab: MyHazardsTab.rejected,
      ),
    );
  }

  /// Navigates to the Manage Notifications screen.
  void _gotoManageNotificationsScreen() {
    context.push(
      ManageNotificationsScreen.route,
      extra: const ManageNotificationsScreenArgs(initialTab: 0),
    );
  }

  /// Navigates to the Subscribed Locations screen.
  void _gotoSubscribedLocationsScreen() {
    context.push(
      ManageNotificationsScreen.route,
      extra: const ManageNotificationsScreenArgs(initialTab: 1),
    );
  }

  /// Navigates to the Support Request screen.
  void _gotoSupportRequestScreen() {
    context.push(SupportRequestScreen.route);
  }

  /// Navigates to the Delete Account screen.
  void _gotoDeleteAccountScreen() {
    context.push(DeleteAccountScreen.route);
  }
}
