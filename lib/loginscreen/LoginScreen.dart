import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:blooddonation/SignupScreen/SignupScreen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../forgetpassword/forgetpassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();
  void showmsg() {
    debugPrint(emailController.text);
  }

  TextEditingController emailController = TextEditingController();

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());

    if (isValid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Valid Email')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('InValid Email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16).w,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF8F8F8),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0).h,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Logo.png',
                  color: Color(0xFFFF2156),
                  height: 140.h,
                  width: 201.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'App Name',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE22030)),
              ),
              SizedBox(
                height: 70.h,
              ),
              Form(
                child: TextFormField1(
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  icon: Icon(
                    Icons.email,
                    color: Color(0xFFE22030),
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                  title: 'Email',
                  hintTxt: 'Enter your email',
                  obstxt: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              TextFormField1(
                controller: emailController,
                icon: Icon(
                  Icons.lock,
                  color: Color(0xFFE22030),
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
                title: 'Password',
                hintTxt: 'Enter your password',
                obstxt: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 40.0.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0).w,
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));

                    // if(_formkey!.currentState!.validate()) {

                    // }
                  },
                  child: Text(
                    'LOG IN ',
                    style: GoogleFonts.poppins(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 5.0.h),
              TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                  },
                  child: Text(
                    'Forgot Password? ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFE22030)),
                  )),
              SizedBox(
                height: 140.h,
              ),
              Container(
                  // margin: EdgeInsets.only(top: 90.0),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0.sp,
                        color: Color(0xFF7E7E7E)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      },
                      child: Text(
                        'Register Now',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0.sp,
                            color: Color(0xFFE22030)),
                      ))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormField1 extends StatefulWidget {
  TextEditingController controller;
  Icon? suffixicon;
  Icon icon;
  String title;
  String hintTxt;
  bool obstxt;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  TextFormField1(
      {required this.controller,
      required this.icon,
      required this.title,
      required this.hintTxt,
      required this.obstxt,
      required this.keyboardType,
      this.validator});

  @override
  State<TextFormField1> createState() => _TextFormField1State();
}

class _TextFormField1State extends State<TextFormField1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//   void validateEmail(){
//     final bool isValid = EmailValidator.validate(emailController.text.trim());
//
//     if(isValid){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Valid Email')));
//     }
// else{
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('InValid Email')));
//     }
//   }
  // final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
      child: Container(
        // height: 65,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          // validator:(data) {
          //   if (data?.isEmpty ?? true) {
          //     return 'Email is required';
          //   }
          //   if (!RegExp(
          //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          //       .hasMatch(data.toString())) {
          //     return 'Email must be validate';
          //   }
          //   return null;
          // },

          keyboardType: widget.keyboardType,
          obscureText: widget.obstxt,
          decoration: InputDecoration(
            hintText: widget.hintTxt,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0.w, color: Color(0xFFE22030))),
            filled: true,
            fillColor: Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            ),

            // floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Container(
              margin: EdgeInsets.symmetric(horizontal: 8).w,
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: Color(0xFFD6D6D6), width: 2.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
                  child: widget.icon),
            ),

            // suffixIcon: Icon(Icons.lock)
          ),
        ),
      ),
    );
  }
}
