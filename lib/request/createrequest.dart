
import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/request/requestsuccessfully.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontaionRequest extends StatelessWidget {
  const DontaionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      // minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16).w,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return Scaffold(

      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(title:'Create a Request',),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 22.0).h,
          child: Column(
            children: [
              TextFormField1( title: 'John Doe', hintTxt: 'Name',  keyboardtype: TextInputType.text),
              SizedBox(height: 20.0.h,),
              TextFormField1(icon:Icon(Icons.location_on, color: Color(0xFFE22030),), title: 'City', hintTxt: 'City', keyboardtype: TextInputType.text),
              SizedBox(height: 20.0.h,),
              TextFormField1(icon:Icon(Icons.local_hospital_sharp, color:Color(0xFFE22030), ), title: 'Hospital', hintTxt: 'Hospital', keyboardtype: TextInputType.text),
              SizedBox(height: 20.0.h,),
              TextFormField1(icon: Icon(Icons.water_drop, color: Color(0xFFE22030),), title: 'Blood Group', hintTxt: 'Blood Group', keyboardtype: TextInputType.text),
              SizedBox(height: 20.0.h,),
              TextFormField1(icon: Icon(Icons.phone, color: Color(0xFFE22030),), title: 'Mobile', hintTxt: 'Mobile', keyboardtype: TextInputType.phone),
              SizedBox(height: 20.0.h,),
              TextFormField1(icon:Icon(Icons.note, color: Color(0xFFE22030),), title: 'Notes', hintTxt: 'Notes', keyboardtype: TextInputType.text, maxline:4),
              SizedBox(height: 40.0.h,),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return Container(
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: AlertDialog(
                       title: SvgPicture.asset('assets/images/pana.svg'),

                        actions: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Blood is successfully requested.', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),),
                                ElevatedButton(
                                    style: raisedButtonStyle,
                                    onPressed: () {
                                      // if(_formkey.currentState!.validate()) {
                                      //   return;
                                      // }
                                      // else
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DontaionRequest()));
                                    },
                                    child: Icon(Icons.arrow_forward, color: Colors.white,)
                                ),
                              ],
                            ),
                          ),
                        ],
                      )


                    );
                  });

                },

                child: Text(
                  'Request',
                  style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                      fontSize: 22.0.sp,
                      fontWeight: FontWeight.w500),
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
class TextFormField1 extends StatelessWidget {
  Icon? icon;
  String title;
  String hintTxt;
  bool? obstxt;
  int? maxline;
  final TextInputType keyboardtype;
  TextFormField1({ this.icon, required this.title, required this.hintTxt, this.obstxt, required this.keyboardtype, this.maxline

  });

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
      child: Container(
        // height: 65,
        child: TextFormField(
          maxLines: maxline,
          keyboardType: keyboardtype,

          decoration: InputDecoration(
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(width: 1.0, color: Color(0xFFE22030))
            // ),
            filled: true,
            fillColor: Colors.white,
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
              margin: EdgeInsets.symmetric(horizontal: 8).w,
              // decoration: BoxDecoration(
              //   border: Border(right: BorderSide(color: Color(0xFFD6D6D6))),
              // ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
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

