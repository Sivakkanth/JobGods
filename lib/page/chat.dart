import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobgods/controller/author/logout_controller.dart';
import 'package:jobgods/controller/profile_controller.dart';
import 'package:jobgods/models/user_model.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';
import 'package:jobgods/screens/allusers_screen.dart';
import 'package:jobgods/screens/profile_screen.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
final logoutcontroller = Get.put(LogoutController());

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
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
        itemBuilder: (context, index) {
          return buildCard(index, height: 80);
        },
      ),
    );
  }

  Widget buildCard(int index, {required double height}) {
    // Replace this with the actual content of your card
    return Card(
    child: ListTile(
      title: Text('Chat box $index'),
      subtitle: Text('Apply and post jobs $index'), // Add this line
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

void main() {
  runApp(MaterialApp(
    home: Chat(),
  ));
}
