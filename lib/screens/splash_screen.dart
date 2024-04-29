import 'package:flutter/material.dart';
import 'dart:async';
import 'package:jobgods/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
      ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2bacc8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(8.0),
                child: Image.asset('image/Loading_image.png'),
              ),
            ),
            Text(
              'JOB GODS', // Add your small text here
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
