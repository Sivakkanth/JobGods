import 'package:flutter/material.dart';
import 'package:jobgods/page/profile.dart';
import 'package:jobgods/page/self/s_apply.dart';
import 'package:jobgods/page/self/s_post.dart';

class C_mechanic extends StatefulWidget {
  const C_mechanic({super.key});

  @override
  State<C_mechanic> createState() => _C_mechanicState();
}

class _C_mechanicState extends State<C_mechanic> {
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
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 12,
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
    return GestureDetector(
      onTap: () {
        // Handle the tap event, for example, navigate to a new page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourNextPage()));
        _applyConfirmationDialog(context);
      },
      child: Card(
        child: ListTile(
          title: Text('Mechanic'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Senior mechanic'),
              Text('Kandy, Sri Lanka'),
              Text('19/01/2023'),
              Text('Salary: 115,000/=  Phone no: 077 5454787'),
              Text('Company name: rejo'),
              Text('Qualification: Need to have 3 years experience'),
              // Add more Text widgets for additional lines
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _applyConfirmationDialog(BuildContext context) async {
    bool? exitApp = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Conform to Apply"),
          content: const Text("Are you want to apply this job?"),
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
