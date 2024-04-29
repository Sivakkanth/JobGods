import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:jobgods/screens/forgot_screen.dart';
import 'package:jobgods/screens/passwordchange_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  TextEditingController textEditingController =
      new TextEditingController(text: "");

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
                    Navigator.push(
                        context,
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
              SizedBox(
                height: 10,
              ),
              Text(
                'OTP Code Verification',
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
                "image/successreate.png",
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
                            "We have sent the OTP code to your email address. please check you mail address...",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff524b6b),
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 100,
              ),
              TextFieldPin(
                  textController: textEditingController,
                  autoFocus: false,
                  codeLength: 4,
                  alignment: MainAxisAlignment.center,
                  defaultBoxSize: 55.0,
                  margin: 10,
                  selectedBoxSize: 46.0,
                  textStyle: TextStyle(fontSize: 16),
                  defaultDecoration: _pinPutDecoration.copyWith(
                  border: Border.all(color: Colors.black)),
                  selectedDecoration: _pinPutDecoration,
                  onChange: (code) {
                    setState(() {
                      
                    });
                  }),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordchangeScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                  child: Text(
                    'Verify', // Add your small text here
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
                    "You have not receive the email? ",
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
                            builder: (context) => OtpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Resend",
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
