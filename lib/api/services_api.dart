import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/service_model.dart';

Future<List<ServiceModel>> fetchServices() async {
  final response = await http.get(Uri.parse("https://yourapi.com/services"));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final categories = (data['categories'] as List)
        .map((c) => ServiceModel.fromJson(c))
        .toList();
    return categories;
  } else {
    throw Exception("Failed to load services");
  }
}
