// ignore_for_file: file_names

import 'package:e_commerce/featuers/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.email, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(email: json['email'] as String, name: json['name'] as String);

  // UserModel.fromJson(dynamic json) {
  //   name = json['name'];
  //   email = json['email'];
  // }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    // map['role'] = role;
    return map;
  }
}
