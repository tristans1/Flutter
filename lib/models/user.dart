import 'dart:convert';

class User {
  int? id;
  String name;
  int? userId;
  String userPassword;

  User({
    this.id,
    required this.name,
    this.userId,
    required this.userPassword,
  });

  User copyWith({
    int? id,
    String? name,
    int? userId,
    String? userPassword,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (null != id) {
      result.addAll({'id': id});
    }
    if (null != name) {
      result.addAll({'name': name});
    }
    if (null != userId) {
      result.addAll({'userId': userId});
    }
    if (null != userPassword) {
      result.addAll({'userPassword': userPassword});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'],
      userId: map['userId'],
      userPassword: map['userPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, userId: $userId password: $userPassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is User && other.id == id && other.name == name && other.userId == userId && other.userPassword == userPassword;
    }
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ userId.hashCode ^ userPassword.hashCode;
  }
}