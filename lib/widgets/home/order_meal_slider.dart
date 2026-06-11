import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:flutter/material.dart';

import '../../models/meal_model.dart';

class OrderMealSlider extends StatefulWidget {
  const OrderMealSlider({super.key});

  @override
  State<OrderMealSlider> createState() => _OrderMealSliderState();
}

class _OrderMealSliderState extends State<OrderMealSlider> {

  final List<MealModel> mealTimes = [
    MealModel(date: "Today", mealTime: "Breakfast"),
    MealModel(date: "Today", mealTime: "Lunch"),
    MealModel(date: "Today", mealTime: "Dinner"),
    MealModel(date: "Tomorrow", mealTime: "Breakfast"),
    MealModel(date: "Tomorrow", mealTime: "Lunch"),
    MealModel(date: "Tomorrow", mealTime: "Dinner"),
  ];

  // Create your filtered list
  List<MealModel> get filteredMeals {
    final now = DateTime.now();
    final hour = now.hour;

    return mealTimes.where((item) {
      if (item.date.toLowerCase() != "today") return true;

      if (item.mealTime.toLowerCase() == "breakfast" && hour >= 3) return false;
      if (item.mealTime.toLowerCase() == "lunch" && hour >= 11) return false;
      if (item.mealTime.toLowerCase() == "dinner" && hour >= 15) return false;

      return true;
    }).toList();
  }

  bool isMealAvailable(String date, String mealTime) {
    final now = DateTime.now();
    final hour = now.hour;

    // If the item is for "Tomorrow" or later, it's always visible
    if (date.toLowerCase() != "today") {
      return true;
    }

    // Time-based logic for "Today"
    if (mealTime.toLowerCase() == "breakfast" && hour >= 3) return false;
    if (mealTime.toLowerCase() == "lunch" && hour >= 11) return false;
    if (mealTime.toLowerCase() == "dinner" && hour >= 15) return false;

    return true;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Your Meal'.toUpperCase(),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: Colors.white),
        ),

        const SizedBox(height: 12),
        SizedBox(
          height: 140, // enough space for image + title
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredMeals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7, // 🔥 adjust this
            ),
            itemBuilder: (context, index) {
              final item = filteredMeals[index];

              return InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: backgroundColor2
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 🔹 Date
                      Text(
                        item.date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // 🔹 Meal Time
                      Text(
                        item.mealTime,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // 🔹 Order Before Note
                      Text(
                        _getDeadlineNote(item.mealTime),
                        style: TextStyle(
                          fontSize: 10,
                          color: secondaryColor, // Using a different color to make it a 'note'
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 🔹 Book Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              item.isBooked = !item.isBooked;
                            });
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            item.isBooked ? Colors.grey : primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            item.isBooked ? "Booked" : "Book Now",
                            style: TextStyle(color: backgroundColor, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },
          ),
        ),
      ],
    );
  }
}
