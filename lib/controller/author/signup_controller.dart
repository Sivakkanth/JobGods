import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/repository/authentication_respository/authentication_respository.dart';
import 'package:jobgods/repository/user_respository/user_respository.dart';
import 'package:jobgods/screens/createsuccess_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final username = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final password = TextEditingController();
  final gender = TextEditingController();
  final dateofbirth = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final district = TextEditingController();
  final qualification = TextEditingController();
  final userRepo = Get.put(UserRespository());
  //final FirebaseAuth auth = FirebaseAuth.instance;

  void OnSignUp() {
    print("User NAme : " + username.text);
    print("Email : " + email.text);
    print("Phone Number : " + phonenumber.text);
    print("Password : " + password.text);
    createAccount(email.text, password.text);
  }

  void createAccount(String email, String password) {
    String? error = AuthenticationRespository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.creatUser(user);
    Get.to(() => const SignupsuccessScreen());
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phonenumber.dispose();
    password.dispose();
    super.dispose();
  }

//   Future<void> createAccount(
//       String email, String password) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       print("Account Successfully Created");
//       Get.to(() => SignupsuccessScreen());
//       Fluttertoast.showToast(
//         msg: "Account Created",
//         backgroundColor: Colors.green[600],
//       );
//     } on FirebaseAuthException catch (ex) {
//       if (ex.code == "weak-password") {
//         print("Weak Password");
//         Fluttertoast.showToast(
//           msg: "Weak Password",
//           backgroundColor: Colors.orange[400],
//         );
//       } else if (ex.code == "email-already-in-use") {
//         print("Email Already exists  Login Please!");
//         Fluttertoast.showToast(
//           msg: "Email Already exists  Login Please!",
//           backgroundColor: Colors.red[600],
//         );
//       }
//     } catch (ex) {
//       print(ex);
//     }
//   }
}
