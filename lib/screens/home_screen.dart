import 'package:ceylon_home_kitchen_mobile_app/screens/tabs/about_us_screen.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/tabs/history_screen.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/tabs/home_tab.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/tabs/payment_screen.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

import '../db/constants.dart';
import 'tabs/menu_screen.dart';
import '../widgets/navbar/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // default to middle Services tab

  final List<Widget> _pages = const [
    HomeTab(),
    HistoryScreen(),
    MenuScreen(),
    PaymentScreen(),
    ProfileTab(),
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // 📏 Get device width & height
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0C1600),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 🔹 The updated FloatingActionButton with vertical offset
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30), // 🔹 Pull it up slightly to sit inside the hump
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // 🔹 The Gradient: Transitions from your bright primary to a slightly deeper shade
            gradient: const LinearGradient(
              colors: [
                Color(0xFF95AC11), // Your Primary Lime
                Color(0xFF3A4502), // A deeper olive/lime for depth
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.4), // Glow color
                blurRadius: 20,    // 🔹 High blur for the "glow" effect
                spreadRadius: 5,   // 🔹 Extends the glow further
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () => _onTabSelected(2),
            // 🔹 CRITICAL: Must be transparent to see the container's gradient
            backgroundColor: Colors.transparent,
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            splashColor: Colors.white.withOpacity(0.2),
            shape: const CircleBorder(),
            child: Icon(Icons.restaurant_menu, color: secondaryColor, size: 32),
          ),
        ),
      ),

      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
