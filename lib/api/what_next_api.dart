import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/what_next_model.dart';
import '../util/logger_util.dart';
import '../util/storage_util.dart';

class WhatNextApi {

  /* ==========================================================================
     1. FETCH THE ACTIVE SLIDING TIMELINE WINDOW
     (Feeds the 3-Column Flutter Home Menu Widget Row)
  ========================================================================== */
  static Future<List<WhatNextModel>> fetchTimelineWindow() async {
    final String url = "$baseUrl/what-next/timeline/window";
    final String? token = await StorageUtil.getToken();

    try {
      LoggerUtil.logRequest(method: "GET", url: url);

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final Map<String, dynamic> result = _handleResponse(response);
      if (result["success"] == true && result["data"] != null) {
        final List<dynamic> dataList = result["data"];
        return dataList.map((slot) => WhatNextModel.fromJson(slot)).toList();
      }
      return [];
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return [];
    }
  }

  /* ==========================================================================
     2. FETCH COMPLETE SCHEDULE REGISTRY (Admin / Master Views)
  ========================================================================== */
  static Future<List<WhatNextModel>> fetchAllSlots() async {
    final String url = "$baseUrl/what-next";
    final String? token = await StorageUtil.getToken();

    try {
      LoggerUtil.logRequest(method: "GET", url: url);

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final Map<String, dynamic> result = _handleResponse(response);
      if (result["success"] == true && result["data"] != null) {
        final List<dynamic> dataList = result["data"];
        return dataList.map((slot) => WhatNextModel.fromJson(slot)).toList();
      }
      return [];
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return [];
    }
  }

  /* ==========================================================================
     INTERNAL UTILITY
  ========================================================================== */
  static Map<String, dynamic> _handleResponse(http.Response response) {
    LoggerUtil.logResponse(
      url: response.request?.url.toString() ?? "Unknown Route",
      statusCode: response.statusCode,
      body: response.body,
    );

    try {
      final Map<String, dynamic> decoded = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          "success": true,
          "data": decoded["data"],
          "message": decoded["message"] ?? "Success"
        };
      } else {
        return {
          "success": false,
          "message": decoded["message"] ?? "Request failed: ${response.statusCode}"
        };
      }
    } catch (_) {
      return {
        "success": false,
        "message": "Malformed system data layout (${response.statusCode})"
      };
    }
  }
}