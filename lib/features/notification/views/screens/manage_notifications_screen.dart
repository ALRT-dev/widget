import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class ManageNotificationsScreen extends ConsumerStatefulWidget {
  const ManageNotificationsScreen({super.key});

  static const route = '/manage-notifications';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageNotificationsScreenState();
}

class _ManageNotificationsScreenState
    extends ConsumerState<ManageNotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Notification toggles state - all enabled by default
  Map<String, bool> notificationSettings = {
    'emergency': true,
    'watchAndAct': true,
    'advice': true,
    'information': true,
    'crowdAlertUnconfirmed': true,
    'crowdAlertEmerging': true,
    'crowdAlertVerified': true,
  };

  // Mock location subscriptions data
  List<LocationSubscription> locationSubscriptions = [
    LocationSubscription(
      id: '1',
      name: 'Sydney CBD',
      address: 'Sydney, New South Wales, Australia',
      subscribedDate: DateTime.now().subtract(Duration(days: 30)),
    ),
    LocationSubscription(
      id: '2',
      name: 'Melbourne Central',
      address: 'Melbourne, Victoria, Australia',
      subscribedDate: DateTime.now().subtract(Duration(days: 15)),
    ),
    LocationSubscription(
      id: '3',
      name: 'Brisbane City',
      address: 'Brisbane, Queensland, Australia',
      subscribedDate: DateTime.now().subtract(Duration(days: 7)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Notifications',
          style: TextStyle(
            fontSize: 18.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.spMin),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: AppColors.transparent,
          tabs: [
            Tab(
              icon: Icon(Icons.notifications_outlined),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.location_on_outlined),
              text: 'Locations',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationCategoriesTab(),
          _buildLocationSubscriptionsTab(),
        ],
      ),
    );
  }

  Widget _buildNotificationCategoriesTab() {
    return Padding(
      padding: EdgeInsets.all(16.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification Categories',
            style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          8.spMin.hSizedBox,
          Text(
            'Choose which types of alrts you want to receive on your device.',
            style: TextStyle(
              fontSize: 14.spMin,
              color: AppColors.grey,
            ),
          ),
          16.spMin.hSizedBox,
          Expanded(
            child: _buildNotificationCategoriesContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSubscriptionsTab() {
    return Padding(
      padding: EdgeInsets.all(16.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location Subscriptions',
            style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          8.spMin.hSizedBox,
          Text(
            'Manage your subscribed locations for targeted hazard alrts.',
            style: TextStyle(
              fontSize: 14.spMin,
              color: AppColors.grey,
            ),
          ),
          16.spMin.hSizedBox,
          Expanded(
            child: _buildLocationSubscriptionsContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCategoriesContent() {
    return ListView(
      children: [
        _buildNotificationTile(
          title: 'Emergency Warning',
          subtitle: 'Immediate life-threatening situations',
          color: AppColors.red,
          emoji: '🔴',
          key: 'emergency',
        ),
        _buildNotificationTile(
          title: 'Watch & Act',
          subtitle: 'Conditions are changing, stay alert',
          color: AppColors.orange,
          emoji: '🟠',
          key: 'watchAndAct',
        ),
        _buildNotificationTile(
          title: 'Advice',
          subtitle: 'General information and updates',
          color: AppColors.yellow,
          emoji: '🟡',
          key: 'advice',
        ),
        _buildNotificationTile(
          title: 'Information',
          subtitle: 'Non-urgent informational updates',
          color: AppColors.blue,
          emoji: '🔵',
          key: 'information',
        ),
        _buildNotificationTile(
          title: 'Crowd Alert (Unconfirmed)',
          subtitle: 'User-reported incidents awaiting verification',
          color: AppColors.grey,
          emoji: '⚪',
          key: 'crowdAlertUnconfirmed',
        ),
        _buildNotificationTile(
          title: 'Crowd Alert (Emerging)',
          subtitle: 'Reports under investigation',
          color: Colors.brown,
          emoji: '🟤',
          key: 'crowdAlertEmerging',
        ),
        _buildNotificationTile(
          title: 'Crowd Alert (Verified)',
          subtitle: 'Confirmed community-reported incidents',
          color: AppColors.green,
          emoji: '🟢',
          key: 'crowdAlertVerified',
        ),
      ],
    );
  }

  Widget _buildLocationSubscriptionsContent() {
    if (locationSubscriptions.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: locationSubscriptions.length,
      itemBuilder: (context, index) {
        return _buildLocationTile(locationSubscriptions[index]);
      },
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String subtitle,
    required Color color,
    required String emoji,
    required String key,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.spMin),
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.spMin),
        side: BorderSide(
          color: notificationSettings[key]!
              ? color.withValues(alpha: 0.5)
              : AppColors.lightGrey.withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.spMin),
        child: Row(
          children: [
            Container(
              width: 40.spMin,
              height: 40.spMin,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.spMin),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 18.spMin,
                  ),
                ),
              ),
            ),
            12.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  2.spMin.hSizedBox,
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            Switch.adaptive(
              value: notificationSettings[key]!,
              onChanged: (value) {
                setState(() {
                  notificationSettings[key] = value;
                });
              },
              activeTrackColor: color.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationTile(LocationSubscription subscription) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.spMin),
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.spMin),
        side: BorderSide(
          color: AppColors.lightGrey.withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.spMin),
        child: Row(
          children: [
            Container(
              width: 40.spMin,
              height: 40.spMin,
              decoration: BoxDecoration(
                color: AppColors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.spMin),
              ),
              child: Icon(
                Icons.place,
                color: AppColors.blue,
                size: 20.spMin,
              ),
            ),
            12.spMin.wSizedBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subscription.name,
                    style: TextStyle(
                      fontSize: 15.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  2.spMin.hSizedBox,
                  Text(
                    subscription.address,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey,
                      height: 1.3,
                    ),
                  ),
                  2.spMin.hSizedBox,
                  Text(
                    'Subscribed ${_formatDate(subscription.subscribedDate)}',
                    style: TextStyle(
                      fontSize: 11.spMin,
                      color: AppColors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => _showUnsubscribeDialog(subscription),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.spMin,
                  vertical: 4.spMin,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Unsubscribe',
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off_outlined,
            size: 48.spMin,
            color: AppColors.grey,
          ),
          16.spMin.hSizedBox,
          Text(
            'No Location Subscriptions',
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
          8.spMin.hSizedBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.spMin),
            child: Text(
              'You haven\'t subscribed to any locations yet. Add locations to receive targeted alerts.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.spMin,
                color: AppColors.grey,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'today';
    } else if (difference == 1) {
      return 'yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else if (difference < 30) {
      final weeks = (difference / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else {
      final months = (difference / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    }
  }

  void _showUnsubscribeDialog(LocationSubscription subscription) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.spMin),
        ),
        title: Text(
          'Unsubscribe from Location',
          style: TextStyle(
            fontSize: 18.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Are you sure you want to unsubscribe from "${subscription.name}"? You will no longer receive alerts for this location.',
          style: TextStyle(
            fontSize: 14.spMin,
            color: AppColors.grey,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                locationSubscriptions.removeWhere(
                  (s) => s.id == subscription.id,
                );
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Unsubscribed from ${subscription.name}'),
                  backgroundColor: AppColors.green,
                ),
              );
            },
            child: Text(
              'Unsubscribe',
              style: TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationSubscription {
  final String id;
  final String name;
  final String address;
  final DateTime subscribedDate;

  LocationSubscription({
    required this.id,
    required this.name,
    required this.address,
    required this.subscribedDate,
  });
}
