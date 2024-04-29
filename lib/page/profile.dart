import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/home_screen.dart';

import '../controller/profile_controller.dart';
import '../models/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
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
            ListTile(
              title: Text('All Inbox'),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('All Primary'),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('Promotions'),
              leading: Icon(Icons.local_offer),
            ),
            Divider(
              height: 0.1,
            ),
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
        title: Text("Üpdate Profile"),        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: profileController.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;
                  final username = TextEditingController(text: user.username);
                  final email = TextEditingController(text: user.email);
                  final phonenumber = TextEditingController(text: user.phonenumber);
                  final password = TextEditingController(text: user.password);
                  return Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Set the border color
                              width: 1.0, // Set the border width
                            ),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: ClipOval(
                            child: Image.asset(
                              'image/profile.png', // Replace with your image path
                              width: 70, // Adjust the width as needed
                              height: 70,
                            ),
                          ),
                              ),
                              Positioned(
                              bottom: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Color.fromARGB(255, 198, 204, 210), 
                                  child: const Icon(
                                    Icons.edit_document,
                                    ),
                              ),
                          ),
                          ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50),// First Row: Job Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right:30),  // Adjust the width as needed
                              height: 40,
                              child: TextFormField(
                                controller: username,
                                decoration: InputDecoration(
                                  hintText: AutofillHints.username,
                                  fillColor: Color.fromARGB(255, 187, 201,203), // Change the box color as needed
                                  filled: true,
                                  contentPadding:EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderSide:BorderSide.none, // Remove the default border
                                    borderRadius: BorderRadius.circular(5), // Adjust the border radius as needed
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Second Row: Another Field
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right:30), // Adjust the left margin for the TextFormField
                              width: 50, 
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 187, 201,
                                      203), // Change the box color as needed
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  hintText: AutofillHints.email,// Add your hint text
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Phone no',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only( right: 30), // Adjust the left margin for the TextFormField
                              width: 200,
                              child: TextFormField(
                                controller: phonenumber,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 187, 201,
                                      203), // Change the box color as needed
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  hintText: AutofillHints.telephoneNumber, // Add your hint text
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only( right: 30), // Adjust the left margin for the TextFormField
                              width: 200,
                              child: TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 187, 201,
                                      203), // Change the box color as needed
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  hintText: AutofillHints.telephoneNumber, // Add your hint text
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
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
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Date of birth   ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 187, 201,
                                      203), // Change the box color as needed
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide.none, // Remove the default border
                                    borderRadius: BorderRadius.circular(
                                        5), // Adjust the border radius as needed
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Address          ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'City                  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'District',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
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
                                  fontSize: 18,
                                ),
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30), // Adjust the right margin for 'Job Title'
                            child: Text(
                              'Qualification',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Expanded widget to maintain space between job title and input form
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      30), // Adjust the left margin for the TextFormField
                              width: 200,
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
                                  fontSize: 18,
                                ),
                                maxLines: 2,
                                // Add your text input properties here
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200, // Set the desired width here
                            child: ElevatedButton(
                              onPressed: () async {
                                final userModel = UserModel(
                                  username: username.text.trim(),
                                  email: email.text.trim(),
                                  phonenumber: phonenumber.text.trim(),
                                  password: password.text.trim(),
                                );
                                await profileController.updateRecord(userModel);
                                // Navigate to the other page when the button is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()), // Corrected line
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0E98B6), // Change the background color here
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white, // Set the text color here
                                ),
                              ),
                            ),
                          ),
                        ],
                      )]
                      );
            } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            ),
        ),     
      ),
    );
  }
}
