import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jobgods/home_screen.dart';
import 'package:jobgods/repository/authentication_respository/exception/signup_email_password_failure.dart';
import 'package:jobgods/screens/Splash_screen.dart';
import 'package:jobgods/screens/login_screen.dart';

class AuthenticationRespository extends GetxController {
  static AuthenticationRespository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          firebaseUser.value != null ? Get.offAll(()=> const HomeScreen()) : Get.to(()=>LoginScreen());
      //print("Account Successfully Created");
      //Get.to(() => SignupsuccessScreen());
      // Fluttertoast.showToast(
      //   msg: "Account Created",
      //   backgroundColor: Colors.green[600],
      // );
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailture.code(e.code);
      print('FIREBASE AUTH EXCEPTION ${ex.message}');
      throw ex;
      //if (ex.code == "weak-password") {
      //   print("Weak Password");
      //   Fluttertoast.showToast(
      //     msg: "Weak Password",
      //     backgroundColor: Colors.orange[400],
      //   );
      // } else if (ex.code == "email-already-in-use") {
      //   print("Email Already exists  Login Please!");
      //   Fluttertoast.showToast(
      //     msg: "Email Already exists  Login Please!",
      //     backgroundColor: Colors.red[600],
      //   );
      //}
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailture();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // print("Login");
      // Fluttertoast.showToast(
      //   msg: "Login",
      //   backgroundColor: Colors.green[600],
      // );
    } on FirebaseAuthException catch (e) {
      // if (ex.code == "user-not-found") {
      //   print("email id does not exists");
      //   Fluttertoast.showToast(
      //   msg: "email id does not exists",
      //   backgroundColor: Colors.orange[600],
      // );
      // } else if (ex.code == "wrong-password") {
      //   Fluttertoast.showToast(
      //   msg: "Wrong Password",
      //   backgroundColor: Colors.red[400],
      // );
      //   print("Wrong Password");
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
