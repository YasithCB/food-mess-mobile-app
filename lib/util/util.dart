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
