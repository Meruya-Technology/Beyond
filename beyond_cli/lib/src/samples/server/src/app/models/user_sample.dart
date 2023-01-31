class UserSample {
  static String get content => '''
import 'package:beyond/beyond.dart';

/// Table meta data, name, schema
@Table(
  name: 'user',
  schema: 'authentication',
)

/// For now every fields on this model must be nullable, in order to avoid
/// hardcode when initialize empty class for select, and delete method. The
/// empty class initialization is required for mirror purposes
class User extends Model {
  @Field(
    isFillable: false,
    isHidden: true,
    isUpdateable: false,
  )
  final int? id;

  @Field(
    isFillable: false,
    isUpdateable: false,
  )
  final String? createdAt;

  @Field(
    isHidden: true,
    isUpdateable: false,
  )
  final String? password;

  final String? phone;

  final String? email;

  @Field(isUpdateable: false)
  final bool? isActive;

  final String? firstName;

  final String? lastName;

  User({
    this.id,
    this.createdAt,
    this.password,
    this.phone,
    this.email,
    this.isActive,
    this.firstName,
    this.lastName,
  });

  /// Map json into user class
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        createdAt: json['createdAt'],
        password: json['password'],
        phone: json['phone'],
        email: json['email'],
        isActive: json['isActive'],
        firstName: json['firstName'],
        lastName: json['lastName'],
      );

  User copyWith({
    int? id,
    String? createdAt,
    String? password,
    String? phone,
    String? email,
    bool? isActive,
    String? firstName,
    String? lastName,
  }) =>
      User(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        isActive: isActive ?? this.isActive,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
}''';
}
