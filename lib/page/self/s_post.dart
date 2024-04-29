import 'package:flutter/material.dart';

class S_post extends StatefulWidget {
  const S_post({super.key});

  @override
  State<S_post> createState() => _S_postState();
}

class _S_postState extends State<S_post> {
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
          decoration: const BoxDecoration(
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
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 212, 237, 253),
      borderRadius: BorderRadius.circular(18.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Posted jobs $index',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20), // Add space between text and buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle editing button press
                print('Editing job $index');
              },
              child: Text('Edit'),
            ),
            SizedBox(width: 20), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                // Handle deleting button press
                print('Deleting job $index');
              },
              child: Text('Delete'),
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
