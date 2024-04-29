import 'package:flutter/material.dart';
import 'dart:async';
import 'package:jobgods/screens/login_screen.dart';

class PasswordchangesuccessScreen extends StatefulWidget {
  const PasswordchangesuccessScreen({super.key});
  @override
  State<PasswordchangesuccessScreen> createState() => _PasswordchangesuccessScreenState();
}

class _PasswordchangesuccessScreenState extends State<PasswordchangesuccessScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
      ()=>Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
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
                  text: "Successfully Reset Password link sent it for your mail",
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
                  text: "Your password has been updated, please change your password regularly to avoid this happening",
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