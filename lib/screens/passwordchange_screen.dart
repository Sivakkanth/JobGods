import 'package:flutter/material.dart';
import 'package:jobgods/screens/forgot_screen.dart';
import 'package:jobgods/screens/passwordchangesuccess_screen.dart';


class PasswordchangeScreen extends StatelessWidget {
  const PasswordchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(    
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
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
                        builder: (context) => ForgotScreen(),
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
              SizedBox(height: 10,),
              Text(
                'Create New Password',
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
                "image/Newpassword.png",
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
                          "Now you can set new password and update your password of your account.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff524b6b),
                      ),
                    ),
                  ]),
                  textAlign: TextAlign.center,
                )),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 320,
                child: Text(
                "New Password",
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
                          hintText: "sive@321",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
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
                "Confirm Password",
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
                        decoration: InputDecoration(
                          hintText: "Geordf@35",
                          prefixIcon: Icon(Icons.lock),
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
                height: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordchangesuccessScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                child: Text(
                  'Change Password', // Add your small text here
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )),
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