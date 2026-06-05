import 'package:ceylon_home_kitchen_mobile_app/db/db.dart';
import 'package:flutter/material.dart';

import '../../widgets/service_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔹 Section Title
            Text(
              'Our Menu'.toUpperCase(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1.2),
            ),

            const SizedBox(height: 16),

            // 🔹 Services List
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return MenuCard(menuItem: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
