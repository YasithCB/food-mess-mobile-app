import 'package:intl/intl.dart';

class CurrencyUtil {
  /// Formats currency to: "1,250.50 AED"
  static String formatCurrency(double amount) {
    // 🔹 The pattern '#,##0.00 ¤' tells Flutter to put:
    // #,##0.00 -> The number with commas and 2 decimals
    // ¤ -> The currency symbol (placed at the end)
    final formatter = NumberFormat.currency(
      decimalDigits: 2,
      symbol: 'AED',
      customPattern: '#,##0.00 ¤',
    );
    return formatter.format(amount);
  }
}