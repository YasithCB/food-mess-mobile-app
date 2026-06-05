class UserModel {
  final int id;
  final String name;
  final String mobile;
  final String? password;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.mobile,
    this.password,
    required this.createdAt,
  });

  // Factory constructor to handle incoming JSON object profiles cleanly
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      password: json['password'] as String?, // Will be null on standard GET fetches
      createdAt: json['created_at'] as String,
    );
  }

  // Converts variables back to a JSON payload map for registration requests
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
      if (password != null) 'password': password,
    };
  }
}