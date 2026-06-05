import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/meal1_model.dart';

/* =========================================================
   FETCH ALL MEALS
========================================================= */
Future<List<MealModel1>> fetchMeals() async {
  final response = await http.get(Uri.parse("$baseUrl/meals"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    // Maps the nested response payload target array from your success wrapper
    final mealsList = (data['data'] as List)
        .map((m) => MealModel1.fromJson(m))
        .toList();
    return mealsList;
  } else {
    throw Exception("Failed to load meals from server");
  }
}

/* =========================================================
   FETCH MEALS BY TIME CATEGORY (Breakfast, Lunch, Dinner)
========================================================= */
Future<List<MealModel1>> fetchMealsByTime(String mealTime) async {
  final response = await http.get(Uri.parse("$baseUrl/meals/time/$mealTime"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    final mealsList = (data['data'] as List)
        .map((m) => MealModel1.fromJson(m))
        .toList();
    return mealsList;
  } else {
    throw Exception("Failed to load $mealTime meals");
  }
}