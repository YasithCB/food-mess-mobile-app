import 'dart:convert';
import 'package:http/http.dart' as http;
import '../db/constants.dart';
import '../models/what_next_model.dart';

/* =========================================================
   FETCH THE ACTIVE SLIDING TIMELINE WINDOW
   (Feeds the 3-Column Flutter Home Menu Widget Row)
========================================================= */
Future<List<WhatNextModel>> fetchTimelineWindow() async {
  final response = await http.get(Uri.parse("$baseUrl/what-next/timeline/window"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    // Maps list payload directly from your unified success template format
    final timelineSlots = (body['data'] as List)
        .map((slot) => WhatNextModel.fromJson(slot))
        .toList();
    return timelineSlots;
  } else {
    throw Exception("Failed to load home timeline schedule updates");
  }
}

/* =========================================================
   FETCH COMPLETE SCHEDULE REGISTRY (Admin / Master Views)
========================================================= */
Future<List<WhatNextModel>> fetchAllSlots() async {
  final response = await http.get(Uri.parse("$baseUrl/what-next"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    final allSlots = (body['data'] as List)
        .map((slot) => WhatNextModel.fromJson(slot))
        .toList();
    return allSlots;
  } else {
    throw Exception("Failed to download master schedule listings");
  }
}