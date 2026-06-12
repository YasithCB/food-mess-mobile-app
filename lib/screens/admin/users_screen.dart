import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/screens/admin/user_form_screen.dart';

import '../../api/user_api.dart';
import '../../models/user_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UsersScreen> {
  late Future<List<UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    // 1. Update the variable directly
    _usersFuture = UserApi.fetchAllUsers();

    // 2. Trigger the rebuild synchronously
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Users")),
      body: FutureBuilder<List<UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];

              // Wrap in a Container for background color and margin
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: backgroundColor2, // 👈 Your background color here
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.mobile),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 👈 Important: Keeps the Row as small as possible
                      IconButton(
                        icon: Icon(Icons.edit, color: primaryColor),
                        // For the Edit button in your ListView
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => UserFormScreen(user: user)),
                          );

                          if (result == true) {
                            _loadUsers(); // Refresh when true is received
                          }
                        },
                      ),
                      // Button 2: Delete
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          bool deleted = await UserApi.deleteUser(user.id);
                          if (deleted) _loadUsers();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // For the Add button (FAB)
        onPressed: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UserFormScreen())
          );

          if (result == true) {
            _loadUsers(); // Refresh when true is received
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
