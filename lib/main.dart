import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:blooddonation/bottomNavBar/donationrequest.dart';
import 'package:blooddonation/loginscreen/LoginScreen.dart';
import 'package:blooddonation/repositories.dart';
import 'package:blooddonation/restapi/homescreen.dart';
import 'package:blooddonation/splash%20screen/introsliderpage.dart';
import 'package:blooddonation/splash%20screen/onboardingscreen.dart';
import 'package:blooddonation/splash%20screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnboard;

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
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: RepositoryProvider(
              create: (context) => UserRepository(), child: seenOnboard == true ? OnboardingFinalScreen() : SplashScreen()),

          debugShowCheckedModeBanner: false,

        );
      },
    );
  }
}
