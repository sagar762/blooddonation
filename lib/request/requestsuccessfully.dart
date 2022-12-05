import 'package:blooddonation/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestSuccessful extends StatelessWidget {
  const RequestSuccessful({Key? key}) : super(key: key);

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
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBar(title: 'Create a Request',),
      body: Center(
        child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                child: Stack(
                  children: [
                    Container(
                      height: 300,


                      child: Center(child: Image.asset('assets/images/pana.png', fit: BoxFit.cover,)),
                    ),

                    Positioned(
                      top: 300,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(
                        //   color: Colors.red
                        // ),
                        child: Text('Blood is successfully requested.', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 160,
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          // if(_formkey.currentState!.validate()) {
                          //   return;
                          // }
                          // else
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        },
                        child: Icon(Icons.arrow_forward, color: Colors.white,)
                      ),
                    ),
                  ],
                ),
              ),
            ),

      ),
    );
  }
}
