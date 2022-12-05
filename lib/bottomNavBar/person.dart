import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher/switcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = false;
    bool theme = false;

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    );
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(
        title: 'Profile',
      ),
      body: Container(
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/Rectangle 24.png')),
            SizedBox(height: 30.0,),
            Text('John Doe', style: GoogleFonts.poppins(fontSize:30, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Color(0xFFE22030),),
                Text('New Baneshwor', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),)
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: person.length,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 18.0),
                  child: Container(
                    height: 65,
                    width: 160,
                    decoration: BoxDecoration(
                        color: person[index].color,
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(person[index].image),
                          Text(person[index].title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 110,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                      height: 110,
                    width: MediaQuery.of(context).size.width*0.27,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(detail[index].image, color: Color(0xFFE22030),),
                          Text(detail[index].number, style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                          Text(detail[index].text, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C)),)
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: Container(

                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white
                ),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SvgPicture.asset('assets/images/carbon_event-schedule.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Available for donation', style: GoogleFonts.poppins(fontSize:14, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C) ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 115.0),
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
            Container(
              height: 200,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
                  child: Container(

                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white
                    ),
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: SvgPicture.asset(extras[index].image),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(extras[index].title, style: GoogleFonts.poppins(fontSize:14, fontWeight: FontWeight.w500, color: Color(0xFF7C7C7C) ),),
                        )

                      ],
                    ),
                  ),
                  
                );
              }),
            )
          ],
        ),
      )

    );
  }
}
