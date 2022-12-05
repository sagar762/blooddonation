import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../loginscreen/LoginScreen.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    String? register;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 22),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF8F8F8),
      body: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/Logo.png', color: Color(0xFFFF2156),height: 100, width: 201,) ,
            ),
            SizedBox(height: 10,),
            Text('App Name', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFFE22030)),),
            SizedBox(height: 40,),
            TextFormField1(icon: Icon(Icons.person, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Email', hintTxt: 'Enter your username', obstxt: false, keyboardtype: TextInputType.name,),
            SizedBox(height: 10.0,),
            TextFormField1(icon: Icon(Icons.email, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Password',hintTxt: 'Enter your email', obstxt: true, keyboardtype: TextInputType.emailAddress,),
            SizedBox(height: 10.0,),
            TextFormField1(icon: Icon(Icons.lock, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Password',hintTxt: 'Enter your password', obstxt: true, keyboardtype: TextInputType.visiblePassword),
            SizedBox(height: 10.0,),
            TextFormField1(icon: Icon(Icons.call, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Password',hintTxt: 'Enter your phone number', obstxt: true, keyboardtype: TextInputType.number,),
            SizedBox(height: 10.0,),
            TextFormField1(icon: Icon(Icons.location_on, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Password',hintTxt: 'Enter your location', obstxt: true, keyboardtype: TextInputType.name,),
            SizedBox(height: 10.0,),


            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 170.0),
                  child: Text('Register as', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:60.0),
                        child: Row(

                          children: [
                            Radio(
                                fillColor:
                                MaterialStateColor.resolveWith((states) => Color(0xFFE22030)),
                                value: 1, groupValue: _value, onChanged: (index) {
                                  setState(() {
                                    _value = 1;
                                  });
                            }),
                            Expanded(
                              child: Text('Donor'),
                            )
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              fillColor:
                              MaterialStateColor.resolveWith((states) => Color(0xFFE22030)),

                              value: 2, groupValue: _value, onChanged: (index) {
                                setState(() {
                                  _value = 2;
                                });
                          }),
                          Expanded(child: Text('User'))
                        ],
                      ),
                      flex: 1,
                    ),

                  ],
                ),

              ],
            ),

            TextFormField1(icon: Icon(Icons.water_drop, color: Color(0xFFE22030),size: MediaQuery.of(context).size.width * 0.07,), title: 'Password',hintTxt: 'Enter your blood group', obstxt: true, keyboardtype: TextInputType.text,),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22.0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text(
                  'REGISTER ',
                  style: GoogleFonts.poppins(color: Color(0xFFFFFFFF), fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 5.0,),
             Container(
                  // margin: EdgeInsets.only(top: 90.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Already have an account?', style: GoogleFonts.poppins(fontWeight:FontWeight.w500, fontSize: 18.0, color: Color(0xFF7E7E7E)),),
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));}, child: Text('Login', style: GoogleFonts.poppins(fontWeight:FontWeight.w500, fontSize: 18.0, color: Color(0xFFE22030)),))
                    ],
                  )
              ),





          ],
        ),
      ),
    );
  }
}

class TextFormField1 extends StatelessWidget {
  Icon icon;
  String title;
  String hintTxt;
  bool obstxt;
  final TextInputType keyboardtype;
  TextFormField1({ required this.icon, required this.title, required this.hintTxt, required this.obstxt, required this.keyboardtype

  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        // height: 65,
        child: TextFormField(
          keyboardType: keyboardtype,
          obscureText: obstxt,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Color(0xFFE22030))
            ),
            filled: true,
            fillColor: Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            ),
            // label: Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            //   child: Text(title, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18, color: Color(0xFFE22030)),),
            // ),
            hintText: hintTxt,

            // floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFFD6D6D6), width: 2.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                  child:icon
              ),
            ),
            // suffixIcon: Icon(Icons.lock)
          ),
        ),
      ),
    );
  }
}
