import 'dart:convert';

class MealModel1 {
  final String id;
  final String mealTime;
  final String name;
  final double price;
  final String? imageUrl;
  final String description;

  MealModel1({
    required this.id,
    required this.mealTime,
    required this.name,
    required this.price,
    this.imageUrl,
    required this.description,
  });

  // Factory constructor to handle incoming JSON object keys cleanly
  factory MealModel1.fromJson(Map<String, dynamic> json) {
    return MealModel1(
      id: json['id'] as String,
      mealTime: json['meal_time'] as String,
      name: json['name'] as String,
      // Safely parse double string types coming from the backend decimals
      price: double.parse(json['price'].toString()),
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String,
    );
  }

  // Converts model variables back to JSON for POST/PUT requests
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meal_time': mealTime,
      'name': name,
      'price': price.toStringAsFixed(2),
      'image_url': imageUrl,
      'description': description,
    };
  }
}