import 'package:ceylon_home_kitchen_mobile_app/db/constants.dart';
import 'package:ceylon_home_kitchen_mobile_app/util/currency_util.dart';
import 'package:ceylon_home_kitchen_mobile_app/util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/home/summary_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> samplePayments = [
      {"date": DateTime.now(), "method": "Credit Card", "amount": 145.50, "bal": 100.50},
      {"date": DateTime.now().subtract(const Duration(days: 1)), "method": "Apple Pay", "amount": 82.00, "bal": 0.00},
      {"date": DateTime.now().subtract(const Duration(days: 2)), "method": "Cash on Delivery", "amount": 210.25, "bal": 15.00},
      {"date": DateTime.now().subtract(const Duration(days: 3)), "method": "Google Pay", "amount": 55.00, "bal": -25.00},
      {"date": DateTime.now().subtract(const Duration(days: 5)), "method": "Online Banking", "amount": 320.75, "bal": -50.50},
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Section Title
            Text(
              'Payments'.toUpperCase(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1.2),
            ),
            const SizedBox(height: 12),

            // --- Summary Card Inside the Box ---
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: MonthlySummaryCard(
                totalMeals: 42,
                totalAmount: 630.00,
                amountPaid: 450.00,
                onPayTap: () {},
              ),
            ),

            true ?
            Column(
              children: [
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Payments History'.toUpperCase(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(height: 12),

                // Use Expanded if this is inside a Column for the whole screen
                ListView.builder(
                  shrinkWrap: true, // Use this if inside a Column
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: samplePayments.length,
                  itemBuilder: (context, index) {
                    final item = samplePayments[index];
                    return _buildHistoryItem(
                      item['date'],
                      item['method'],
                      item['amount'],
                      item['bal'],
                    );
                  },
                )
              ],
            )
            :
            Column(
              children: [
                // 🎯 Modern Icon
                Icon(
                  Icons.payments_outlined,
                  size: 50,
                  color: primaryColor,
                ),
                const SizedBox(height: 8),

                Text(
                  'No Payments Yet',
                  style: TextStyle(
                    fontSize: 15,
                    color: secondaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                // 📝 Subtitle
                Text(
                  'Your payment history will appear here once you complete a payment.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white54),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(DateTime date, String method, double amount, double bal) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        // Soft background tint of the main color
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor.withOpacity(0.15)),
      ),
      child: IntrinsicHeight( // Ensures the vertical line matches the height
        child: Row(
          children: [
            // 1. Left Accent Bar
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: primaryColor,
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
                child: Icon(CupertinoIcons.arrow_up_right, color: secondaryColor, size: 20),
              ),
            ),

            const SizedBox(width: 12),

            // 3. 2nd Col
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pay Money via $method',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    DateUtilsHelper.formatDateTime(date),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // 5. Amount
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '+ ${CurrencyUtil.formatCurrency(amount)}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'Due : ${CurrencyUtil.formatCurrency(bal)}',
                      style: TextStyle(
                        fontSize: 13,
                        color: bal>0 ? Colors.red : primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
