

import 'package:blooddonation/splash%20screen/introsliderpage.dart';
import 'package:blooddonation/splash%20screen/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';



bool? seenOnboard;
DateTime timeBackPressed = DateTime.now();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setEnabledSystemUIOverlays(
   [SystemUiOverlay.bottom, SystemUiOverlay.top]
 );
 SharedPreferences pref = await SharedPreferences.getInstance();
 seenOnboard = pref.getBool('seenOnboard') ?? false;
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
      ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: seenOnboard == true ? OnboardingFinalScreen() : IntroSliderPage(),

          debugShowCheckedModeBanner: false,

        );
      },
    );
  }
}

