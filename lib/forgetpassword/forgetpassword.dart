import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                // height: 65,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
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
                    hintText: 'Enter your email',

                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Color(0xFFD6D6D6), width: 2.0)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                          child:Icon(Icons.email)
                      ),
                    ),
                    // suffixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
            )

          ],
        ),
    
    );
  }
}
