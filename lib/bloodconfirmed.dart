import 'package:blooddonation/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/onboarding.dart';

class BloodConfirmPage extends StatefulWidget {
   BloodConfirmPage({Key? key}) : super(key: key);

  @override
  State<BloodConfirmPage> createState() => _BloodConfirmPageState();
}
List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Completed"),value: "Completed"),
    DropdownMenuItem(child: Text("Pending"),value: "Pending"),
    // DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    // DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}

class _BloodConfirmPageState extends State<BloodConfirmPage> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    side: BorderSide(color: Color(0xFFE22030), width: 2),
    // onPrimary: Colors.black87,
    primary: Color(0xFFE22030),
    // minimumSize: const Size.fromHeight(50),
    // minimumSize: Size(100, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  String selectedValue = "Pending";
  final FocusNode dropDownFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(title: 'Confirm Blood Request',),
      body:
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
        child: Container(
          height: 300,
          padding: EdgeInsets.symmetric(vertical: 8.0),

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reciever', style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w500, ), ),
                    SizedBox(height: 10.0.h,),
                    Text('Name', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                    SizedBox(height: 4.0.h,),
                    Text("user.name",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                    SizedBox(height: 8.0.h,),
                    Text('City', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                    SizedBox(height: 4.0.h,),
                    Text("Kathmandu",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                    SizedBox(height: 8.0.h,),
                    Text('Blood Group', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                    SizedBox(height: 4.0.h,),

                    Text("A+",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                    Text('location', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                    SizedBox(height: 4.0.h,),
                    Text('Patan Hospital',style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                    SizedBox(height: 12.0.h,),
                    Text('5 Minutes Ago', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E),),),
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.only(right: 40.0.w),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                  child: Column(


                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Donor', style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w500, ), ),
                      SizedBox(height: 10.0.h,),
                      Text('Name', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                      SizedBox(height: 4.0.h,),
                      Text("user.name",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                      SizedBox(height: 8.0.h,),
                      Text('City', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                      SizedBox(height: 4.0.h,),
                      Text("Kathmandu",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                      SizedBox(height: 8.0.h,),
                      Text('Blood Group', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                      SizedBox(height: 4.0.h,),

                      Text("A+",style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                      SizedBox(height: 16.0.h,),
                      Text('Status', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),

                      DropdownButton(
                          // underline: Container(
                          //   width: 200,
                          //   height: 1,
                          //   color: Colors.white,
                          // ),
                        style: GoogleFonts.poppins(fontSize: 18.0.sp, fontWeight: FontWeight.w500, color: Color(0xFFE22030)),
                          focusNode: dropDownFocus,
                          value: selectedValue,
                          onChanged: (String? newValue){
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items:
                          dropdownItems
                      ),
                      // ElevatedButton(
                      //   style: raisedButtonStyle,
                      //   onPressed: () {
                      //     showDialog(context: context, builder: (context){
                      //       return Container(
                      //         child: AlertDialog(
                      //           title: Text('Are you sure you wnat to Donate?'),
                      //           actions: [
                      //             TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Yes')),
                      //             TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No'))
                      //           ],
                      //         ),
                      //       );
                      //     });
                      //   },
                      //   child: Text(
                      //     selectedValue,
                      //     style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                      //         fontSize: 16.0.sp,
                      //         fontWeight: FontWeight.w500),
                      //   ),
                      // )
                      // Text('location', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                      // SizedBox(height: 4.0.h,),
                      // Text('Patan Hospital',style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                      // SizedBox(height: 12.0.h,),

                    ],
                  ),

                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //
              //     children: [
              //       Text('Donors: ', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400,color: Color(0xFF7E7E7E)),),
              //       Text('Donors Name', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F),), )
              //
              //       // Padding(
              //       //   padding: const EdgeInsets.only(left: 55, top: 30),
              //       //   child: SvgPicture.asset('assets/images/Blood Group.svg'),
              //       // ),
              //       // SizedBox(height: 75.0.h,),
              //
              //
              //     ],
              //   ),
              // )

            ],
          ),

        ),
      ),
    );
  }
}
