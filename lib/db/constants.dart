import 'package:flutter/material.dart';

final Color primaryColor = const Color(0XFFB2D22A);
final Color secondaryColor = const Color(0xFFDFF270);
final Color primaryColor2 = const Color(0xFFCC9001);
final Color primaryColor5 = const Color(0x1203031E);
final Color primaryColor20 = const Color(0x3303031E);
final Color primaryColor50 = const Color(0x8003031E);
final Color primaryColorHover = const Color(0xFF07A84A);

final Color backgroundColor = const Color(0xFF0C1600);
final Color backgroundColor2 = const Color(0xFF142800);

const LinearGradient metallicGold = LinearGradient(
  colors: [
    Color(0xFFFFD700), // Pure gold
    Color(0xFFDAA520), //r Goldenrod
    Color(0xFFC9A227), // Medium gold tone
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// 📏 Get device width & height
double deviceWidth = 0;
double deviceHeight = 0;

const String baseUrl = "http://localhost:5000/api";
// 🔹 Android emulator
// For real device → use your PC IP (eg: http://192.168.1.5:5000/api)

Map<String, dynamic> currentUser = {};
String currentUserToken = '';

// COMPANY DATA
const String mobile = '+97126350660';
