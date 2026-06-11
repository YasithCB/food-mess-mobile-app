import 'package:food_mess_mobile_app/screens/admin/admin_home_screen.dart';
import 'package:food_mess_mobile_app/util/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/screens/auth/signup_screen.dart';
import 'package:food_mess_mobile_app/screens/home_screen.dart';
import 'package:food_mess_mobile_app/widgets/circular_progress_indicator.dart';

import '../../api/user_api.dart';
import '../../db/constants.dart';
import '../../models/user_model.dart';
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
  bool _isAdmin = false;

  Future<void> _handleLogin() async {

    if(_isAdmin) {
      // Navigate to Admin
      if (mounted) {
        NavigationUtil.pushReplacement(context, AdminHomeScreen());
      }
    }

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

      // 🔹 Swapped out AuthApi for your updated UserApi platform service
      final result = await UserApi.login(mobile: mobile, password: password);

      // Provide immediate visual feedback based on back-end return strings
      SnackBarUtil.show(context, result["message"] ?? "Processing request");

      if (result["status"] == 'success') {
        // Extract the data nested envelope object safely
        final payload = result['data'] as Map<String, dynamic>;

        final String token = payload["token"] ?? '';
        final Map<String, dynamic> userData = payload["user"] ?? {};

        // 🔹 1. Instantiate the user map layout into a structured Model Object
        final UserModel userModel = UserModel.fromJson(userData);
        currentUser = userModel;

        print("✅ Token: $token");
        print(
          "👤 Model Object Configured: ${userModel.name} (ID: ${userModel.id})",
        );

        // 🔹 2. Save the structured model and token via your updated storage runner
        await StorageUtil.saveUser(userModel);
        await StorageUtil.saveToken(token);

        // Navigate to home screen
        if (mounted) {
          NavigationUtil.pushReplacement(context, HomeScreen());
        }
      }
    } catch (e) {
      print("Error during _handleLogin: $e");
      SnackBarUtil.show(context, 'Failed to connect to server');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor, backgroundColor2],
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
                    _isAdmin ? 'Admin Login' : 'Welcome Back',
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
                        color: Colors.white70,
                      ),
                      filled: true,
                      fillColor: backgroundColor2,
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
                        color: Colors.white70,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: backgroundColor2,
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
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _handleLogin,
                      child: _isLoading
                          ? SizedBox(width: 20, height: 20, child: Loader())
                          : Text(
                              _isAdmin ? 'ADMIN LOGIN' : 'LOGIN',
                              style: TextStyle(
                                fontSize: 15,
                                color: backgroundColor2,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
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
                        style: const TextStyle(color: Colors.white54, fontSize: 13),
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
                          'Request a Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Admin Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isAdmin ? 'Are You an Customer? ' : 'Are you a Admin? ',
                        style: const TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAdmin = !_isAdmin;
                          });
                        },
                        child: Text(
                          _isAdmin ? 'Login As Customer' : 'Login As Admin',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13
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
