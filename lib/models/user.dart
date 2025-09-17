

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Convert User to Map (for storage)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  // Create User from Map (from storage)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}