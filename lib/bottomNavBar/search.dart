import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/dropdownbutton.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      // minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16).w
      ,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return Scaffold(
        appBar: CustomAppBar(title:'Search'),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20.0.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).w,
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Color(0xFFCDCDCD) ),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFFB3B3B3), size: 30,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                    ),


            ),
                ),
            SizedBox(height: 40.0.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
              child: Container(
                // height: 500.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.0.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                      child: Text('Filters', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                    ),
                    Divider(thickness: 1.5,),
                    Container(height: 3.0.h,),
                    Divider(thickness: 1.5,),
                    DropDownButton(),
                    SizedBox(height: 25.0.h,),

                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                      },

                      child: Text(
                        'Apply',
                        style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                            fontSize: 22.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    )



                  ],
                ),
              ),
            ),



          ],

        ),
      )

    );
  }
}
