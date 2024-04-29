import 'package:flutter/material.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
  //_HomeState createState() => _HomeState();
}

class _DashScreenState extends State<DashScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    //HomeScreen(),
    // Search(),
    // Chat(),
    // Setting(),
  ];

  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
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
                  "image/Logoonly.jpg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.mail),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ProfileScreen(),
                //     ));
              },
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('All Users'),
              leading: Icon(Icons.inbox),
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => AllusersScreen(),
              //       ));
              // },
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "image/Logoonly.jpg",
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
                  "image/Logoonly.jpg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
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
      /*body: PageStorage(
      child: currentScreen,
      bucket: bucket,
    ),*/

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
                  ],
      ),
      floatingActionButton: FloatingActionButton(
        //color: Color.fromARGB(255, 183, 231, 237),
        backgroundColor: Color.fromARGB(255, 122, 185, 236),
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            //currentScreen = Post();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 183, 231, 237),
          shape: const CircularNotchedRectangle(),
          notchMargin: 15,
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      //currentScreen = HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color:
                                currentTab == 0 ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      //currentScreen = Search();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: currentTab == 2 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                            color:
                                currentTab == 2 ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      //currentScreen = Chat();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color: currentTab == 1 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                            color:
                                currentTab == 1 ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      //currentScreen = Setting();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: currentTab == 3 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(
                            color:
                                currentTab == 3 ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
