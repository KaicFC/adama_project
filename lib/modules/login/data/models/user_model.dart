import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String cpf;
  final String phone;
  final String location;
  final String profile;
  final String? password;
  final String? token;

  const UserModel({
    required this.name,
    required this.email,
    required this.cpf,
    required this.phone,
    required this.location,
    this.profile = '',
    this.password,
    this.token,
  });

  @override
  List<Object?> get props =>
      [name, email, cpf, phone, location, profile, token];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'phone': phone,
      'location': location,
      'profile': profile,
      'password': password,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      phone: map['phone'] ?? '',
      location: map['location'] ?? '',
      profile: map['profile'] ?? '',
      password: map['password'],
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
