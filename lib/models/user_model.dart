import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String username;
  final String email;
  final String phonenumber;
  final String password;

  const UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.phonenumber,
    required this.password,
  });

  toJson() {
    return {
      "Username": username,
      "Email": email,
      "Phone": phonenumber,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      username: data["Username"],
      email: data["Email"],
      phonenumber: data["Phone"],
      password: data["Password"],
    );
  }
}
