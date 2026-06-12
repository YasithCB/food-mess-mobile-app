import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/screens/admin/users_screen.dart';

import '../../api/user_api.dart';
import '../../models/user_model.dart';

class UserFormScreen extends StatefulWidget {
  final UserModel? user; // Null if creating, provided if updating

  const UserFormScreen({super.key, this.user});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _mobileController.text = widget.user!.mobile;
    }
  }

  Future<void> _saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final payload = {
      "name": _nameController.text,
      "mobile": _mobileController.text,
      "password": _passwordController.text,
    };

    bool success = false;
    if (widget.user == null) {
      // Logic for POST (Create)
      success = await UserApi.createUser(payload);
    } else {
      // Logic for PUT (Update)
      success = await UserApi.updateUser(widget.user!.id, payload);
    }

    setState(() => _isLoading = false);

    if (success) {
      // This pops the screen AND sends 'true' back to the previous screen
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to save user")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "Add User" : "Edit User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "User Name"),
                validator: (v) => v!.isEmpty ? "Name required" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(labelText: "Mobile Number"),
                validator: (v) => v!.isEmpty ? "Name required" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                keyboardType: TextInputType.phone,
                validator: (v) =>
                    v!.length < 6 ? "Password must have 6 characters" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                keyboardType: TextInputType.phone,
                validator: (v) => v != _passwordController.text
                    ? "Passwords do not match"
                    : null,
              ),
              const SizedBox(height: 20),

              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      // 👈 Makes the button fill the available width
                      height: 40,
                      // 👈 Sets a modern, touch-friendly height
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              primaryColor, // Use your primary color
                          foregroundColor: backgroundColor2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Modern rounded corners
                          ),
                          elevation: 0, // Flat, modern design
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "SAVE USER",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 2,
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
