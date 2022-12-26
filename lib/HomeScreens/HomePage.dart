import 'package:blooddonation/bottomNavBar/bottomnavbar.dart';
import 'package:blooddonation/bottomNavBar/donationrequest.dart';
import 'package:blooddonation/bottomNavBar/person.dart';
import 'package:blooddonation/bottomNavBar/search.dart';
import 'package:blooddonation/donorlist.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../request/createrequest.dart';
import 'HomeScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab= 0;

  final List<Widget> screens = [
    HomeScreen(),
    DontaionRequest(),
    ProfileScreen(),
    SearchScreen(),

  ];
  DateTime timeBackPressed = DateTime.now();
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        timeBackPressed = DateTime.now();
        final isExitWarning = difference >= Duration(seconds: 2);

        if (isExitWarning){
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
        //  final value = await  showDialog<bool>(context: context, builder: (context){
        //   return AlertDialog(
        //     title: const Text('Alert'),
        //     content: Text('Are you sure you want to log out?'),
        //     actions: [
        //       ElevatedButton(onPressed: ()=> Navigator.of(context).pop(false), child: Text('No')),
        //       ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())), child: Text('Yes'))
        //     ],
        //   );
        // });
        //  if(value!=null){
        //    return Future.value(value);
        //  }else{
        //    return Future.value(false);
        //  }
      },
      child: Scaffold(
        body: PageStorage(bucket: bucket, child: currentScreen,),

        bottomNavigationBar: Container(

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
                          currentScreen = DonationRequest();
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
        ),
        floatingActionButton: FloatingActionButton(

            backgroundColor: Color(0xFFFF2156),
            child: Image.asset('assets/images/Group 31.png'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> DontaionRequest()));

            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}