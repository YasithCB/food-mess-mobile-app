import 'package:food_mess_mobile_app/app.dart';
import 'package:food_mess_mobile_app/screens/tabs/menu_screen.dart';
import 'package:food_mess_mobile_app/widgets/home/order_meal_slider.dart';
import 'package:food_mess_mobile_app/widgets/home/recent_orders.dart';
import 'package:food_mess_mobile_app/widgets/home/today_tomorrow_special.dart';
import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/screens/notification_screen.dart';
import 'package:food_mess_mobile_app/util/navigation_util.dart';

import '../../util/date_util.dart';
import '../../widgets/home/horizontal-image-slider.dart';
import '../../widgets/home/summary_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final PageController _pageController = PageController();
  final int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                                    "Hello, ${currentUser != null? currentUser!.name : 'Guest'}",
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
                  TodayTomorrowSpecial(),
                  const SizedBox(height: 24),

                  RecentOrders(),
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'What We Have'.toUpperCase(),
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () => NavigationUtil.push(context, MenuScreen()),
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  HorizontalImageGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  final String imagePath;
  const BannerCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
