import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:blooddonation/SignupScreen/SignupScreen.dart';
import 'package:blooddonation/loginscreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';


String? finalEmail;
class OnboardingFinalScreen extends StatefulWidget {
   OnboardingFinalScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingFinalScreen> createState() => _OnboardingFinalScreenState();
}

class _OnboardingFinalScreenState extends State<OnboardingFinalScreen> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    side: BorderSide(color: Color(0xFFE22030), width: 2),
    // onPrimary: Colors.black87,
    primary: Color(0xFFFFFFFF),
    minimumSize: const Size.fromHeight(50),
    // minimumSize: Size(100, 36),
    padding: EdgeInsets.symmetric(horizontal: 20),

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(22)),
    ),
  );
  final ButtonStyle raisedButtonStyle1 = ElevatedButton.styleFrom(
    side: BorderSide(color: Color(0xFFE22030), width: 2),
    // onPrimary: Colors.black87,
    primary: Color(0xFFE22030),
    minimumSize: const Size.fromHeight(50),
    // minimumSize: Size(100, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(22)),
    ),
  );

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => finalEmail == null ? LoginScreen() : HomePage()));

    });
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(

          children: [
            Center(

              child: Image.asset('assets/images/Logo.png', color: Color(0xFFFF2156))
            ),
            SizedBox(height: 20.0,),
            Text('App Name', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500, color: Color(0xFFE22030)), ),
            SizedBox(height: 40.0,),
            Text('You can donate for ones in need and request blood if you need.', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E)),),
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text(
                  'LOG IN ',
                  style: GoogleFonts.poppins(color: Color(0xFFE22030), fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 30.0,),

            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: ElevatedButton(
                style: raisedButtonStyle1,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                },
                child: Text(
                  'REGISTER ',
                  style: GoogleFonts.poppins(color: Color(0xFFFFFFFF), fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
