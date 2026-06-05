import 'package:flutter/material.dart';

import '../db/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // Logo
              Image.asset(
                "assets/logo-white.png",
                height: 120, // adjust size
              ),

              const SizedBox(height: 16),

              Text(
                'desc',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // About Content
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.info_outline, size: 40, color: primaryColor),
                      SizedBox(height: 12),
                      Text(
                        'we are leading',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Mission / Vision Section
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(Icons.flag, size: 40, color: Colors.white),
                            SizedBox(height: 8),
                            Text(
                              'AppLocalizations.of(context)!.ourMission',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'AppLocalizations.of(context)!.ourMissionDesc',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      color: primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(
                              Icons.visibility,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'AppLocalizations.of(context)!.ourVision',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'AppLocalizations.of(context)!.ourVisionDesc',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
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
                          'AppLocalizations.of(context)!.getInTouch',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("📍 address"),
                        const SizedBox(height: 8),
                        const Text("📞 +971 502 30 31 30"),
                        const SizedBox(height: 8),
                        const Text("📧 info@valgraphics.com"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
