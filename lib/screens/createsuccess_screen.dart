import 'package:flutter/material.dart';
import 'package:jobgods/home_screen.dart';
import 'dart:async';

class SignupsuccessScreen extends StatefulWidget {
  const SignupsuccessScreen({super.key});
  @override
  State<SignupsuccessScreen> createState() => _SignupsuccessScreenState();
}

class _SignupsuccessScreenState extends State<SignupsuccessScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
      ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
        ),
        child: Column(
          children: [
            SizedBox(height: 250,),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Successfully Account Created",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff0D0140),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Image.asset(
              "image/successreate.png",
              width: 200,
              height: 200,
              ),
            SizedBox(height: 30,),
            SizedBox(
              width: 320,
              child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Your Account has been successfully created, You can find your favourite job and you can post your available job",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff524B6B),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
              textAlign: TextAlign.center,
            ),
              ),
            ],
        ),
      ),
    );
  }
}
/**
 * import 'package:lottie/lottie.dart';
 * lottie: ^2.7.0
 * Lottie.asset('assets/blast.json',
                        width: 150, height: 150, fit: BoxFit.fill),
 */