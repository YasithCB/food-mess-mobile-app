import 'package:flutter/material.dart';

class SnackBarUtil {
  // Show a snackbar (replaces any current one)
  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    final messenger = ScaffoldMessenger.of(context);

    // Hide or clear any previous snackbar
    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(content: Text(message), duration: duration),
    );
  }

  // Hide current snackbar
  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  // Clear all snackbars (Flutter 3.7+)
  static void clear(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}
