class UserModel {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final bool discount;

  const UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.discount,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json[UserField.id] as int?,
        name: json[UserField.name] as String,
        phone: json[UserField.phone] as String,
        email: json[UserField.email] as String,
        password: json[UserField.password] as String,
        discount: json[UserField.discount] == 1,
      );

  UserModel copy({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? password,
    bool? discount,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        email: email ?? this.email,
        discount: discount ?? this.discount,
      );

  Map<String, Object?> toJson() => {
        UserField.id: id,
        UserField.name: name,
        UserField.phone: phone,
        UserField.email: email,
        UserField.password: password,
        UserField.discount: discount ? 1 : 0
      };
}

class UserField {
  static final List<String> values = [
    id,
    name,
    phone,
    email,
    password,
    discount
  ];
  static const String id = '_id';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String email = 'email';
  static const String password = 'password';
  static const String discount = 'discount';
}
