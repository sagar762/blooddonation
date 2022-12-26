import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customappbar.dart';


class DonorList extends StatelessWidget {
  const DonorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(title: 'Find Donors',),
      body: Column(
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
          SizedBox(
            height: 20.0.h,
          ),
          // ListView.builder(
          //
          //     itemBuilder: (BuildContext context, int index){
          //       return ItemWidget(donors: DonorDetails.donors[index],);
          //
          // }),
          Expanded(

            child: ListView.builder(
                itemCount: donors.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 10.0).w.h,
                child: Container(
                  height: 125.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRect(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0).w,
                          child: Container(

                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Image.asset(donors[index].image1, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0).h,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: Color(0xFFE22030),),
                                  Text('New Baneshwor', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500,color: Color(0xFF7E7E7E)),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                        child: SvgPicture.asset('assets/images/Blood Group.svg'),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),

        ],
      ),
    );
  }
}
