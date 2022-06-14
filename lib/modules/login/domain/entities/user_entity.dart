class UserEntity {
  final String name;
  final String email;
  final String cpf;
  final String phone;
  final String location;
  final String profile;
  final String? password;
  final String? token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.cpf,
    required this.phone,
    required this.location,
    this.token,
    this.profile = '',
    this.password,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      name: '',
      email: '',
      cpf: '',
      phone: '',
      location: '',
    );
  }

  UserEntity copyWith({
    String? name,
    String? email,
    String? cpf,
    String? phone,
    String? location,
    String? password,
    String? profile,
  }) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      password: password ?? this.password,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.name == name &&
        other.email == email &&
        other.cpf == cpf &&
        other.phone == phone &&
        other.location == location &&
        other.password == password &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        cpf.hashCode ^
        phone.hashCode ^
        location.hashCode ^
        password.hashCode ^
        profile.hashCode;
  }
}
