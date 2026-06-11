import 'package:food_mess_mobile_app/db/db.dart';
import 'package:flutter/material.dart';

import '../../api/meal_api.dart';
import '../../models/meal1_model.dart';
import '../../widgets/service_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Section Title
            Text(
              'Our Menu'.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Services List
            Expanded(
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
                    return const Center(
                      child: Text("No meals available right now."),
                    );
                  }

                  // 4. Data Ready State
                  final mealsList = snapshot.data!;

                  // Render your layout layout framework (e.g., a horizontal scrolling list)
                  return ListView.builder(
                    itemCount: mealsList.length,
                    itemBuilder: (context, index) {
                      final item = mealsList[index];
                      return MenuCard(meal: item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
