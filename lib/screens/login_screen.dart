import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/screens/forgot_screen.dart';
import 'package:jobgods/screens/signup_screen.dart';
import 'package:jobgods/controller/author/login_controller.dart';
import 'package:jobgods/screens/widgets/my_text_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfffefefe),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "image/Logoonly.jpg",
                width: 140,
                height: 220,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0d0140),
                ),
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
                            "You can easily find your favourite job and also You can easily post a job",
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
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Column(
                  children: [
                    MyTextField(
                      label: "Geobdc@gmail.com",
                      icons: Icons.person,
                      onchange: loginController.email,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: Column(
                  children: [
                    MyTextField(
                      label: "HGF@6549",
                      icons: Icons.lock,
                      onchange: loginController.password,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotScreen(),
                            ));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff4dc7e6),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginController.onLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                  child: Text(
                    'Log In', // Add your small text here
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
                    "Don't Have an Account? ",
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
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
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
