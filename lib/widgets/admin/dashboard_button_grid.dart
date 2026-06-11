import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/widgets/admin/order_screen.dart';

import '../../db/constants.dart';

class DashboardButtonGrid extends StatelessWidget {
  const DashboardButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          /* ==========================================
             ROW 1: ORDER (Full Width)
          ========================================== */
          _buildMenuButton(
            context: context,
            icon: Icons.shopping_bag_outlined,
            label: "Orders",
            subtitle: "Manage client bookings",
            isFullWidth: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersScreen()),
              );
            },          ),
          const SizedBox(height: 16),

          /* ==========================================
             ROW 2: NEXT MEAL & MEALS (Two Columns)
          ========================================== */
          Row(
            children: [
              Expanded(
                child: _buildMenuButton(
                  context: context,
                  icon: Icons.upcoming_outlined,
                  label: "Next Meal",
                  subtitle: "Upcoming prep schedule",
                  isFullWidth: false,
                  onTap: () => print("Navigate to Next Meal"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMenuButton(
                  context: context,
                  icon: Icons.restaurant_menu_outlined,
                  label: "Meals",
                  subtitle: "Edit recipe directory",
                  isFullWidth: false,
                  onTap: () => print("Navigate to Meals"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /* ==========================================
             ROW 3: USER & PAYMENTS (Two Columns)
          ========================================== */
          Row(
            children: [
              Expanded(
                child: _buildMenuButton(
                  context: context,
                  icon: Icons.people_alt_outlined,
                  label: "Users",
                  subtitle: "Client profiles & accounts",
                  isFullWidth: false,
                  onTap: () => print("Navigate to Users"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMenuButton(
                  context: context,
                  icon: Icons.account_balance_wallet_outlined,
                  label: "Payments",
                  subtitle: "Ledgers & transactions",
                  isFullWidth: false,
                  onTap: () => print("Navigate to Payments"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /* ==========================================================================
     REUSABLE CARD COMPONENT DESIGN
  ========================================================================== */
  Widget _buildMenuButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String subtitle,
    required bool isFullWidth,
    required VoidCallback onTap,
  }) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen.withAlpha((0.08 * 255).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.withAlpha((0.15 * 255).toInt())),
        ),
        child: Row(
          mainAxisAlignment: isFullWidth ? MainAxisAlignment.start : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Ring Container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor.withAlpha((0.1 * 255).toInt()),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: primaryColor, size: 28),
            ),
            const SizedBox(width: 16),

            // Text Label Elements
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Add a trailing arrow only on the full-width Order card for better UI balance
            if (isFullWidth)
              Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}