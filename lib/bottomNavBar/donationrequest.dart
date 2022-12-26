
import 'package:blooddonation/customappbar.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import '../model/user_api.dart';
import '../model/Usermodel.dart';

String? stringResponse;
Map? mapResponse;
class DonationRequest extends StatefulWidget {
  const DonationRequest({Key? key}) : super(key: key);

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}


class _DonationRequestState extends State<DonationRequest> {

  // List<ProductModeL> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();


  }

  Future fetchUsers() async {
    http.Response response;
    response = await http.get(Uri.parse('http://192.168.1.159:8000/api/auth/login'));
    if(response.statusCode==200){
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(mapResponse);
      });
    }
  }
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
      appBar: CustomAppBar(title: 'Donation Request',),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              // final user = users[index];
              return Padding(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0)
                                .w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name', style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7E7E7E)),),
                                SizedBox(height: 4.0.h,),
                                mapResponse ==null? Container(): Text(mapResponse.toString(),
                                  style: GoogleFonts.poppins(fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF272A2F)),),
                                SizedBox(height: 8.0.h,),
                                Text('location', style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF7E7E7E),),),
                                SizedBox(height: 4.0.h,),
                                const Text('Patan Hospital'),
                                SizedBox(height: 8.0.h,),
                                Text('Email', style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF7E7E7E),),),
                                SizedBox(height: 4.0.h,),
                                Text("user.sellerEmail", overflow: TextOverflow.ellipsis, maxLines: 2, ),
                                SizedBox(height: 8.0.h,),
                                Text('Phone number', style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF7E7E7E),),),
                                SizedBox(height: 4.0.h,),
                                Text('userList[index].lastname'),
                                SizedBox(height: 12.0.h,),
                                Text('5 Minutes Ago', style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF7E7E7E),),),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                            'assets/images/Blood Group.svg')
                      ],
                    ),

                  )


              );
            }
        ),
      ),
    );
  }
}
