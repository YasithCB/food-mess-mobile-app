import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import '../../models/order_model.dart';
import '../../models/payment_model.dart';
import '../../api/order_api.dart';
import '../../api/payment_api.dart';

class MonthlySummaryCard extends StatefulWidget {
  final String userId;
  final VoidCallback onPayTap;

  const MonthlySummaryCard({
    super.key,
    required this.userId,
    required this.onPayTap,
  });

  @override
  State<MonthlySummaryCard> createState() => _MonthlySummaryCardState();
}

class _MonthlySummaryCardState extends State<MonthlySummaryCard> {
  // A single future that handles fetching both data streams in parallel
  late Future<List<dynamic>> _billingDataFuture;

  @override
  void initState() {
    super.initState();
    // Fires both API calls concurrently for optimal performance
    _billingDataFuture = Future.wait([
      CustomerOrderApi.fetchCustomerOrders(widget.userId),
      fetchCustomerPayments(widget.userId),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _billingDataFuture,
      builder: (context, snapshot) {
        // 1. Loading State Shimmer/Spinner
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.all(16),
            height: 220,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Center(child: CircularProgressIndicator(color: Colors.green)),
          );
        }

        // 2. Error Fallback State
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            color: Colors.red.shade50,
            child: Text("Error calculating statement: ${snapshot.error}", style: const TextStyle(color: Colors.red)),
          );
        }

        // Extract both data lists securely from the multi-future payload snapshot array
        final List<OrderModel> orders = snapshot.data![0] as List<OrderModel>;
        final List<PaymentModel> payments = snapshot.data![1] as List<PaymentModel>;

        // 🔹 Aggregation Logic: Calculate total meals and aggregate total price sum values
        int totalMeals = orders.length;
        double totalAmount = orders.fold(0.0, (sum, order) => sum + order.totalPrice);
        double amountPaid = payments.fold(0.0, (sum, payment) => sum + payment.amount);

        // Calculate the remaining dynamic balance
        final double balance = totalAmount - amountPaid;
        final bool isCleared = balance <= 0;

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: (isCleared ? Colors.green : Colors.orange).withOpacity(0.3),
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
                    // Header: Current Month and Dynamic Order Count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "June 2026", // Dynamic month tracking can be parsed here if desired
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

                    // Main Dynamic Balance Display
                    Text(
                      isCleared ? "All Cleared!" : "Amount Due",
                      style: const TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "AED ${balance < 0 ? '0.00' : balance.toStringAsFixed(2)}",
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

              // Bottom Statistics Row
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

                    // Action Button
                    ElevatedButton(
                      onPressed: widget.onPayTap,
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
      },
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