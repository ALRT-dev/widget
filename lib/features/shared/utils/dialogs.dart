import 'package:flutter/cupertino.dart';
import 'package:hazard_app/others/app_colors.dart';

/// Displays a custom implementation of [showCupertinoModalPopup].
Future<T?> showCustomCupertinoModalPopup<T>({
  required final BuildContext context,
  required final Widget Function(BuildContext) builder,
  final bool barrierDismissible = true,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Dismiss',
    barrierColor: AppColors.black.withValues(alpha: 0.2),
    transitionDuration: Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeOutCubic,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset(0, 0),
        ).animate(curvedAnimation),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
  );
}
