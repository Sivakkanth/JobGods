import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobgods/controller/author/logout_controller.dart';
import 'package:jobgods/controller/profile_controller.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/page/postjobs/postjob.dart';
import 'package:jobgods/page/postjobs/postjobcarpenter.dart';
import 'package:jobgods/page/postjobs/postjobchief.dart';
import 'package:jobgods/page/postjobs/postjobeng.dart';
import 'package:jobgods/page/postjobs/postjobmechanic.dart';
import 'package:jobgods/page/postjobs/postjobplumber.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';
import 'package:jobgods/screens/allusers_screen.dart';
import 'package:jobgods/screens/profile_screen.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 270, top: 15),
            child: Text(
              'Post jobs',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box1Color = box1Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Postjob()));
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
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
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
                                'image/doctor.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Doctor',
                            style: TextStyle(color: Colors.black),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '20 Jobs',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '   +',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .blueAccent, // Change color as needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box2Color = box2Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Post_job_eng()));
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
                        decoration: BoxDecoration(
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
                      SizedBox(height: 10),
                      Text(
                        'Engineer',
                        style: TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12 Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '   +',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueAccent, // Change color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box1Color = box1Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Post_job_plumber()));
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
                      SizedBox(height: 10),
                      Text(
                        'Plumber',
                        style: TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '14 Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '   +',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueAccent, // Change color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box2Color = box2Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Post_job_carpenter()));
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'image/carpentor.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Carpenter',
                        style: TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '32 Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '   +',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueAccent, // Change color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box3Color = box3Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Post_jobmechief()));
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
                            'image/chief.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Chief',
                        style: TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '24 Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '   +',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueAccent, // Change color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    box4Color = box4Color == Color.fromARGB(209, 207, 236, 238)
                        ? Color.fromARGB(209, 226, 236, 236)
                        : Color.fromARGB(255, 227, 236, 239);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Post_job_mevhanic()));
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
                        decoration: BoxDecoration(
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
                      SizedBox(height: 10),
                      Text(
                        'Mechanic',
                        style: TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '18 Jobs',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '   +',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.blueAccent, // Change color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
