import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/controller/profile_controller.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/page/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: profileController.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  final username =
                      TextEditingController(text: userData.username);
                  final email = TextEditingController(text: userData.email);
                  final phonenumber =
                      TextEditingController(text: userData.phonenumber);
                  final password =
                      TextEditingController(text: userData.password);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 320,
                        child: Text(
                          "Username",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Text(
                                  userData.username,
                                  // controller: username,
                                  // decoration: const InputDecoration(
                                  //   hintText: AutofillHints.username,
                                  //   prefixIcon: Icon(Icons.person),
                                  //   filled: true,
                                  //   fillColor: Color(0x8cb4dee8),
                                  //   border: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //       width: 0,
                                  //     ),
                                  //   ),
                                  //)
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 15, 39, 223),
                                  ),
                                  textAlign: TextAlign.left,
                                  ),
                            ],
                          ),
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 340,
                          child: Column(
                            children: [
                              Text(
                                  userData.email,
                                  // controller: email,
                                  // decoration: const InputDecoration(
                                  //   hintText: AutofillHints.email,
                                  //   prefixIcon: Icon(Icons.email),
                                  //   filled: true,
                                  //   fillColor: Color(0x8cb4dee8),
                                  //   border: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //       width: 0,
                                  //     ),
                                  //   ),
                                  // )
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 15, 39, 223),
                                  ),
                              ),
                            ],
                          ),
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 240,
                          child: Column(
                            children: [
                              Text(
                                  userData.phonenumber,
                                  // controller: phonenumber,
                                  // decoration: const InputDecoration(
                                  //   hintText: AutofillHints.telephoneNumber,
                                  //   prefixIcon: Icon(Icons.phone),
                                  //   filled: true,
                                  //   fillColor: Color(0x8cb4dee8),
                                  //   border: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //       width: 0,
                                  //     ),
                                  //   ),
                                  // )
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 15, 39, 223),
                                  ),
                              ),
                            ],
                          ),
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 180,
                          child: Column(
                            children: [
                              Text(
                                  userData.password,
                                  // controller: password,
                                  // decoration: const InputDecoration(
                                  //   hintText: AutofillHints.password,
                                  //   prefixIcon: Icon(Icons.lock),
                                  //   filled: true,
                                  //   fillColor: Color(0x8cb4dee8),
                                  //   border: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //       width: 0,
                                  //     ),
                                  //   ),
                                  // )
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 15, 39, 223),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            // final user = UserModel(
                            //   username: username.text.trim(),
                            //   email: email.text.trim(),
                            //   phonenumber: phonenumber.text.trim(),
                            //   password: password.text.trim(),
                            // );
                            // await profileController.updateRecord(user);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff000a61), backgroundColor: Color(0xff3680AA),
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          child: Text(
                            'Edit Profile', // Add your small text here
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
                            "If You don't need an Account? ",
                            style: TextStyle(
                              color: Color(0xff524B6B),
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Delete Account",
                                style: TextStyle(
                                  color: Colors.red,
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

// class ProfileMenuWidget extends StatelessWidget {
//   const ProfileMenuWidget ({
//     Key? key, required this.title, required this.icon, required this.onPress, required this.endIcon, this.textColor,
//   }) : super(key: key);

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? textColor;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.blue.withOpacity(0.1),
//         ),
//         child: const Icon(Icons.person),
//       ),
//       title: Text(
//         "${title}",
//         textAlign: TextAlign.left,
//         style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w800,
//         ),
//       ),
//       trailing: endIcon? Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.grey.withOpacity(0.1),
//         ),
//         child: const Icon(Icons.lock),
//       ):null,
//     );
//   }
// }