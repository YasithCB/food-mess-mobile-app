import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

const String baseUrl = "https://yourapi.com"; // Adjust to your backend destination base URL

/* =========================================================
   FETCH USER PROFILE BY ID
========================================================= */
Future<UserModel> fetchUserById(int id) async {
  final response = await http.get(Uri.parse("$baseUrl/users/$id"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);
    // Extracts from your controller's success object format wrapper -> success(res, user, ...)
    return UserModel.fromJson(body['data']);
  } else {
    throw Exception("Failed to load user account profile");
  }
}

/* =========================================================
   LOOKUP USER BY MOBILE NUMBER
========================================================= */
Future<UserModel> fetchUserByMobile(String mobile) async {
  final response = await http.get(Uri.parse("$baseUrl/users/mobile/$mobile"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);
    return UserModel.fromJson(body['data']);
  } else {
    throw Exception("No active account linked to mobile profile $mobile");
  }
}

/* =========================================================
   REGISTER / CREATE NEW USER
========================================================= */
Future<UserModel> registerUser(String name, String mobile, String password) async {
  final response = await http.post(
    Uri.parse("$baseUrl/users"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "name": name,
      "mobile": mobile,
      "password": password, // Hashing layer can sit inside this payload state block or backend
    }),
  );

  if (response.statusCode == 201) {
    final Map<String, dynamic> body = jsonDecode(response.body);
    return UserModel.fromJson(body['data']);
  } else {
    throw Exception("Failed to register user account profile");
  }
}