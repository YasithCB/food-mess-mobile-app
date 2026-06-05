import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/order_model.dart';

/* =========================================================
   FETCH ORDER HISTORY FOR A SPECIFIC USER
   (Hits your compound index idx_user_orders for rapid loading)
========================================================= */
Future<List<OrderModel>> fetchCustomerOrders(String userId) async {
  final response = await http.get(Uri.parse("$baseUrl/orders/customer/$userId"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    // Parses user history items cleanly from standard API success template
    final historicalOrders = (body['data'] as List)
        .map((order) => OrderModel.fromJson(order))
        .toList();
    return historicalOrders;
  } else {
    throw Exception("Failed to load customer order tracking data");
  }
}

/* =========================================================
   PLACE A NEW BOOKING ORDER
========================================================= */
Future<OrderModel> placeOrder(OrderModel newOrder) async {
  final response = await http.post(
    Uri.parse("$baseUrl/orders"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(newOrder.toJson()),
  );

  if (response.statusCode == 201) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    // Returns the recorded database state including newly generated ORD key values
    return OrderModel.fromJson(body['data']);
  } else {
    throw Exception("Failed to lock in your booking confirmation entry");
  }
}