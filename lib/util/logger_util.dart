import 'dart:convert';

class LoggerUtil {
  static const String _divider = "----------------------------------------------------------------------";

  /// 🚀 Logs outgoing HTTP Requests
  static void logRequest({
    required String method,
    required String url,
    Map<String, dynamic>? body,
  }) {
    print(_divider);
    print("🚀 [REQUEST TRANSMIT]");
    print("🛠️ METHOD:  $method");
    print("🔗 URL:     $url");
    if (body != null) {
      // Create a shallow copy to mask sensitive user credentials in console logs
      final sanitizedBody = Map<String, dynamic>.from(body);
      if (sanitizedBody.containsKey('password')) sanitizedBody['password'] = '[PROTECTED]';

      print("📦 BODY:    ${jsonEncode(sanitizedBody)}");
    }
    print(_divider);
  }

  /// 📥 Logs incoming HTTP Responses
  static void logResponse({
    required String url,
    required int statusCode,
    required String body,
  }) {
    print(_divider);
    print("📥 [RESPONSE RECEIVE]");
    print("🔗 URL:     $url");
    print("📊 STATUS:  $statusCode");
    print("📦 BODY:    $body");
    print(_divider);
  }

  /// 🚨 Logs unexpected low-level connectivity exceptions
  static void logError({
    required String method,
    required String url,
    required String error,
  }) {
    print(_divider);
    print("🚨 [HTTP CLIENT FATAL EXCEPTION]");
    print("🛠️ ACTION:  $method -> $url");
    print("❌ ERROR:   $error");
    print(_divider);
  }
}