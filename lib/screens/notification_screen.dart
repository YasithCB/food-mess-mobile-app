import 'package:flutter/material.dart';
import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> notifications = [
    {
      "title": "Welcome to Val Graphics!",
      "message":
          "We’re excited to help you with branding, printing & advertising solutions.",
      "time": "Just now",
    },
    {
      "title": "New Offer",
      "message": "Flat 15% off on large format printing this week only!",
      "time": "20m ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor.withOpacity(0.1),
                child: Icon(
                  Icons.campaign, // Ads-related icon
                  color: primaryColor,
                ),
              ),
              title: Text(
                notification["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(notification["message"]!),
              trailing: Text(
                notification["time"]!,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              onTap: () {
                // Handle navigation (e.g., open project details, offers, etc.)
              },
            ),
          );
        },
      ),
    );
  }
}
