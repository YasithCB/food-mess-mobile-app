import 'package:flutter/material.dart';

import '../db/constants.dart';

Future<bool> confirmAction(
  BuildContext context,
  String title,
  String message,
) async {
  final confirm = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text("Confirm"),
          ),
        ],
      );
    },
  );

  return confirm ?? false;
}

/// Formats a clean endpoint URL path string by combining the Base URI domain
/// and target endpoint without duplicating forward slashes.
String formatUrl(String baseUrl, String endpointPath) {
  if (endpointPath.isEmpty) return baseUrl;

  // If the path is already full (e.g. external network assets), return as-is
  if (endpointPath.startsWith("http://") || endpointPath.startsWith("https://")) {
    return endpointPath;
  }

  // Strip trailing slashes from the base URL
  final cleanBase = baseUrl.endsWith("/")
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;

  // Strip leading slashes from the endpoint path
  final cleanPath = endpointPath.startsWith("/")
      ? endpointPath.substring(1)
      : endpointPath;

  return "$cleanBase/$cleanPath";
}
