import 'package:get/get.dart';
import 'package:jobgods/screens/login_screen.dart';
import 'package:jobgods/screens/signup_screen.dart';

var pages = [
  GetPage(name: "/login", page: () => LoginScreen(),),
  GetPage(name: "/signup", page: () => SignupScreen(),),
];