import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/widgets/sub_service_card.dart';

import '../db/constants.dart';
import '../models/service_model.dart'; // <-- import your models

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Service Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                service.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Service Title + Description
            Text(
              service.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service.description,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),

            // 🔹 Subcategories Section
            Row(
              children: [
                Icon(Icons.widgets, color: primaryColor),
                SizedBox(width: 8),
                Text(
                  "Explore Variants",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 🔹 List of Subcategories
            ...service.subcategories.map((sub) => SubServiceCard(service: sub)),
          ],
        ),
      ),
    );
  }

  /// 🔹 Helper to format different rate types
  String _formatRate(MaterialItem mat) {
    if (mat.ratePerSqFt != null) return "AED ${mat.ratePerSqFt}/sqft";
    if (mat.ratePerUnit != null) return "AED ${mat.ratePerUnit}/unit";
    if (mat.rate != null) return "AED ${mat.rate}";
    return "-";
  }
}
