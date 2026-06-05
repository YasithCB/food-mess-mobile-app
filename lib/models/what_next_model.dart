import 'dart:convert';

class WhatNextModel {
  final int id;
  final String mealDate; // YYYY-MM-DD format representation
  final String mealTime; // Breakfast, Lunch, or Dinner
  final List<String> curries; // Parsed out from database comma-separated text lines

  WhatNextModel({
    required this.id,
    required this.mealDate,
    required this.mealTime,
    required this.curries,
  });

  // Factory constructor handles parsing raw text lines into clean native lists
  factory WhatNextModel.fromJson(Map<String, dynamic> json) {
    // Splits comma separated database lists (e.g. "Dal, Chicken Curry, Rice") into clean arrays
    var curriesData = json['curries']?.toString() ?? '';
    List<String> curriesList = curriesData.isNotEmpty
        ? curriesData.split(',').map((item) => item.trim()).toList()
        : [];

    return WhatNextModel(
      id: json['id'] as int,
      mealDate: json['meal_date'] as String,
      mealTime: json['meal_time'] as String,
      curries: curriesList,
    );
  }

  // Packs properties into a standard JSON body for structural transmission
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meal_date': mealDate,
      'meal_time': mealTime,
      'curries': curries.join(', '), // Glues array back to plain text line for database insertion
    };
  }
}