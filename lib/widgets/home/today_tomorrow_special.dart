import 'package:flutter/material.dart';
import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';

class TodayTomorrowSpecial extends StatelessWidget {
  const TodayTomorrowSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the "Window" of meals to show
    final now = DateTime.now();
    final hour = now.hour;

    List<Map<String, dynamic>> displayMeals = [];

    // Master Data
    final allMeals = [
      {'day': 'Today', 'time': 'Breakfast', 'curries': 'Dhal, Sambol, Fish, Beans', 'color': const Color(0xFFFFB347)}, // Sunrise Orange
      {'day': 'Today', 'time': 'Lunch', 'curries': 'Chicken, Mellum, Dhal, Cashew', 'color': const Color(0xFFA6CA30)},  // Your Lime
      {'day': 'Today', 'time': 'Dinner', 'curries': 'Salmon Fry, Potato Curry, Sambola', 'color': const Color(0xFF4FAAFF)},  // Night Blue
      {'day': 'Tomorrow', 'time': 'Breakfast', 'curries': 'Cutlet, Wambatu Moju, Fish EbulThiyal', 'color': const Color(0xFFFFB347)},
      {'day': 'Tomorrow', 'time': 'Lunch', 'curries': 'Fish, Potato Curry, Dhal', 'color': const Color(0xFFA6CA30)},
      {'day': 'Tomorrow', 'time': 'Dinner', 'curries': 'Halmesso Fry, Dhal, Sambola', 'color': const Color(0xFF4FAAFF)},
    ];

    // Sliding Window Logic
    if (hour < 10) displayMeals = allMeals.sublist(0, 3);
    else if (hour < 15) displayMeals = allMeals.sublist(1, 4);
    else if (hour < 21) displayMeals = allMeals.sublist(2, 5);
    else displayMeals = allMeals.sublist(3, 6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Quick Order".toUpperCase(),
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: Colors.white),
          ),
        ),
        const SizedBox(height: 12),
        // 🔹 3-Column Layout
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: displayMeals.map((meal) => Expanded(
              child: _buildMealColumn(
                  meal['day'],
                  meal['time'],
                  meal['curries'],
                  meal['color']
              ),
            )).toList(),
          ),
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

  Widget _buildMealColumn(String day, String time, String curries, Color accentColor) {
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
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: accentColor, letterSpacing: 1),
          ),
          const SizedBox(height: 4),
          // Meal Time
          Text(
            time,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
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
                fontStyle: FontStyle.italic
            ),
          ),
          const SizedBox(height: 6),

          // 🔹 Order Before Note
          Text(
            _getDeadlineNote(time),
            style: TextStyle(
              fontSize: 10,
              color: secondaryColor, // Using a different color to make it a 'note'
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Book Button
          ElevatedButton(
            onPressed: () {
              // todo
            },

            style: ElevatedButton.styleFrom(
              backgroundColor:
              primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Book Now",
              style: TextStyle(color: backgroundColor, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}