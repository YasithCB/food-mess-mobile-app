import 'package:flutter/material.dart';

import '../../db/constants.dart';
import '../../widgets/home/recent_orders.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Recent Orders".toUpperCase(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
          const SizedBox(height: 8),

          // Use Expanded if this is inside a Column for the whole screen
          ListView(
            shrinkWrap: true, // Use this if inside another scrollable
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildHistoryItem("20 April", "Lunch", "Rice",6, 1),
              _buildHistoryItem("20 April", "Breakfast", "Rice (Red)",6.50, 1),
              _buildHistoryItem("19 April", "Dinner","String Hoppers",12, 2),
              _buildHistoryItem("19 April", "Lunch","Rice",6, 1),
            ],
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String mealTime, String mealType, double unitPrice, int qty) {
    // 🔹 Define colors and icons based on meal time
    IconData mealIcon;

    switch (mealTime.toLowerCase()) {
      case 'breakfast':
        mealIcon = Icons.wb_sunny_outlined;
        break;
      case 'lunch':
        mealIcon = Icons.lunch_dining_outlined;
        break;
      case 'dinner':
        mealIcon = Icons.dark_mode_outlined;
        break;
      default:
        mealIcon = Icons.restaurant_menu;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        // Soft background tint of the main color
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withOpacity(0.15)),
      ),
      child: IntrinsicHeight( // Ensures the vertical line matches the height
        child: Row(
          children: [
            // 1. Left Accent Bar
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // 2. Icon & Meal Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: secondaryColor.withOpacity(0.1),
                child: Icon(mealIcon, color: secondaryColor, size: 20),
              ),
            ),

            const SizedBox(width: 12),

            // 3. Date and Meal Title
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealTime,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // 4. Meal Type and price
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealType,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    "$unitPrice AED",
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // 5. Quantity Badge
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$qty ${ qty>1 ? "Parcels" : "Parcel"}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
