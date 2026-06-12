import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/api/meal_api.dart';
import 'package:food_mess_mobile_app/db/constants.dart';

import '../../models/meal1_model.dart';
import '../../util/date_util.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late Future<List<MealModel1>> _mealsFuture;

  @override
  void initState() {
    super.initState();
    _mealsFuture =
        MealApi.fetchAllMeals(); // Assuming you have this in your API class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Meals"),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () => {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<MealModel1>>(
              future: _mealsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No meals found."));
                }

                final meals = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: meals.length,
                  itemBuilder: (context, index) => _buildMealCard(meals[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(MealModel1 meal) {
    return Container(
      height: 150, // Define the total height of your card
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // 1. Full height image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              meal.imageUrl != null
                  ? '$baseUrl/${meal.imageUrl}'
                  : 'https://via.placeholder.com/150',
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          // 2. Content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                // Vertically center content
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    meal.description,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  if (meal.mealDate != null)
                    Text(
                      "${DateUtilsHelper.getRelativeDay(meal.mealDate!)} • ${meal.mealTime}",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 3. Price Trailing
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              "${meal.price.toStringAsFixed(0)} AED",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
