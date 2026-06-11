import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/widgets/admin/dashboard_button_grid.dart';

import '../../db/constants.dart';
import '../../util/date_util.dart';
import '../../util/navigation_util.dart';
import '../../widgets/home/horizontal-image-slider.dart';
import '../../widgets/home/recent_orders.dart';
import '../../widgets/home/summary_card.dart';
import '../../widgets/home/today_tomorrow_special.dart';
import '../notification_screen.dart';
import '../tabs/menu_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});
  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Ensure Scaffold is used for proper background handling
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 PRIMARY HEADER SECTION
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor, // Your A6CA30 color
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false, // Don't add safe area at the bottom of this box
                child: Column(
                  children: [
                    // --- Hello Row ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white24,
                                backgroundImage: AssetImage("assets/images/avatar.png"),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello, ${currentUser != null? currentUser!.name : 'Admin'}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black, // Dark text on lime primary
                                    ),
                                  ),
                                  Text(
                                    DateUtilsHelper.formattedToday(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: backgroundColor, // Semi-transparent white
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () => NavigationUtil.push(context, NotificationScreen()),
                              icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // --- Summary Card Inside the Box ---
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: MonthlySummaryCard(
                        onPayTap: () {}, userId: '1',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 MAIN BODY SECTION (Content below the box)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  DashboardButtonGrid(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
