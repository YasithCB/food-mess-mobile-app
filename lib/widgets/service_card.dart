import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/models/meal1_model.dart';
import 'package:food_mess_mobile_app/models/menuItem_model.dart';
import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/util/currency_util.dart';

import '../util/util.dart';


class MenuCard extends StatelessWidget {
  final MealModel1 meal;

  const MenuCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 🔹 Navigate to Service Details
        // NavigationUtil.push(context, ServiceDetailsScreen(service: service));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          // Soft background tint of the main color
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primaryColor.withOpacity(0.15)),
        ),
        child: Row(
          children: [
            // 🔹 Left Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                formatUrl(baseUrl, meal.imageUrl.toString()),
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // 🔹 Right Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CurrencyUtil.formatCurrency(meal.price),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    meal.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.white54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
