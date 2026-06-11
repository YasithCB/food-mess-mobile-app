import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/util/date_util.dart';

import '../../api/what_next_api.dart';
import '../../models/what_next_model.dart';

class TodayTomorrowSpecial extends StatefulWidget {
  const TodayTomorrowSpecial({super.key});

  @override
  State<TodayTomorrowSpecial> createState() => _TodayTomorrowSpecialState();
}

class _TodayTomorrowSpecialState extends State<TodayTomorrowSpecial> {
  // Declare the future variable to monitor the network operation state
  late Future<List<WhatNextModel>> _timelineFuture;

  @override
  void initState() {
    super.initState();
    // Cache the asynchronous timeline window fetch exactly once on widget mount
    _timelineFuture = WhatNextApi.fetchTimelineWindow();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the "Window" of meals to show
    final now = DateTime.now();
    final hour = now.hour;

    // Pre-defined color palette list for your custom column decorations
    final List<Color> _cardColors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Quick Order".toUpperCase(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // 🔹 3-Column Layout
        FutureBuilder<List<WhatNextModel>>(
          future: _timelineFuture,
          builder: (context, snapshot) {
            // 1. Loading State Placeholder
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            // 2. Error State Placeholder
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Error loading timeline row: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            }

            // 3. Fallback Empty State
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("No schedule entries mapped out for today."),
              );
            }

            // 4. Data Ready State! Extract back-end array items
            final displayMeals = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(displayMeals.length, (index) {
                  final meal = displayMeals[index];

                  // Safely cycles through the color list based on item index location
                  final assignedColor = _cardColors[index % _cardColors.length];

                  return Expanded(
                    child: _buildMealColumn(
                      DateUtilsHelper.formatDate(meal.mealDate), // Mapped from 'day' string
                      meal.mealTime, // Mapped from 'time' string
                      meal.curries.join(', '),
                      // Merges the dynamic list array back into a single string line
                      assignedColor, // Dynamic color selection
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }

  String _getDeadlineNote(String mealTime) {
    switch (mealTime.toLowerCase()) {
      case 'breakfast':
        return "Order before 3 AM";
      case 'lunch':
        return "Order before 11 AM";
      case 'dinner':
        return "Order before 3 PM";
      default:
        return "";
    }
  }

  Widget _buildMealColumn(
    String day,
    String time,
    String curries,
    Color accentColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor2, // Your 0C1600 based dark tint
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Label
          Text(
            day.toUpperCase(),
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              color: accentColor,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          // Meal Time
          Text(
            time,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          // Divider Line
          Container(height: 2, width: 20, color: accentColor),
          const SizedBox(height: 10),
          // Curry List
          Text(
            curries,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity(0.6),
              height: 1.4,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 6),

          // 🔹 Order Before Note
          Text(
            _getDeadlineNote(time),
            style: TextStyle(
              fontSize: 10,
              color:
                  secondaryColor, // Using a different color to make it a 'note'
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Book Button
          ElevatedButton(
            onPressed: () {
              // todo
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Book Now",
              style: TextStyle(
                color: backgroundColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
