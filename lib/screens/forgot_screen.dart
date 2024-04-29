import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/screens/login_screen.dart';
import 'package:jobgods/screens/otp_screen.dart';
import 'package:jobgods/screens/passwordchangesuccess_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(    
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                elevation: 2.0,
                fillColor: Color(0xff3680aa),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20.0,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0d0140),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "image/Forgotpassword.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 350,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            "Please Enter Your Username and Email address. You will receive a OTP number to verify you",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff524b6b),
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 320,
                child: Text(
                "Username",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "George",
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: Color(0x8cb4dee8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                child: Text(
                "Email",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: forgotPasswordController,
                        decoration: InputDecoration(
                          hintText: "Georhg@gmail.com",
                          prefixIcon: Icon(Icons.mail),
                          filled: true,
                          fillColor: Color(0x8cb4dee8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () async {
                  var forgotEmail = forgotPasswordController.text.trim();
                  try{
                    await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: forgotEmail)
                    .then((value) => {
                      print("Email Sent!"),
                      Get.off(()=>PasswordchangesuccessScreen()),
                    });
                  }on FirebaseAuthException catch(e){
                    print("Error $e");
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                  padding:
                      EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                child: Text(
                  'Send OTP', // Add your small text here
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If You can remember the password ",
                    style: TextStyle(
                      color: Color(0xff524B6B),
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff4DC7E6),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}