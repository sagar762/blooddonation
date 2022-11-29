import 'dart:ffi';

import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:blooddonation/SignupScreen/SignupScreen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../forgetpassword/forgetpassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void showmsg() {
    debugPrint(emailController.text);
  }

  TextEditingController emailController = TextEditingController();

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());


    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Valid Email')));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('InValid Email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      // minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF8F8F8),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Logo.png', color: Color(0xFFFF2156),
                height: 140,
                width: 201,),
            ),
            SizedBox(height: 20,),
            Text('App Name', textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE22030)),),
            SizedBox(height: 70,),
            Form(
              child: TextFormField1
                (
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Error";


                  }
              },
                icon: Icon(Icons.email, color: Color(0xFFE22030), size: MediaQuery
                    .of(context)
                    .size
                    .width * 0.07,),
                title: 'Email',
                hintTxt: 'Enter your email',
                obstxt: false,
                keyboardType: TextInputType.emailAddress,),
            )

            ,


            SizedBox(height: 10.0,),
            TextFormField1(
              icon: Icon(Icons.lock, color: Color(0xFFE22030), size: MediaQuery
                  .of(context)
                  .size
                  .width * 0.07,),
              title: 'Password',
              hintTxt: 'Enter your password',
              obstxt: true,
              keyboardType: TextInputType.visiblePassword,),
            SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                      // if(_formkey.currentState!.validate()) {
                      //   return;
                      // }
                      // else
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: Text(
                  'LOG IN ',
                  style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            TextButton(onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
            },
                child: Text('Forgot Password? ', textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE22030)),)),
            SizedBox(height: 140,),
            Container(
              // margin: EdgeInsets.only(top: 90.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Don\'t have an account?', style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Color(0xFF7E7E7E)),),
                    TextButton(onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                        child: Text('Register Now', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Color(0xFFE22030)),))
                  ],
                )
            )
            ,


          ],
        ),
      ),
    );
  }
}

class TextFormField1 extends StatefulWidget {

  Icon icon;
  String title;
  String hintTxt;
  bool obstxt;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  TextFormField1(

      { required this.icon, required this.title, required this.hintTxt, required this.obstxt, required this.keyboardType, this.validator

      });

  @override
  State<TextFormField1> createState() => _TextFormField1State();
}

class _TextFormField1State extends State<TextFormField1> {
  TextEditingController emailController = TextEditingController();

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
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
            controller: emailController,
            keyboardType: widget.keyboardType,
            obscureText: widget.obstxt,
            decoration: InputDecoration(

              hintText: widget.hintTxt,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Color(0xFFE22030))
              ),
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),


              // floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(color: Color(0xFFD6D6D6), width: 2.0)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                    child: widget.icon
                ),
              ),
              // suffixIcon: Icon(Icons.lock)
            ),
          ),
        ),
      );

  }

}


