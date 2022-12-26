import 'dart:convert';

import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:blooddonation/SignupScreen/SignupScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../forgetpassword/forgetpassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../model/ApiServices.dart';
import '../model/user.dart';
import '../model/Usermodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // var _formkey = GlobalKey<FormState>();
  // void showmsg() {
  //   debugPrint(emailController.text);
  // }




  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void validateEmail() {
  //   final bool isValid = EmailValidator.validate(emailController.text.trim());
  //
  //   if (isValid) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Valid Email')));
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('InValid Email')));
  //   }
  // }
  bool isHiddenPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLogin();
  }

  // void checkLogin () async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? val =  pref.getString('login');
  //   if( val!=null){
  //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomeScreen()), (route)=>false);
  //   }
  // }
  @override
  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets
          .symmetric(horizontal: 16)
          .w,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(

      backgroundColor: Color(0xFFF8F8F8),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0).h,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                      child: Container(
                        // height: 65,
                        child: TextFormField(

                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,


                          validator: (data) {
                            if (data?.isEmpty ?? true) {
                              return 'Email is required';
                            }
                            if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(data.toString())) {
                              return 'Email must be validate';
                            }
                            return null;
                          },

                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0.w, color: Color(0xFFE22030))),
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6),
                            ),

                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Container(
                              margin: EdgeInsets
                                  .symmetric(horizontal: 8)
                                  .w,
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color(0xFFD6D6D6), width: 2.0)),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0).w,
                                  child: Icon(
                                      Icons.email, color: Color(0xFFE22030),
                                      size: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.07)),
                            ),

                            // suffixIcon: Icon(Icons.lock)
                          ),
                        ),
                      ),
                    ),
                    // TextFormField1(
                    //   validator: customValidator,
                    //   controller: emailController,
                    //   // validator: (value) {
                    //   //   if (value != null && value.isEmpty) {
                    //   //     return 'Please enter email';
                    //   //   }
                    //   //   return null;
                    //   // },
                    //   icon: Icon(
                    //     Icons.email,
                    //     color: Color(0xFFE22030),
                    //     size: MediaQuery.of(context).size.width * 0.07,
                    //   ),
                    //   title: 'Email',
                    //   hintTxt: 'Enter your email',
                    //   obstxt: false,
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                      child: Container(
                        // height: 65,
                        child: TextFormField(

                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          validator: (data) {
                            if (data?.isEmpty ?? true) {
                              return 'Password is required';
                            }
                            /*if (data!.length < 6 || data!.length > 10) {
                        return 'password length must be greater';
                      }*/
                            return null;
                          },

                          keyboardType: TextInputType.emailAddress,
                          obscureText: isHiddenPassword,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0.w, color: Color(0xFFE22030))),
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6),
                            ),

                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Container(
                              margin: EdgeInsets
                                  .symmetric(horizontal: 8)
                                  .w,
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color(0xFFD6D6D6), width: 2.0)),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0).w,
                                  child: Icon(
                                      Icons.lock, color: Color(0xFFE22030),
                                      size: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.07)),
                            ),
                            suffixIcon: InkWell(
                              onTap: _tooglePasswordView,
                              child: Icon(isHiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),

                            // suffixIcon: Icon(Icons.lock)
                          ),
                        ),
                      ),
                    ),


                    // TextFormField1(
                    //   controller: emailController,
                    //   icon: Icon(
                    //     Icons.lock,
                    //     color: Color(0xFFE22030),
                    //     size: MediaQuery.of(context).size.width * 0.07,
                    //   ),
                    //   title: 'Password',
                    //   hintTxt: 'Enter your password',
                    //   obstxt: true,
                    //   keyboardType: TextInputType.visiblePassword,
                    // ),
                  ],
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0).w,
                  child: ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: ()  async{
                      // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      // sharedPreferences.setString('email', emailController.text);
                      // if (formkey.currentState.validate()) {
                      //   String email = emailController.text;
                      //   String password = passwordController.text;
                      //   var url = 'https://reqres.in/api/login';
                      //   var body = {'email': email, 'password': password};
                      //
                      //   var response = await http.post(Uri.parse(url), body: body);
                      //   if (response.statusCode == 200) {
                      //     var data = response.body;
                      //     // parse the response and create a user model
                      //     var user = User.fromJson(data);
                      //     // save the user model
                      //     saveUser(user);
                      //     // get the token from the response and save it in shared preferences
                      //     var token = data['token'];
                      //     saveToken(token);
                      //   } else {
                      //     print('Error logging in');
                      //   }
                      // }
                      // login();
                      // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      // sharedPreferences.setString('email', emailController.text);

                      // if(formkey.currentState!.validate()){
                      //   final snackBar = SnackBar(content: Text('Login Successful'));
                      // Navigator.of(context).push(MaterialPageRoute(builder: (
                      //     _) => HomePage()));
                      // }
                      ApiServices().login(context,
                          email: emailController.text,
                          password: passwordController.text,
                      );
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
                                  MaterialPageRoute(
                                      builder: (_) => SignupScreen()));
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
      ),
    );
  }

  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

// void login() async {
//
//   if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
//       var response = await http.post(Uri.parse('https://reqres.in/api/login'), body: ({
//         'email': emailController.text,
//         'password' : passwordController.text,
//
//       }
//
//
//       ));
//       print(response.body);
//       if(response.statusCode == 200){
//         final body = jsonDecode(response.body);
//
//
//         // print('Login Token' + body['token']);
//         ScaffoldMessenger.of(context).showSnackBar(
//            SnackBar(
//             backgroundColor: Colors.red,
//             content: Text('token : ${body['token']}'),
//           ),
//         );
//         pageRoute(body['token']);
//       }else{
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.red,
//             content: Text("The email or password you entered is incorrect"),
//           ),
//         );
//
//       }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text("Please fill the field"),
//       ),
//     );
//   }
// }

//   void pageRoute(String token) async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString('login',token);
//     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage()), (route)=>false);
//   }
// }


}
