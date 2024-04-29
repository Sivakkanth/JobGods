import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jobgods/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void onLogin() {
    signIn(email.text, password.text);
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("Login");
      Get.to(() => const HomeScreen());
      _emailController.clear();
      _passController.clear();
      Fluttertoast.showToast(
        msg: "Login",
        backgroundColor: Colors.green[600],
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        print("email id does not exists");
        Fluttertoast.showToast(
        msg: "email id does not exists",
        backgroundColor: Colors.orange[600],
      );
      } else if (ex.code == "wrong-password") {
        Fluttertoast.showToast(
        msg: "Wrong Password",
        backgroundColor: Colors.red[400],
      );
        print("Wrong Password");
      }
    }
  }
}
