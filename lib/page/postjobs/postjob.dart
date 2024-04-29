import 'package:flutter/material.dart';
import 'package:jobgods/page/postjobs/congrats.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';

class Postjob extends StatefulWidget {
  const Postjob({Key? key}) : super(key: key);

  @override
  State<Postjob> createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff00B6CE),
              ),
              accountName: Text('Sivakkanth'),
              accountEmail: Text('asivabkanth@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  "image/profile.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person),
                  ),
                  Divider(
                    height: 0.1,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => S_post()));
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Posted job'),
                    leading: Icon(Icons.post_add),
                  ),
                  Divider(
                    height: 0.1,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => S_apply()));
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Applied job'),
                    leading: Icon(Icons.app_registration_outlined),
                  ),
                  Divider(
                    height: 0.1,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Setting'),
                    leading: Icon(Icons.settings),
                  ),
                  Divider(
                    height: 0.1,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Log out'),
                    leading: Icon(Icons.logout),
                  ),
                  Divider(
                    height: 0.1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xff00B6CE)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "image/logo.jpeg",
                    ),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(
                    color: Color(0xff0E98B6),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Job', // Add your small text here
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff000a61),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'gods', // Add your small text here
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff0e98b6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: ClipOval(
                child: Image.asset(
                  "image/profile.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xff0E98B6), // Set the border color
                    width: 1.0, // Set the border width
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'image/doctor.png', // Replace with your image path
                    width: 80, // Adjust the width as needed
                    height: 80, // Adjust the height as needed
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            // First Row: Job Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Job Tittle   ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 50, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Second Row: Another Field
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Date           ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 50, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Location    ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Role            ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'enter your position', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Salary         ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Website      ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Company name ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Contact number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 25,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Discribtion       ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 2,
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 80), // Adjust the right margin for 'Job Title'
                  child: Text(
                    'Qualification &\nExperience',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                // Expanded widget to maintain space between job title and input form
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right:
                            80), // Adjust the left margin for the TextFormField
                    width: 200, // Adjust the width as needed
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 187, 201,
                            203), // Change the box color as needed
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: '', // Add your hint text
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 187, 201, 203)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // Remove the default border
                          borderRadius: BorderRadius.circular(
                              5), // Adjust the border radius as needed
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 2,
                      // Add your text input properties here
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200, // Set the desired width here
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the other page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Congrats()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0E98B6), // Change the background color here
                    ),
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white, // Set the text color here
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Add more rows and fields as needed
          ],
        ),
      ),
    );
  }

  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    bool? exitApp = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Really??"),
          content: const Text("Do you want to close the app??"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );

    return exitApp ?? false;
  }
}
