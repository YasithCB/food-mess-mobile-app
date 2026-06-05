import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';
import 'package:flutter/material.dart';

import 'elevated_notch_clipper.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none, // 🔹 Allows the curve to go outside the box
      children: [
        // THE SHAPED BACKGROUND
        PhysicalShape(
          clipper: ElevatedNotchClipper(),
          elevation: 10, // 🔹 This automatically creates a shadow following the curve
          shadowColor: Colors.black.withOpacity(0.8), // 🔹 Your shadow color
          color: secondaryColor,
          child: const SizedBox(
            height: 70,
            width: double.infinity,
          ),
        ),

        // THE NAVIGATION CONTENT
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_outlined, Icons.home, "Home", 0),
                _buildNavItem(Icons.receipt_long_outlined, Icons.receipt_long, "History", 1),
                const SizedBox(width: 50), // Space for the hump
                _buildNavItem(Icons.payments_outlined, Icons.payments, "Pay", 3),
                _buildNavItem(Icons.person_outline, Icons.person, "Profile", 4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, IconData activeIcon, String label, int index) {
    final bool isSelected = currentIndex == index;
    const Color inactiveColor = Color(0xFF6E8723);

    return InkWell(
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? backgroundColor : inactiveColor,
            size: 25,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? backgroundColor : inactiveColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}