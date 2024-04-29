import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/repository/authentication_respository/authentication_respository.dart';
import 'package:jobgods/screens/Splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRespository()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jobgods',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
