import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jobgods/screens/login_screen.dart';

class LogoutController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.to(() => LoginScreen());
    } catch (e) {
      // Handle any potential errors during the sign-out process
      print("Error during logout: $e");
    }
  }
}