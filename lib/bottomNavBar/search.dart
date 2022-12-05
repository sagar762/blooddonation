import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/dropdownbutton.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      padding: EdgeInsets.symmetric(horizontal: 16),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return Scaffold(
        appBar: CustomAppBar(title:'Search'),

      body: Column(
        children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFFCDCDCD) ),
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
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Filters', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                  ),
                  Divider(thickness: 1.5,),
                  Container(height: 3.0,),
                  Divider(thickness: 1.5,),
                  DropDownButton(),
                  SizedBox(height: 50.0,),

                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                    },

                    child: Text(
                      'Apply',
                      style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )



                ],
              ),
            ),
          ),



        ],

      )

    );
  }
}
