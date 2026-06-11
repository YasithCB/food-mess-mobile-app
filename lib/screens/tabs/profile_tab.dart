import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../db/constants.dart';
import '../../util/navigation_util.dart';
import '../../util/snackbar_util.dart';
import '../../util/storage_util.dart';
import '../../util/util.dart';
import '../auth/login_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    Future<void> handleLogout(BuildContext context) async {
      final confirmed = await confirmAction(context, "Confirm Logout", "");
      if (!confirmed) return; // ❌ Stop if not confirmed

      await StorageUtil.clear();
      // clear local var
      currentUser = null;

      print("🚪 Logged out");
      SnackBarUtil.show(context, "Logged out");

      NavigationUtil.pushAndRemoveUntil(context, LoginScreen());
    }

    handleLogin() {
      NavigationUtil.pushAndRemoveUntil(context, LoginScreen());
    }

    Future<void> openCall() async {
      final Uri url = Uri(scheme: 'tel', path: mobile);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $mobile';
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Use SingleChildScrollView so page content doesn't overflow on small screens
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight * 0.05),

              // === Centered Avatar with Name/Email ===
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50, // 🔹 bigger avatar
                        backgroundImage: AssetImage(
                          "assets/images/avatar-girl.png",
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Hello, ${currentUser != null ? currentUser!.name : 'Guest'}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   currentUser['email'] ??
                      //       'Login now to get best experience',
                      //   style: TextStyle(fontSize: 14, color: Colors.grey),
                      // ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Divider(color: Colors.black12),
              const SizedBox(height: 24),

              // 📋 Options
              Column(
                children: [
                  ListTile(
                    onTap: openCall,
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor5,
                      ),
                      child: Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: Text('Contact Support'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor5,
                      ),
                      child: Icon(
                        Icons.star_rate_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: Text('Rate App'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🚪 Logout button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  primaryColor,
                  foregroundColor: backgroundColor, // 🔹 Fixed: Foreground should contrast with background
                  minimumSize: const Size.fromHeight(50), // full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // 🔹 If user is logged in, show logout icon; otherwise show login icon
                icon: Icon(
                  currentUser != null ? Icons.logout_rounded : Icons.login_outlined,
                  color: backgroundColor,
                ),
                // 🔹 If user is logged in, show 'Logout'; otherwise show 'Login Now'
                label: Text(
                  currentUser != null ? 'Logout' : 'Login Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: backgroundColor,
                  ),
                ),
                // 🔹 Execute the correct function depending on session state
                onPressed: () {
                  if (currentUser != null) {
                    handleLogout(context);
                  } else {
                    handleLogin(); // If this requires a context, pass it like handleLogin(context)
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
