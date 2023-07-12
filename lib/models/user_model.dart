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

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': roleToString(role),
    };
  }

  // fromMap method
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      role: stringToRole(map['role']),
    );
  }
}

enum UserRole {
  Donor,
  Requester,
  Admin,
}

String roleToString(UserRole role) {
  switch (role) {
    case UserRole.Donor:
      return 'Donor';
    case UserRole.Requester:
      return 'Requester';
    case UserRole.Admin:
      return 'Admin';
    default:
      throw ArgumentError('Invalid role value: $role');
  }
}

UserRole stringToRole(String roleString) {
  switch (roleString) {
    case 'Donor':
      return UserRole.Donor;
    case 'Requester':
      return UserRole.Requester;
    case 'Admin':
      return UserRole.Admin;
    default:
      throw ArgumentError('Invalid role string: $roleString');
  }
}
