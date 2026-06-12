class MealModel1 {
  final String id;
  final String mealTime;
  final DateTime? mealDate; // 🔹 Made nullable because API doesn't always send it
  final String name;
  final double price;
  final String? imageUrl;
  final String description;

  MealModel1({
    required this.id,
    required this.mealTime,
    this.mealDate, // 🔹 Optional
    required this.name,
    required this.price,
    this.imageUrl,
    required this.description,
  });

  factory MealModel1.fromJson(Map<String, dynamic> json) {
    return MealModel1(
      id: json['id']?.toString() ?? '',
      mealTime: json['meal_time']?.toString() ?? '',
      // 🔹 Safe parsing: if meal_date is missing, default to now or null
      mealDate: json['meal_date'] != null
          ? DateTime.tryParse(json['meal_date'].toString())
          : DateTime.now(),
      name: json['name']?.toString() ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0.0') ?? 0.0,
      imageUrl: json['image_url']?.toString(),
      description: json['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meal_time': mealTime,
      'meal_date': mealDate?.toIso8601String(),
      'name': name,
      'price': price.toStringAsFixed(2),
      'image_url': imageUrl,
      'description': description,
    };
  }
}