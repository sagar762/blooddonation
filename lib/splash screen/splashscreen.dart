

import 'package:blooddonation/splash%20screen/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'introsliderpage.dart';
import '../bloc/app_events.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingFinalScreen()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF2156),
      body: Container(
        // color: Color(0xFFFF2156),
        child: Stack(
          children:[
           Center(
             child:  Image.asset('assets/images/Logo.png'),
           ),
            Positioned.fill(child: Image.asset('assets/images/Group 8.png', fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ))

            







          ]


        )

        ,





      ),
    );
  }
}
