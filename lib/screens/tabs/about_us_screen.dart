import 'package:flutter/material.dart';

import '../../db/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Section Title
            Text(
              'About Us',
              style: TextStyle(
                color: primaryColor,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Column(
              children: [
                Text(
                  'We are a Sri Lankan food mess in the UAE dedicated to serving authentic, home-style Sri Lankan meals made with love and tradition.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 12),
                Text(
                  'Our dishes are prepared using original recipes, fresh ingredients, and carefully selected spices to deliver the true taste of Sri Lanka.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 12),
                Text(
                  'Whether you miss home or want to experience Sri Lankan cuisine, we bring comfort, quality, and warmth to every plate.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Mission & Vision Section
            Column(
              children: [
                // Vision Card
                Card(
                  color: primaryColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility, size: 32, color: Colors.white),
                        const SizedBox(height: 8),
                        Text(
                          'Our Vision',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'To become the most trusted Sri Lankan food mess in the UAE, '
                              'known for authentic taste, consistent quality, and a homely dining experience.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Mission Card
                Card(
                  color: primaryColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.flag, size: 32, color: Colors.white),
                        const SizedBox(height: 8),
                        Text(
                          'Our Mission',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '• Serve genuine Sri Lankan food that reminds customers of home\n'
                              '• Maintain high standards of hygiene, freshness, and quality\n'
                              '• Offer affordable meals without compromising taste\n'
                              '• Create a welcoming environment for the community\n'
                              '• Continuously improve service based on customer satisfaction',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Contact Section
            SizedBox(
              width: double.infinity, // ✅ make full width
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.contact_page_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Get In Touch',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("📍 Villa 4b,4th St,Al Bada,Al Satwa"),
                      const SizedBox(height: 8),
                      const Text("📞 +971 56 475 3050"),
                      const SizedBox(height: 8),
                      const Text("📧 info@ceyloanhomekitchen.com"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
