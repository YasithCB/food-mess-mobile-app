import 'dart:convert';
import 'package:http/http.dart' as http;

import '../db/constants.dart';

class AuthApi {
  // 🔹 Register
  static Future<Map<String, dynamic>> register({
    required String name,
    required String mobile,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "mobile": mobile,
          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        "success": false,
        "message": "Network error: $e",
      };
    }
  }

  // 🔹 Login
  static Future<Map<String, dynamic>> login({
    required String mobile,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "mobile": mobile,
          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        "success": false,
        "message": "Network error: $e",
      };
    }
  }
}
