import 'package:flutter/material.dart';

import '../../db/db.dart';

class HorizontalImageGrid extends StatefulWidget {
  const HorizontalImageGrid({super.key});

  @override
  State<HorizontalImageGrid> createState() => _HorizontalImageGridState();
}

class _HorizontalImageGridState extends State<HorizontalImageGrid> {

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 160, // enough space for image + title
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // only one row
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              // 🔹 Navigate to Service Details
              // NavigationUtil.push(
              //   context,
              //   SubServiceDetailsScreen(service: item),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.img,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
