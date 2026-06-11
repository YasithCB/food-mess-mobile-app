import 'dart:convert';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart'; // 🔹 Points safely to your user model layout

class StorageUtil {
  static const String _tokenKey = "token";
  static const String _userKey = "user";

  /// 🔹 Save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// 🔹 Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// 🔹 Save user object directly as a Model instance
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    // Converts the Model instance to a Map, then encodes it into a clean String string
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  /// 🔹 Get user model object back safely
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);

    if (userJson == null) return null;

    try {
      final Map<String, dynamic> userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    } catch (e) {
      print("⚠️ StorageUtil error deserializing user payload: $e");
      return null; // Prevents app shell crashes if local storage format changes
    }
  }

  /// 🔹 Clear all data (logout session reset)
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    currentUser = null;
    await prefs.clear() ;
  }
}