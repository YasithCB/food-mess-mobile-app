class MealModel {
  final String date;
  final String mealTime;
  bool isBooked;

  MealModel({
    required this.date,
    required this.mealTime,
    this.isBooked = false,
  });
}
