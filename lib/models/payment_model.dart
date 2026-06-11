import 'dart:convert';

class PaymentModel {
  final String paymentId;     // Alpha-numeric primary key format (e.g., PAY001)
  final String userId;        // Links to your user identifier schema
  final String paymentMethod; // e.g., 'Cash on Delivery', 'Bank Transfer', 'Card Online'
  final double amount;        // Currency field mapped cleanly as a double
  // Inside your PaymentModel class:
  final double outstandingBalance;
  final String? paymentDate;  // Populated directly via database timestamps

  PaymentModel({
    required this.paymentId,
    required this.userId,
    required this.paymentMethod,
    required this.amount,
    required this.outstandingBalance,
    this.paymentDate,
  });

  // Factory constructor handles mapping database field values into clean runtime variables
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      paymentId: json['payment_id'] as String,
      userId: json['user_id'].toString(), // Safely handles either integer or string payloads
      paymentMethod: json['payment_method'] as String,
      amount: double.parse(json['amount'].toString()),
      // Inside your factory constructor fromJson:
      outstandingBalance: double.parse(json['outstanding_balance'].toString()),
      paymentDate: json['payment_date'] as String?,
    );
  }

  // Packs fields for network transport when submitting new payment logs
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'payment_method': paymentMethod,
      'amount': amount.toStringAsFixed(2), // Matches precise SQL DECIMAL requirements
    };
  }
}