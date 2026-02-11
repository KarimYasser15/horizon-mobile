import 'package:flutter/material.dart';

/// Shows a centered loading overlay. Call [hideLoading] when done.
void showLoading(BuildContext context) {
  if (UIUtils._isLoading) return;
  UIUtils._isLoading = true;
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black26,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

/// Hides the loading overlay shown by [showLoading].
void hideLoading(BuildContext context) {
  if (!UIUtils._isLoading) return;
  UIUtils._isLoading = false;
  Navigator.of(context, rootNavigator: true).pop();
}

abstract class UIUtils {
  static bool _isLoading = false;
}
