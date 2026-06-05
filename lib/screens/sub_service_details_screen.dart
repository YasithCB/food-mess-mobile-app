import 'package:flutter/material.dart';

import '../db/constants.dart';
import '../models/service_model.dart'; // <-- import your models

class SubServiceDetailsScreen extends StatelessWidget {
  final SubServiceModel service;

  const SubServiceDetailsScreen({super.key, required this.service});

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
              service.desc,
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

            if (service.materials != null && service.materials!.isNotEmpty) ...[
              const Text(
                "Materials & Rates",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Column(
                children: service.materials!
                    .map(
                      (mat) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                mat.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Text(
                              _formatRate(mat),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 🔹 Helper to format different rate types
String _formatRate(MaterialItem mat) {
  if (mat.ratePerSqFt != null) return "AED ${mat.ratePerSqFt}/sqft";
  if (mat.ratePerUnit != null) return "AED ${mat.ratePerUnit}/unit";
  if (mat.rate != null) return "AED ${mat.rate}";
  return "-";
}
