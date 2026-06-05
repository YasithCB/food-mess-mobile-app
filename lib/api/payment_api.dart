import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/payment_model.dart';

const String baseUrl = "https://yourapi.com"; // Adjust to your backend destination base URL

/* =========================================================
   FETCH TRANSACTION HISTORY FOR A SPECIFIC USER
   (Hits your compound index idx_user_payments for rapid loading)
========================================================= */
Future<List<PaymentModel>> fetchCustomerPayments(String userId) async {
  final response = await http.get(Uri.parse("$baseUrl/payments/customer/$userId"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    // Parses user transaction profiles cleanly from standard API success template
    final historicalPayments = (body['data'] as List)
        .map((payment) => PaymentModel.fromJson(payment))
        .toList();
    return historicalPayments;
  } else {
    throw Exception("Failed to load customer billing history updates");
  }
}

/* =========================================================
   LOG A NEW PAYMENT RECORD / RECEIPT
========================================================= */
Future<PaymentModel> recordPayment(PaymentModel newPayment) async {
  final response = await http.post(
    Uri.parse("$baseUrl/payments"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(newPayment.toJson()),
  );

  if (response.statusCode == 201) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    // Returns the newly recorded state containing generated PAY key variables
    return PaymentModel.fromJson(body['data']);
  } else {
    throw Exception("Failed to lodge database transaction entry record");
  }
}