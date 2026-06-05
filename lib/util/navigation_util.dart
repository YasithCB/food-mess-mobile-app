import 'package:flutter/material.dart';

class NavigationUtil {
  static void _clearPopups(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    // You can also close other popups/dialogs if needed
  }

  static Future<T?> push<T>(BuildContext context, Widget screen) {
    _clearPopups(context);
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static Future<T?> pushReplacement<T>(BuildContext context, Widget screen) {
    _clearPopups(context);
    return Navigator.pushReplacement<T, T>(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static Future<T?> pushAndRemoveUntil<T>(BuildContext context, Widget screen) {
    _clearPopups(context);
    return Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    _clearPopups(context);
    Navigator.pop<T>(context, result);
  }
}
