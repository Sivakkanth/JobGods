import 'package:flutter/material.dart';
import 'package:jobgods/page/chat.dart';
import 'package:jobgods/page/dashboard.dart';
import 'package:jobgods/page/post.dart';
import 'package:jobgods/page/search.dart';
import 'package:jobgods/page/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  int currentTab =0;
  final List<Widget> screens = [

    Dashboard(),
    Search(),
    Chat(),
    Setting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
   // return const Placeholder();
   return Scaffold(
     body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
   floatingActionButton: FloatingActionButton(
    //color: Color.fromARGB(255, 183, 231, 237),
     backgroundColor: Color.fromRGBO(110, 159, 211, 1),
    child: const Icon(
      Icons.add,
      ),
      splashColor: Colors.blue,
    onPressed: () {
      setState(() {
                  currentScreen = Post();
                  currentTab =4;
                });
    },
    shape: CircleBorder(),
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Color(0xff00B6CE),
      shape: const CircularNotchedRectangle(),
      notchMargin: 10, 
      child: Container(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen = Dashboard();
                  currentTab =0;
                });
              },
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: currentTab == 0 ? Colors.white : Colors.black,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: currentTab ==0 ? Colors.white : Colors.black),
                  )
                ],
              ),
              ),

              MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen = Search();
                  currentTab =2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: currentTab ==2? Colors.white : Colors.black,
                  ),
                  Text(
                    'Search',
                    style:  TextStyle(
                      color: currentTab ==2 ? Colors.white : Colors.black),
                  )
                ],
              ),
              ),

               MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen = Chat();
                  currentTab =1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    color: currentTab ==1? Colors.white : Colors.black,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: currentTab ==1 ? Colors.white : Colors.black),
                  )
                ],
              ),
              ),

               MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen = Setting();
                  currentTab =3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings,
                    color: currentTab ==3? Colors.white : Colors.black,
                  ),
                  Text(
                    'Setting',
                    style: TextStyle(
                      color: currentTab ==3 ? Colors.white : Colors.black),
                  )
                ],
              ),
              )

          ],
        ),
      )
    ),
   );

  }
}