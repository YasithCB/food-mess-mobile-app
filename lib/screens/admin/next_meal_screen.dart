import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/api/what_next_api.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/util/date_util.dart';

import '../../models/what_next_model.dart';

class NextMealScreen extends StatefulWidget {
  const NextMealScreen({super.key});

  @override
  State<NextMealScreen> createState() => _NextMealScreenState();
}

class _NextMealScreenState extends State<NextMealScreen> {
  // 🔹 New declaration (updated for the full list of slots)
  late Future<List<WhatNextModel>> _nextMealFuture;

  @override
  void initState() {
    super.initState();
    _refreshTimeline();
  }

  void _refreshTimeline() {
    setState(() {
      // 🔹 This fetches the full schedule registry as you requested
      _nextMealFuture = WhatNextApi.fetchAllSlots();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Modify colors to fit your layout template structure
    final primaryColor = Theme.of(context).primaryColor;
    final Color cardBackground = backgroundColor2;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Next Meal Schedule",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.sync_rounded),
            onPressed: _refreshTimeline,
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: _refreshTimeline,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* ==========================================================================
             FUTURE BUILDER PIPELINE BOUND LAYERING
          ========================================================================== */
          Expanded(
            child: FutureBuilder<List<WhatNextModel>>(
              future: _nextMealFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Sync error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No schedule entries found."),
                  );
                }

                // 🔹 Corrected: snapshot.data is a List, not a single object
                final List<WhatNextModel> scheduleList = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: scheduleList.length,
                  itemBuilder: (context, index) {
                    final nextMeal =
                        scheduleList[index]; // 🔹 Access the individual item

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🏷️ Section Header (Only show for the first item if needed)
                        if (index == 0) ...[
                          const Text(
                            "UPCOMING KITCHEN PREPARATION",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        /* ==========================================================================
                 HERO CARD
              ========================================================================== */
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: cardBackground,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(
                                  (0.15 * 255).toInt(),
                                ),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withAlpha(
                                        (0.2 * 255).toInt(),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      DateUtilsHelper.getDayName(
                                        nextMeal.mealDate,
                                      ).toUpperCase(),
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.4,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white60,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        DateUtilsHelper.formatDate(
                                          nextMeal.mealDate,
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                nextMeal.mealTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                nextMeal.curries.join(", "),
                                // 🔹 Joins ['Dal', 'Potato'] into "Dal, Potato"
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                              const Divider(
                                height: 32,
                                thickness: 1,
                                color: Colors.white10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    DateUtilsHelper.getRelativeDay(
                                      nextMeal.mealDate,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentGeometry.centerRight,
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Add controls only for the last item, or remove this logic if controls belong to every card
                        if (index == scheduleList.length - 1) ...[
                          const Text(
                            "ADMIN PRODUCTION CONTROLS",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildActionButton(
                            icon: Icons.assignment_turned_in_outlined,
                            title: "Export Prep Sheet",
                            subtitle: "Generate PDF guide",
                            onTap: () {},
                          ),
                          _buildActionButton(
                            icon: Icons.notifications_active_outlined,
                            title: "Broadcast Alert",
                            subtitle: "Ping all customers",
                            onTap: () {},
                          ),
                        ],
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white38),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor2,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: primaryColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.white54),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
