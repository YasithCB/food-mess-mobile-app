import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/order_model.dart';
import '../util/logger_util.dart';
import '../util/storage_util.dart';

class CustomerOrderApi {

  /* ==========================================================================
     1. CREATE (Place a New Order)
  ========================================================================== */
  /// Sends raw checkout parameters to database and receives state entries back
  static Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> orderPayload) async {
    final String url = "$baseUrl/orders";
    final String? token = await StorageUtil.getToken();

    try {
      LoggerUtil.logRequest(method: "POST", url: url, body: orderPayload);

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(orderPayload),
      );

      return _handleResponse(response, successCode: 201);
    } catch (e) {
      LoggerUtil.logError(method: "POST", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: Unable to place order."};
    }
  }

  /* ==========================================================================
     2. READ (Fetch Datasets)
  ========================================================================== */

  /// 🔹 Get All System Orders (Admin Global Audit Scope)
  static Future<List<OrderModel>> getAllOrders() async {
    final String url = "$baseUrl/orders";
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
        return dataList.map((order) => OrderModel.fromJson(order)).toList();
      }
      return [];
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return [];
    }
  }

  /// 🔹 Fetch Order History for a Specific User ID
  /// (Hits your compound index idx_user_orders for rapid loading)
  static Future<List<OrderModel>> fetchCustomerOrders(String userId) async {
    final String url = "$baseUrl/orders/customer/$userId";
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
        return dataList.map((order) => OrderModel.fromJson(order)).toList();
      }
      return [];
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return [];
    }
  }

  /// 🔹 Fetch Single Order Profile Row by Unique Tracking ID
  static Future<Map<String, dynamic>> getOrderById(String orderId) async {
    final String url = "$baseUrl/orders/$orderId";
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

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /* ==========================================================================
     3. UPDATE (Modify Records)
  ========================================================================== */
  /// Updates target statuses (e.g., 'Pending' -> 'Delivered' or 'Cancelled')
  static Future<Map<String, dynamic>> updateOrderStatus(String orderId, String status) async {
    final String url = "$baseUrl/orders/$orderId";
    final String? token = await StorageUtil.getToken();
    final Map<String, dynamic> requestBody = {"status": status};

    try {
      LoggerUtil.logRequest(method: "PUT", url: url, body: requestBody);

      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(requestBody),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "PUT", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: Failed to update status."};
    }
  }

  /* ==========================================================================
     4. DELETE (Drop Records)
  ========================================================================== */
  /// Drops a specific order ledger entry completely from the system matching your UI action
  static Future<Map<String, dynamic>> deleteOrder(String orderId) async {
    final String url = "$baseUrl/orders/$orderId";
    final String? token = await StorageUtil.getToken();

    try {
      LoggerUtil.logRequest(method: "DELETE", url: url);

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "DELETE", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: Failed to drop order record."};
    }
  }

  /* ==========================================================================
     INTERNAL PIPELINE UTILITIES
  ========================================================================== */
  /// Central processing node to parse HTTP metrics uniformly across all actions
  static Map<String, dynamic> _handleResponse(http.Response response, {int successCode = 200}) {
    LoggerUtil.logResponse(
      url: response.request?.url.toString() ?? "Unknown Route",
      statusCode: response.statusCode,
      body: response.body,
    );

    try {
      final Map<String, dynamic> decoded = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == successCode || response.statusCode == 200) {
        return {
          "success": true,
          "message": decoded["message"] ?? "Operation completed successfully.",
          "data": decoded["data"]
        };
      } else {
        return {
          "success": false,
          "message": decoded["message"] ?? "Server returned error code: ${response.statusCode}"
        };
      }
    } catch (_) {
      return {
        "success": false,
        "message": "Malformed system data layout intercepted (${response.statusCode})"
      };
    }
  }
}