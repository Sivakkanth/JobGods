import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/screens/login_screen.dart';
import 'package:jobgods/screens/widgets/my_text_form.dart';
import 'package:jobgods/controller/author/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();
    return Material(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffefefe),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0d0140),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: 350,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              "You can easily create an account and also You can easily post a job after create an account",
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
                      MyTextField(
                        label: "Geodhb",
                        icons: Icons.person,
                        onchange: signupController.username,
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: Column(
                    children: [
                      MyTextField(
                        label: "asjghud@gmail.com",
                        icons: Icons.mail,
                        onchange: signupController.email,
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
                    "Phone Number",
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
                      MyTextField(
                        label: "0756154421",
                        icons: Icons.phone,
                        onchange: signupController.phonenumber,
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
                    "Password",
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
                      MyTextField(
                        label: "HGF@6549",
                        icons: Icons.lock,
                        onchange: signupController.password,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                          username: signupController.username.text.trim(),
                          email: signupController.email.text.trim(),
                          phonenumber: signupController.phonenumber.text.trim(),
                          password: signupController.password.text.trim(),
                        );
                        SignupController.instance.createUser(user);
                        signupController.OnSignUp();
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => SignupsuccessScreen(),
                      //     ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                    child: Text(
                      'Sign Up', // Add your small text here
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
                      "If You have an Account? ",
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
      ),
    );
  }
}
