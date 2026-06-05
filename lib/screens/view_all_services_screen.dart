import 'package:flutter/material.dart';
import 'package:ceylon_home_kitchen_mobile_app/db/services_data.dart';
import 'package:ceylon_home_kitchen_mobile_app/models/service_model.dart';
import 'package:ceylon_home_kitchen_mobile_app/widgets/sub_service_card.dart';

import '../db/constants.dart';

class ViewAllServices extends StatefulWidget {
  const ViewAllServices({super.key});

  @override
  State<ViewAllServices> createState() => _ViewAllServicesState();
}

class _ViewAllServicesState extends State<ViewAllServices> {
  final TextEditingController _controller = TextEditingController();

  List<SubServiceModel> _results = [];

  void _search() {
    String query = _controller.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _results.clear();
      } else {
        _results = getAllSubServices(
          Localizations.localeOf(context).languageCode,
        ).where((item) => item.name.toLowerCase().contains(query)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<SubServiceModel> itemsToShow =
        _results.isEmpty && _controller.text.isEmpty
        ? getPopularServices(
            Localizations.localeOf(context).languageCode,
          ) // default popular services
        : _results;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Modern Search Bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Search services...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _controller.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                      _results.clear(); // 🔹 show default again
                                    });
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        // 🔹 Run search as user types
                        onChanged: (_) => _search(),
                        // still works with "enter"
                        onSubmitted: (_) => _search(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                      onPressed: _search,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 Section Title
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor2, // default color for rest
                    ),
                    children: [
                      TextSpan(
                        text: _controller.text.isEmpty ? "All " : "Search ",
                        style: TextStyle(
                          color:
                              primaryColor, // 🔹 only "Explore" in primary color
                        ),
                      ),
                      TextSpan(
                        text: _controller.text.isEmpty ? "services" : "results",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 Services List
                Expanded(
                  child: itemsToShow.isEmpty
                      ? const Center(child: Text("No results found"))
                      : ListView.builder(
                          itemCount: itemsToShow.length,
                          itemBuilder: (context, index) {
                            final item = itemsToShow[index];
                            return SubServiceCard(service: item);
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
