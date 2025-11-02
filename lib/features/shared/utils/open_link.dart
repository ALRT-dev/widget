import 'package:flutter/material.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens a link in the default browser.
///
/// [context] is the BuildContext to show error toasts if needed.
/// [link] is the URL to be opened.
Future<void> openLink({
  required final BuildContext context,
  required final String link,
}) async {
  return runAsyncCall(
    name: 'openLink',
    future: () async {
      final uri = Uri.parse(link);
      final result = await launchUrl(uri);
      if (!result) throw AppError(message: 'Could not open link $link');
    },
    onError: (error) {
      context.showErrorToast(
        message: error.message,
      );
    },
  );
}
