import 'package:flutter/material.dart';
import 'package:jobgods/home_screen.dart';

class Congrats extends StatefulWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  void initState() {
    super.initState();

    // Add a delay and then navigate to the home page
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: 20), // Adjust the top margin as needed
              child: Text(
                'Successfully! Add your job details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 19, 167),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Add your image here
            Image.asset(
              'image/congrats.png', // Replace with your image path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
