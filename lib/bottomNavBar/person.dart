import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher/switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = false;
    bool theme = false;

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2.w),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.w),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
          child: Container(
            child: Column(
              children: [
                Center(child: Image.asset('assets/images/Rectangle 24.png')),
                SizedBox(height: 30.0.h,),
                Text('John Doe', style: GoogleFonts.poppins(fontSize:30.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Color(0xFFE22030),),
                    Text('New Baneshwor', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),)
                  ],
                ),
                SizedBox(height: 20.0.h,),
                Container(
                  height: 55.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: person.length,
                      itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                      child: Container(
                        height: 55.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            color: person[index].color,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(person[index].image),
                              Text(person[index].title, style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 105.h,

                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                      itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12).w,
                      child: Container(
                          height: 105.h,
                        width: MediaQuery.of(context).size.width*0.26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0).h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(detail[index].image, color: Color(0xFFE22030),),
                              Text(detail[index].number, style: GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                              Text(detail[index].text, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20.0.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                  child: Container(

                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white
                    ),
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                          child: SvgPicture.asset('assets/images/carbon_event-schedule.svg'),
                        ),
                        Text('Available for donation', style: GoogleFonts.poppins(fontSize:14.sp, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C) ),),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 85.0).w,
                          child: Switcher(
                            value: false,
                            colorOff: Colors.red.withOpacity(0.3),
                            colorOn: Color(0xFFE22030),

                            onChanged: (bool state) {
                              //
                            },
                          ),
                        ),



                      ],
                    ),
                  ),

                ),
                SizedBox(height: 8.0.h,),
                Container(

                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0.h).w,
                      child: Container(

                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white
                        ),
                        child: Row(

                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                              child: SvgPicture.asset(extras[index].image),
                            ),
                            Text(extras[index].title, style: GoogleFonts.poppins(fontSize:14.sp, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C) ),)

                          ],
                        ),
                      ),

                    );
                  }),
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}
