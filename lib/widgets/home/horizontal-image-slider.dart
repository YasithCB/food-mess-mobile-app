import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/models/meal1_model.dart';

import '../../api/meal_api.dart';
import '../../db/db.dart';

class HorizontalImageGrid extends StatefulWidget {
  const HorizontalImageGrid({super.key});

  @override
  State<HorizontalImageGrid> createState() => _HorizontalImageGridState();
}

class _HorizontalImageGridState extends State<HorizontalImageGrid> {
  // Declare the future variable
  late Future<List<MealModel1>> _mealsFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the network call exactly once when the widget mounts
    _mealsFuture = fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // enough space for image + title
      child: FutureBuilder(
        future: _mealsFuture,
        builder: (context, snapshot) {
          // 1. Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }

          // 2. Error State
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error loading menu: ${snapshot.error}",
                style: const TextStyle(color: Colors.red, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            );
          }

          // 3. Empty Data State
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No meals available right now."));
          }

          // 4. Data Ready State
          final mealsList = snapshot.data!;

          // Render your layout layout framework (e.g., a horizontal scrolling list)
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // only one row
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return InkWell(
                onTap: () {
                  // 🔹 Navigate to Service Details
                  // NavigationUtil.push(
                  //   context,
                  //   SubServiceDetailsScreen(service: item),
                  // );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.img,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 150,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
