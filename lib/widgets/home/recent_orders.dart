import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';
import 'package:ceylon_home_kitchen_mobile_app/util/date_util.dart';
import 'package:flutter/material.dart';

import '../../api/order_api.dart';
import '../../models/order_model.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({super.key});

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  // 1. Declare a Future variable to hold the asynchronous network call state
  late Future<List<OrderModel>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    // 2. Initialize the network call when the widget mounts.
    // Replace "1" with your actual active logged-in User ID string (e.g., from your Auth State Provider)
    _ordersFuture = fetchCustomerOrders("1");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Recent Orders".toUpperCase(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Use Expanded if this is inside a Column for the whole screen
        FutureBuilder<List<OrderModel>>(
          future: _ordersFuture,
          builder: (context, snapshot) {
            // State A: Network request is in progress
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // State B: Backend or parsing threw an Exception error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // State C: Successful response but list contains zero records
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("You haven't ordered any meals yet!"),
              );
            }

            // State D: Success! Data is present. Extract it cleanly.
            final orders = snapshot.data!;

            // 4. Render the data inside a ListView
            return ListView.builder(
              shrinkWrap: true, // Use this if inside another scrollable
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return _buildHistoryItem(DateUtilsHelper.formatDate(order.mealDate), order.mealTime, order.mealName, order.unitPrice, order.qty);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildHistoryItem(
    String date,
    String mealTime,
    String mealType,
    double unitPrice,
    int qty,
  ) {
    // 🔹 Define colors and icons based on meal time
    IconData mealIcon;

    switch (mealTime.toLowerCase()) {
      case 'breakfast':
        mealIcon = Icons.wb_sunny_outlined;
        break;
      case 'lunch':
        mealIcon = Icons.lunch_dining_outlined;
        break;
      case 'dinner':
        mealIcon = Icons.dark_mode_outlined;
        break;
      default:
        mealIcon = Icons.restaurant_menu;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        // Soft background tint of the main color
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withOpacity(0.15)),
      ),
      child: IntrinsicHeight(
        // Ensures the vertical line matches the height
        child: Row(
          children: [
            // 1. Left Accent Bar
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // 2. Icon & Meal Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: secondaryColor.withOpacity(0.1),
                child: Icon(mealIcon, color: secondaryColor, size: 20),
              ),
            ),

            const SizedBox(width: 12),

            // 3. Date and Meal Title
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealTime,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // 4. Meal Type and price
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealType,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    "$unitPrice AED",
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // 5. Quantity Badge
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$qty ${qty > 1 ? "Parcels" : "Parcel"}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
