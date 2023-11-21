class UserModel {
  final String name;
  final String phoneNumber;
  final String carNumber;
  final String password;
  final bool isAdmin;

  const UserModel({
    required this.name,
    required this.phoneNumber,
    required this.carNumber,
    required this.password,
    this.isAdmin = false,
  });

  Map<String, Object?> toMap() => {
        'name': name,
        'phone_number': phoneNumber,
        'car_number': carNumber,
        'password': password,
        'is_admin': isAdmin,
      };

  factory UserModel.fromMap(Map<String, Object?> map) => UserModel(
        name: map['name'] as String,
        phoneNumber: map['phone_number'] as String,
        carNumber: map['car_number'] as String,
        password: map['password'] as String,
        isAdmin: map['is_admin'] as bool,
      );

  @override
  String toString() {
    return 'UserModel{name: $name, phoneNumber: $phoneNumber, '
        'carNumber: $carNumber, password: $password, '
        'isAdmin: $isAdmin}';
  }
}
