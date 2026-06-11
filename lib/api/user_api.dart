import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../util/logger_util.dart';

class UserApi {

  /* ==========================================================================
     1. AUTHENTICATION OPERATIONS
  ========================================================================== */

  /// 🔹 Register a new account
  static Future<Map<String, dynamic>> register({
    required String name,
    required String mobile,
    required String password,
  }) async {
    final String url = "$baseUrl/users/register";
    final Map<String, dynamic> requestBody = {
      "name": name,
      "mobile": mobile,
      "password": password,
    };

    try {
      // 📝 Automatically logs out details (Logger handles hiding the plain-text password)
      LoggerUtil.logRequest(method: "POST", url: url, body: requestBody);

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "POST", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /// 🔹 Login into existing account
  static Future<Map<String, dynamic>> login({
    required String mobile,
    required String password,
  }) async {
    final String url = "$baseUrl/users/login";
    final Map<String, dynamic> requestBody = {
      "mobile": mobile,
      "password": password,
    };

    try {
      LoggerUtil.logRequest(method: "POST", url: url, body: requestBody);

      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "POST", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /* ==========================================================================
     2. PROFILE MANAGEMENT OPERATIONS
  ========================================================================== */

  /// 🔹 Fetch profile records by User ID
  static Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final String url = "$baseUrl/users/$userId";

    try {
      LoggerUtil.logRequest(method: "GET", url: url);

      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "GET", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /// 🔹 Update account name or mobile attributes
  static Future<Map<String, dynamic>> updateUserProfile({
    required String userId,
    required String name,
    required String mobile,
  }) async {
    final String url = "$baseUrl/users/$userId";
    final Map<String, dynamic> requestBody = {
      "name": name,
      "mobile": mobile,
    };

    try {
      LoggerUtil.logRequest(method: "PUT", url: url, body: requestBody);

      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "PUT", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /// 🔹 Delete account data ledger completely
  static Future<Map<String, dynamic>> deleteUserAccount(String userId) async {
    final String url = "$baseUrl/users/$userId";

    try {
      LoggerUtil.logRequest(method: "DELETE", url: url);

      final response = await http.delete(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.logError(method: "DELETE", url: url, error: e.toString());
      return {"success": false, "message": "Connection error: $e"};
    }
  }

  /* ==========================================================================
     INTERNAL UTILITIES
  ========================================================================== */

  /// Processes HTTP responses safely, capturing HTML crashes before they break jsonDecode
  static Map<String, dynamic> _handleResponse(http.Response response) {
    // 📝 Passes response details into your centralized console formatter
    LoggerUtil.logResponse(
      url: response.request?.url.toString() ?? "Unknown Route URL",
      statusCode: response.statusCode,
      body: response.body,
    );

    try {
      final Map<String, dynamic> decoded = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return decoded;
      } else {
        return {
          "success": false,
          "message": decoded["message"] ?? "Request failed with code: ${response.statusCode}"
        };
      }
    } catch (_) {
      return {
        "success": false,
        "message": "Server returned an unexpected invalid payload (${response.statusCode})"
      };
    }
  }
}