

import 'package:blooddonation/bottomNavBar/person.dart';
import 'package:blooddonation/bottomNavBar/search.dart';
import 'package:flutter/material.dart';

import '../HomeScreens/HomeScreen.dart';
import '../request/createrequest.dart';
import 'donationrequest.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    DonationRequest(),
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
            height: 60.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 40.w,
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
                      Icon(Icons.home, size: 30.sp, color: currentTab==0? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 0 ? 5 :5,
                        margin: EdgeInsets.only(right: 5.0.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: currentTab == 0 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40.w,
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
                      Icon(Icons.search, size: 30.sp, color: currentTab==1? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5.h,
                        width: currentTab == 1 ? 5.w :5.w,
                        margin: EdgeInsets.only(right: 5.0.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: currentTab == 1 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40.w,
                  onPressed: (){
                    setState(() {
                      currentScreen = DonationRequest();
                      currentTab = 2;
                    });
                  },
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.card_travel, size: 30.sp, color: currentTab==2? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 2 ? 5.w :5.w,
                        margin: EdgeInsets.only(right: 5.0.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: currentTab == 2 ? Color(0xFFE22030) : Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40.w,
                  onPressed: (){
                    setState(() {
                      currentScreen = ProfileScreen();
                      currentTab = 3;
                    });
                  },
                  child: Column(


                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 30.sp, color: currentTab==3? Color(0xFFE22030) : Color(0xFFB3B3B3),),
                      Container(
                        height: 5,
                        width: currentTab == 3 ? 5.w :5.w,
                        margin: EdgeInsets.only(right: 5.0.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
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
