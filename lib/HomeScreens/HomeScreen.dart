import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:blooddonation/loginscreen/LoginScreen.dart';
import 'package:blooddonation/model/onboarding.dart';
import 'package:blooddonation/model/sharedprefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/ApiConfig.dart';
import '../model/post.dart';
import '../model/shared_preferences.dart';
import '../model/user.dart';
import '../model/user_api.dart';
import 'package:http/http.dart' as http;
import '../model/Usermodel.dart';
import '../myrequest.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatefulWidget {

   HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // User user ;

  bool isLoading = false;
  final loginurl = "/login";
  ProductModeL _user = ProductModeL();

  @override
  void initState() {

    // _getEmail = SharedPreferences.getInstance().then((prefs) {
    //   return prefs.getString("email");
    // });
    _controller = PageController(initialPage: 0);
    // _fetchData();
    // _fetchUser();
    super.initState();


    // getCred();
    fetchUsers();
    // this.fetchuser();
  }
  // _fetchData() async {
  //   // Make API call
  //   var response = await http.get(Uri.parse('192.168.1.159:8000/api/auth/login'));
  //   var jsonData = json.decode(response.body);
  //   print(response.body);
  //   email = jsonData['email'];
  //
  //   // Get instance of shared preferences
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   // Store data in shared preferences
  //   prefs.setString('email', email);
  // }

  // void getCred() async{

  //   setState((){
  //     token = pref.getString('login')!;
  //   });
  //
  // }
  void fetchUsers() async {
    await sharedprefs.init();
  }
// sharedprefs.init();


  // var name = sh

  // var email = SharedData.getEmail();
  // var location = SharedData.getLocation();
  // var phone_number = SharedData.getPhone();

  final _scrollController = ScrollController();




  @override

  int _current=0;
  late PageController _controller;

  final List<String> images = [
    'assets/images/bro.jpg',
    'assets/images/rafiki.jpg',
    'assets/images/rafiki.jpg',
    'assets/images/rafiki.jpg',


  ];

  List<Widget> generateImageTiles(){
    return images.map((e) => ClipRRect(
     borderRadius: BorderRadius.circular(15.0),
      child: Image.network('', fit: BoxFit.cover,),
    )).toList();
    // return images.map((element) => ClipRRect(
    //   child: Image.asset(element, fit: BoxFit.cover,),
    //   borderRadius: BorderRadius.circular(15.0),
    //
    // )).toList();
  }
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    side: BorderSide(color: Color(0xFFE22030), width: 2),
    // onPrimary: Colors.black87,
    primary: Color(0xFFE22030),
    // minimumSize: const Size.fromHeight(50),
    // minimumSize: Size(100, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );


  // List<User> users = [];


  // Future<void> fetchUsers() async {
  //   final response = await UserApi.fetchUsers();
  //
  //   setState(() {
  //
  //     users = response;
  //   });
  // }




  DateTime timeBackPressed = DateTime.now();
  @override




  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: _current == index ? 10.w :10.w,
      margin: EdgeInsets.symmetric(horizontal: 5.0).w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _current == index ? Color(0xFFE22030) : Color(0xFFE0E0E0)
      ),
    );


  }
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
      child:
      SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xFFF5F5F5),
              body: SingleChildScrollView(
                // physics: ScrollPhysics(),
                child:
                Expanded(

                  child: Column(

                    children: [
                      SizedBox(height: 20.0.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Welcome ${_user.user?.email} ', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),

                                // Text('phone_number',  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), )
                              ],
                            ),
                            Icon(Icons.notifications_active, size: 32, color: Color(0xFF272A2F),)
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0.h,),
                      Stack(
                        children: [
                          CarouselSlider(items: generateImageTiles(), options: CarouselOptions(
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 2,
                              onPageChanged: (index, reason){
                                setState(() {
                                  _current = index;
                                });
                              }
                          ))
                        ],
                      ),
                      SizedBox(height: 15.0.h,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          List.generate(images.length, (index) => buildDot(index, context)),

                        ),
                      ),
                      SizedBox(height: 25.0.h,),
                      Container(
                        height: 100.h,
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(

                            shrinkWrap: true,
                            itemCount: details.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                                child: InkWell(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => details[index].route)),
                                  child: Container(
                                    height: 100.h,
                                    width: MediaQuery.of(context).size.width*0.27,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0).h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(child: SvgPicture.asset(details[index].image,)),
                                          SizedBox(height: 5.h,),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(details[index].name, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E)),))
                                        ],
                                      ),
                                    ),

                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 20.0.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Donation Requests', style: GoogleFonts.poppins(fontSize: 17.sp, fontWeight:FontWeight.w500, color: Color(0xFF272A2F)),),
                            SizedBox(height: 10.0.h,),
                            Container(
                              // height: 500.h,
                              child:
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  // scrollDirection: Axis.vertical,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int index){
                                    // final user = users[index];
                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0).h,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8.0),

                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                                              child: Column(

                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Name', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                                                  SizedBox(height: 4.0.h,),
                                                  Text('sd',style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                                                  SizedBox(height: 8.0.h,),
                                                  Text('location', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                                                  SizedBox(height: 4.0.h,),
                                                  Text('sd'),
                                                  SizedBox(height: 12.0.h,),
                                                  Text('5 Minutes Ago', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E),),),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 55),
                                                    child: SvgPicture.asset('assets/images/Blood Group.svg'),
                                                  ),
                                                  SizedBox(height: 15.0.h,),
                                                  ElevatedButton(
                                                    style: raisedButtonStyle,
                                                    onPressed: () async {
                                                      // launchUrl('tel://9808783916');
                                                      launch('tel: sd');
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Icon(Icons.call, size: 20,),
                                                        SizedBox(width: 10.0.w,),
                                                        Text(
                                                          'Call ',
                                                          style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                                                              fontSize: 16.0.sp,
                                                              fontWeight: FontWeight.w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            )
                                          ],
                                        ),

                                      ),
                                    );
                                  }),
                            ),



                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              )

          ),
        )
      );
  }


}










