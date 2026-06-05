import 'package:ceylon_home_kitchen_mobile_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// Assuming these are defined in your constants.dart,
// but I'll define them here as variables for the fix:
const Color myBgColor = Color(0xFF0C1600);
const Color myPrimaryColor = Color(0xFFA6CA30);
const Color mySecondaryColor = Color(0xFFDFF270);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // We set themeMode to light but use your dark colors inside it
      // or simply use darkTheme.
      themeMode: ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        // 🔹 Set the full app background color
        scaffoldBackgroundColor: myBgColor,

        // 🔹 Configure the color scheme with your primary/secondary
        colorScheme: ColorScheme.light(
          surface: myBgColor,       // Background of cards/dialogs
          primary: myPrimaryColor,
          secondary: mySecondaryColor,
          onSurface: Colors.white,  // Text color on top of your dark BG
          onPrimary: Colors.black,  // Text color on top of primary buttons
        ),

        // 🔹 Optional: Ensure AppBar matches the background
        appBarTheme: const AppBarTheme(
          backgroundColor: myBgColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}