import 'package:blooddonation/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationRequest extends StatelessWidget {
  const DonationRequest({Key? key}) : super(key: key);

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
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(title: 'Donation Request',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(bottom:16.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                            SizedBox(height: 4.0,),
                            Text('John Doe',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                            SizedBox(height: 8.0,),
                            Text('location', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                            SizedBox(height: 4.0,),
                            Text('Patan Hospital'),
                            SizedBox(height: 12.0,),
                            Text('5 Minutes Ago', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E),),),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Image.asset('assets/images/Blood Group.png'),
                          ),
                          SizedBox(height: 15.0,),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              showDialog(context: context, builder: (context){
                                return Container(
                                  child: AlertDialog(
                                    title: Text('Are you sure you wnat to Donate?'),
                                    actions: [
                                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Yes')),
                                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No'))
                                    ],
                                  ),
                                );
                              });
                            },
                            child: Text(
                              'DONATE ',
                              style: GoogleFonts.poppins(color: Color(0xFFFFFFFF),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          // Image.asset('assets/images/Group 65.png')
                        ],
                      )
                    ],
                  ),

                ),
              );
            }),
      ),
    );
  }
}
