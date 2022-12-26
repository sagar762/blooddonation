import 'package:blooddonation/bloodconfirmed.dart';
import 'package:blooddonation/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyRequest extends StatelessWidget {
   MyRequest({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'My Request'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
        child: InkWell(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => BloodConfirmPage())),
          child: Container(
            // height: 500.h,
            child:
            ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index){
                  // final user = users[index];
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0).h,
                    child: Container(
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
                                  SizedBox(height: 25.0.h,),
                                  ElevatedButton(
                                    style: raisedButtonStyle,
                                    onPressed: () {
                                      // showDialog(context: context, builder: (context){
                                      //   return Container(
                                      //     child: AlertDialog(
                                      //       title: Text('Are you sure you wnat to Donate?'),
                                      //       actions: [
                                      //         TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Yes')),
                                      //         TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No'))
                                      //       ],
                                      //     ),
                                      //   );
                                      // });
                                    },
                                    child: Text(
                                      'Completed',
                                      style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                                          fontSize: 16.0.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
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
                  );
                }),
          ),
        ),
      ),
    );
  }
}
