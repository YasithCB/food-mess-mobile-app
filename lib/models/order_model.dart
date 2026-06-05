import 'dart:convert';

class OrderModel {
  final String orderId; // Alpha-numeric primary key format (e.g., ORD-001)
  final String userId; // Links to your customer identifier schema
  final DateTime mealDate; // YYYY-MM-DD
  final String mealTime; // Breakfast, Lunch, Dinner
  final String mealName;
  final int qty;
  final double unitPrice;
  final double totalPrice; // Calculated automatically on the database layer
  final DateTime? dateCreated;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.mealDate,
    required this.mealTime,
    required this.mealName,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
    this.dateCreated,
  });

  // Factory constructor handles mapping database field strings into clean runtime variables
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as String,
      userId: json['user_id'].toString(),
      // Securely matches whether stored as int or string
      // 🔹 Converts "2026-06-05" into a native Flutter DateTime object
      mealDate: DateTime.parse(json['meal_date'] as String),
      mealTime: json['meal_time'] as String,
      mealName: json['meal_name'] as String,
      qty: json['qty'] as int,
      unitPrice: double.parse(json['unit_price'].toString()),
      totalPrice: double.parse(json['total_price'].toString()),
      // 🔹 Safely parses the full timestamp string into a DateTime object, returns null if missing
      dateCreated: json['date_created'] != null
          ? DateTime.tryParse(json['date_created'] as String)
          : null,
    );
  }

  // Packs fields for transport. Note that total_price is excluded since it is a STORED GENERATED column.
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'meal_date': mealDate,
      'meal_time': mealTime,
      'meal_name': mealName,
      'qty': qty,
      'unit_price': unitPrice.toStringAsFixed(2),
    };
  }
}
