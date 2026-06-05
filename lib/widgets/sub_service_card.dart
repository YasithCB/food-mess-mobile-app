import 'package:flutter/material.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/sub_service_details_screen.dart';

import '../models/service_model.dart';
import '../util/navigation_util.dart';

class SubServiceCard extends StatelessWidget {
  final SubServiceModel service;

  const SubServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 🔹 Navigate to Service Details
        NavigationUtil.push(context, SubServiceDetailsScreen(service: service));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // 🔹 Left Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                service.image,
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
                  Text(
                    service.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
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
