import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jobgods/controller/author/logout_controller.dart';
import 'package:jobgods/page/categories/c_carpenter.dart';
import 'package:jobgods/page/categories/c_chief.dart';
import 'package:jobgods/page/categories/c_doctor.dart';
import 'package:jobgods/page/categories/c_engineer.dart';
import 'package:jobgods/page/categories/c_mechanic.dart';
import 'package:jobgods/page/categories/c_plumber.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';
import 'package:jobgods/page/setting.dart';
import 'package:jobgods/screens/allusers_screen.dart';
import 'package:jobgods/screens/profile_screen.dart';

import '../controller/profile_controller.dart';
import '../models/user_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                final username = TextEditingController(text: userData.username);
                final email = TextEditingController(text: userData.email);
                final phonenumber = TextEditingController(text: userData.phonenumber);
                final password = TextEditingController(text: userData.password);
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
                          MaterialPageRoute(builder: (context) => Setting()));
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
      body: Column(
        children: [
          SizedBox(height: 10,),
          SizedBox(
            height: 30,
              width: 350,
            child: Text(
            "Catogery",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff000a61),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          )),
          SizedBox(
            height: 5,
          ),
          CarouselSlider(
            options: CarouselOptions(height: 200.0),
            items: [
              "eng.jpg",
              "doc.jpg",
              "plum.jpg",
              "cheif.jpeg",
              "mecha.jpg",
              "car.png"
            ].map((imageName) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      // Use a switch statement to navigate to different pages based on the switch state
                      switch (imageName) {
                        case "eng.jpg":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => C_engineer()),
                          );
                          break;
                        case "plum.jpg":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => C_plumber()),
                          );
                          break;
                        case "doc.jpg":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => C_doctor()),
                          );
                          break;
                        case "cheif.jpeg":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => C_chief()),
                          );
                          break;
                        case "mecha.jpg":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => C_mechanic()),
                          );
                          break;
                        case "car.png":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => C_carpenter()),
                          );
                          break;
                        // Add more cases as needed

                        default:
                          // Handle other cases or set a default page
                          break;
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                            BorderRadius.circular(15.0), // Box border radius
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(15.0), // Image border radius
                        child: Image.asset(
                          'image/$imageName',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Jobs',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(width: 280),
              Text(
                'Sort',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        box1Color =
                            box1Color == Color.fromARGB(209, 207, 236, 238)
                                ? Color.fromARGB(209, 226, 236, 236)
                                : Color.fromARGB(255, 227, 236, 239);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: box1Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: 130,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'image/doctor.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Doctor',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            '20 Jobs',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        box2Color =
                            box2Color == Color.fromARGB(209, 207, 236, 238)
                                ? Color.fromARGB(209, 226, 236, 236)
                                : Color.fromARGB(255, 227, 236, 239);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: box2Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: 130,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'image/engineer.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Engineer',
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            '12 Jobs',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        box3Color =
                            box3Color == Color.fromARGB(209, 207, 236, 238)
                                ? Color.fromARGB(209, 226, 236, 236)
                                : Color.fromARGB(255, 227, 236, 239);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: box1Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: 130,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'image/plumber.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Plumber',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            '14 Jobs',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        box4Color =
                            box4Color == Color.fromARGB(209, 207, 236, 238)
                                ? Color.fromARGB(209, 226, 236, 236)
                                : Color.fromARGB(255, 227, 236, 239);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: box2Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: 130,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'image/mechanic.jpeg',
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Mechanic',
                            style: TextStyle(color: Colors.black),
                          ),
                          const Text(
                            '18 Jobs',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
