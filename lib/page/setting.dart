import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/controller/profile_controller.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';
import 'package:jobgods/screens/allusers_screen.dart';
import 'package:jobgods/screens/profile_screen.dart';

import '../controller/author/logout_controller.dart';
import '../models/user_model.dart';

class Setting extends StatefulWidget {
  //const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  final logoutcontroller = Get.put(LogoutController());
  Color box1Color = Color.fromARGB(209, 226, 236, 236);
  Color box2Color = Color.fromARGB(209, 226, 236, 236);
  Color box3Color = Color.fromARGB(209, 226, 236, 236);
  Color box4Color = Color.fromARGB(209, 226, 236, 236);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      drawer: Drawer(
        elevation: 16.0,
        child: FutureBuilder(
          future: profileController.getUserData(), 
          builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                UserModel userData = snapshot.data as UserModel;
                return Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff00B6CE),
                    ),
                    accountName: Text('${userData.username}'),
                    accountEmail: Text('${userData.email}'),
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
                          onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                          },
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
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllusersScreen(),
                          ));
                    },
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('All Users'),
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
              );
              }else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
            }else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
          },
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

     body: SingleChildScrollView(
        child: Column(
          children: [
            buildSection(
              'Account',
              'Welcome to your JobGods account, Dilen! This is your personalized space where you have full control over your experience within the app. Manage your profile information, update preferences, and fine-tune settings to align with your career goals seamlessly. Whether it is updating contact details, modifying notification preferences, or exploring additional features, your journey begins here. Dive in and make JobGods work for you, Dilen!',
              isExpanded1,
              Icons.account_box,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            buildSection(
              'Privacy & Security',
              'At JobGods, safeguarding your privacy and ensuring the security of your information are our top priorities. We understand the importance of trust, and we are dedicated to protecting the personal data you share with us. Our commitment to your security is reflected in various measures. \nWe implement robust data encryption protocols for all communications between your device and our servers. This industry-standard encryption guarantees that your sensitive information remains confidential and secure throughout its journey.\nYour privacy and security are paramount at JobGods. If you have any concerns or questions regarding our privacy and security practices, our support team is always ready to assist you. Thank you for choosing JobGods!',
              isExpanded2,
              Icons.lock,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            buildSection(
              'Help and Support',
              'Your privacy and security are paramount at JobGods. If you have any concerns or questions regarding our privacy and security practices, our support team is always ready to assist you. Thank you for choosing JobGods!',
              isExpanded3,
              Icons.help,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            buildSection(
              'About',
              'Welcome to JobGods, where opportunities meet ambition! Our app is designed to empower individuals in their career journeys, offering a dynamic platform to connect talented professionals with exciting opportunities. At JobGods, we believe in the transformative power of meaningful work. Whether you are seeking new challenges or aiming to discover the perfect candidate, our innovative features and user-friendly interface make the job-seeking and recruitment process a breeze. Join us in shaping the future of work, where every connection brings new possibilities. Your career adventure starts here with JobGods.',
              isExpanded4,
              Icons.info,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                _showLogoutConfirmationDialog(context);
                // Implement your log out functionality here
                // For example, you can show a confirmation dialog and log out on confirmation
                // Sample code: showLogoutConfirmationDialog();
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(
      String title, String content, bool isExpanded, IconData iconData) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      iconData,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (title == 'Account') {
                            isExpanded1 = !isExpanded1;
                          } else if (title == 'Privacy & Security') {
                            isExpanded2 = !isExpanded2;
                          } else if (title == 'Help and Support') {
                            isExpanded3 = !isExpanded3;
                          } else if (title == 'About') {
                            isExpanded4 = !isExpanded4;
                          }
                        });
                      },
                      icon: Icon(
                        isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isExpanded,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
                logoutcontroller.logout();
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
