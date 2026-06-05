import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';
import 'package:flutter/material.dart';

class MonthlySummaryCard extends StatelessWidget {
  final int totalMeals;
  final double totalAmount;
  final double amountPaid;
  final VoidCallback onPayTap;

  const MonthlySummaryCard({
    super.key,
    required this.totalMeals,
    required this.totalAmount,
    required this.amountPaid,
    required this.onPayTap,
  });

  @override
  Widget build(BuildContext context) {
    // 🔹 Calculate the remaining balance
    final double balance = totalAmount - amountPaid;
    final bool isCleared = balance <= 0;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // 🔹 Gradient changes to Green if balance is 0
        color: secondaryColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: (Colors.green).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Header: Month and Meal Count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "April 2026",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "$totalMeals Meals",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 Main Balance Display
                Text(
                  isCleared ? "All Cleared!" : "Amount Due",
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  "AED ${balance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Bottom Statistics Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Row(
              children: [
                _buildStatItem("Total Bill", totalAmount),
                const Spacer(),
                _buildStatItem("Total Paid", amountPaid),
                const Spacer(),

                // 🔹 Action Button
                ElevatedButton(
                  onPressed: onPayTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    foregroundColor: primaryColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Show History",
                    style: TextStyle(color: secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 11),
        ),
        const SizedBox(height: 4),
        Text(
          "AED ${value.toStringAsFixed(0)}",
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}