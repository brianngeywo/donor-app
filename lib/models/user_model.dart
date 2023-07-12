class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
  //toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  //fromMap method
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      role: map['role'],
    );
  }
}

enum UserRole {
  Donor,
  Requester,
  Admin,
}
