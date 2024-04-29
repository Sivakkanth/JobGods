import 'package:flutter/material.dart';
import 'package:jobgods/screens/welcome_screen1.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //alignment: Alignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 150.0), //symetric for top and bottom
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to', // Add your small text here
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Job', // Add your small text here
                      style: TextStyle(
                        fontSize: 45,
                        color: Color(0xff000a61),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'gods', // Add your small text here
                      style: TextStyle(
                        fontSize: 45,
                        color: Color(0xff0e98b6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(39),
              child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "The best job finder & job portal app where the best jobs will find you",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        ),
                      ]
                    ),
                textAlign: TextAlign.center,
                )
              )
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen1(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680aa),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      side: BorderSide(color: Colors.white, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Text(
                      'Get Start', // Add your small text here
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),

    )    
    );
  }
}
