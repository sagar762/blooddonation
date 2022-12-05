import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0,right: 15.0),
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
          SizedBox(
            height: 20.0,
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
                padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
                child: Container(
                  height: 125,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRect(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Container(

                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Image.asset(donors[index].image1, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: Color(0xFFE22030),),
                                  Text('New Baneshwor', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xFF7E7E7E)),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset('assets/images/Blood Group.svg'),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Container(
          //     height: 125,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(12.0)
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         ClipRect(
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 14.0),
          //             child: Container(
          //
          //               height: 100,
          //               width: 100,
          //               decoration: BoxDecoration(
          //                 // color: Colors.red,
          //                 borderRadius: BorderRadius.circular(10.0)
          //               ),
          //               child: Image.asset('assets/images/Rectangle 24.png', fit: BoxFit.cover,),
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only( right: 20.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text('John Doe', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),),
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0),
          //                 child: Row(
          //                   children: [
          //                     Icon(Icons.location_on, color: Color(0xFFE22030),),
          //                     Text('New Baneshwor', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xFF7E7E7E)),)
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //
          //         Padding(
          //           padding: const EdgeInsets.only(right: 8.0),
          //           child: Image.asset('assets/images/Blood Group.png'),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
          // Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index){
          //   return
          // }))
        ],
      ),
    );
  }
}
