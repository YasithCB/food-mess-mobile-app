import 'package:ceylon_home_kitchen_mobile_app/util/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/auth/signup_screen.dart';
import 'package:ceylon_home_kitchen_mobile_app/screens/home_screen.dart';
import 'package:ceylon_home_kitchen_mobile_app/widgets/circular_progress_indicator.dart';

import '../../api/auth_api.dart';
import '../../db/constants.dart';
import '../../util/navigation_util.dart';
import '../../util/snackbar_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    final mobile = _mobileController.text.trim();
    final password = _passwordController.text.trim();

    if (mobile.isEmpty || password.isEmpty) {
      SnackBarUtil.show(context, "Please enter mobile and password");

      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      SnackBarUtil.show(context, "Logging in...");

      final result = await AuthApi.login(mobile: mobile, password: password);

      SnackBarUtil.show(context, result["message"]);

      if (result["success"] == true) {
        // ✅ Save token & user info (SharedPreferences recommended)
        print("✅ Token: ${result["token"]}");
        print("👤 User: ${result["user"]}");

        StorageUtil.saveUser(result['user']);
        StorageUtil.saveToken(result['token']);

        // Navigate to home screen
        NavigationUtil.pushReplacement(context, HomeScreen());
      }
    } catch (e) {
      print("Error: $e");
      SnackBarUtil.show(context, 'Failed to connect to server');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, primaryColorHover],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    "assets/logo-white.png",
                    height: 120, // adjust size
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome Back',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Email Field
                  TextField(
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      prefixIcon: const Icon(
                        Icons.mobile_friendly_outlined,
                        color: Colors.black87,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black87,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _handleLogin,
                      child: _isLoading
                          ? SizedBox(width: 20, height: 20, child: Loader())
                          : Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account? ',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          //  navigate to register
                          NavigationUtil.pushReplacement(
                            context,
                            SignupScreen(),
                          );
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
