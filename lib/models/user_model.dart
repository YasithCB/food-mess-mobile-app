class UserModel {
  final String id;
  final String name;
  final String mobile;

  UserModel({
    required this.id,
    required this.name,
    required this.mobile,
  });

  // Factory constructor to handle incoming JSON object profiles cleanly
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      mobile: json['mobile'] as String,
    );
  }

  // Converts variables back to a JSON payload map for registration requests
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': mobile,
    };
  }
}