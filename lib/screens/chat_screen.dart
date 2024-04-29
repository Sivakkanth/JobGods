import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0e98b6), Color(0xffFFFFFF)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),

        title: Center(
          child: Container(
           
            margin: EdgeInsets.only(top: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      '../lib/image/logo.jpeg',
                      width: 30,
                      height: 40,
                      
                      fit: BoxFit.fill,
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: 'Job',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 10, 97, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'gods',
                            style: TextStyle(
                              color: Color.fromRGBO(14, 152, 182, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Positioned(
                  right: 40,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        '../lib/image/profile.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add your job details here!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more widgets for job details input fields or any other content
          ],
        ),
      ),
    );
  }
}