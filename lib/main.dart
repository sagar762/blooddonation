import 'package:blooddonation/splash%20screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414,896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          home: child,


          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),

          // theme: ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // Try running your application with "flutter run". You'll see the
          //   // application has a blue toolbar. Then, without quitting the app, try
          //   // changing the primarySwatch below to Colors.green and then invoke
          //   // "hot reload" (press "r" in the console where you ran "flutter run",
          //   // or simply save your changes to "hot reload" in a Flutter IDE).
          //   // Notice that the counter didn't reset back to zero; the application
          //   // is not restarted.
          //   primarySwatch: Colors.blue,
          // ),

        );


      },
        child: SplashScreen(),

    );
  }
}

