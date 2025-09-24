import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/auth/providers/service_providers.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/button.dart';
import 'package:hazard_app/others/app_wrapper.dart';

class HomeScreen extends ConsumerStatefulWidget {
  /// Displays the home screen of the app.
  const HomeScreen({super.key});

  static const route = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final email = ref.watch(
      providerOfLoggedInUser.select((value) => value?.email),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.spMin,
          children: <Widget>[
            Text('You are logged in as $email'),
            Button.filled(
              value: 'Log out',
              onPressed: () async {
                await ref.read(providerOfAuthService).logOut();
                if (!context.mounted) return;

                context.go(AppWrapper.route);
              },
            ),
          ],
        ).pX(20.0),
      ),
    );
  }
}
