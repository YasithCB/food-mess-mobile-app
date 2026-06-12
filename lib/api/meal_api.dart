import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/meal1_model.dart';
import '../util/logger_util.dart';
import '../util/storage_util.dart';

class MealApi {

  static Future<List<MealModel1>> fetchAllMeals() async {
    final String url = "$baseUrl/meals";
    final String? token = await StorageUtil.getToken();

    try {
      LoggerUtil.logRequest(method: "GET", url: url);
      final response = await http.get(
          Uri.parse(url),
          headers: {"Authorization": "Bearer $token"}
      );

      final Map<String, dynamic> result = _handleResponse(response);
      if (result["success"] == true && result["data"] != null) {
        return (result["data"] as List).map((m) => MealModel1.fromJson(m)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<MealModel1>> fetchMealsByTime(String mealTime) async {
    final String url = "$baseUrl/meals/time/$mealTime";
    final String? token = await StorageUtil.getToken();

    try {
      final response = await http.get(
          Uri.parse(url),
          headers: {"Authorization": "Bearer $token"}
      );

      final Map<String, dynamic> result = _handleResponse(response);
      if (result["success"] == true && result["data"] != null) {
        return (result["data"] as List).map((m) => MealModel1.fromJson(m)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /* ==========================================================================
     INTERNAL UTILITY (Same as WhatNextApi)
  ========================================================================== */
  static Map<String, dynamic> _handleResponse(http.Response response) {
    LoggerUtil.logResponse(
      url: response.request?.url.toString() ?? "",
      statusCode: response.statusCode,
      body: response.body,
    );

    try {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      // 🔹 Changed to check status == success as per your API response
      return {
        "success": decoded["status"] == "success",
        "data": decoded["data"],
        "message": decoded["message"] ?? ""
      };
    } catch (_) {
      return {"success": false, "message": "Parsing error"};
    }
  }
}