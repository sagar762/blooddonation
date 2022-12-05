
import 'package:blooddonation/bottomNavBar/person.dart';
import 'package:blooddonation/bottomNavBar/search.dart';
import 'package:flutter/material.dart';

import '../HomeScreens/HomeScreen.dart';
import '../request/createrequest.dart';
import 'donationrequest.dart';

class BottomNavBar extends StatefulWidget {
  Icon? icon;

   BottomNavBar({ this.icon, }) ;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab= 0;

  final List<Widget> screens = [
    HomeScreen(),
    DontaionRequest(),
    ProfileScreen(),
    SearchScreen(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Container(

      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // notchMargin: 10,
        child: Container(

          // padding: EdgeInsets.only(left: 8.0, right: 8.0),
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = HomeScreen();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 30, color: currentTab==0? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 0 ? 5 :5,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentTab == 0 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = SearchScreen();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 30, color: currentTab==1? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 1 ? 5 :5,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentTab == 1 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = DontaionRequest();
                      currentTab = 2;
                    });
                  },
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.card_travel, size: 30, color: currentTab==2? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 2 ? 5 :5,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentTab == 2 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = ProfileScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 30, color: currentTab==3? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 3 ? 5 :5,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: currentTab == 3 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
