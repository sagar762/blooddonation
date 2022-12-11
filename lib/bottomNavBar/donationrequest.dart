import 'package:blooddonation/bloc/app_blocs.dart';
import 'package:blooddonation/bloc/app_states.dart';
import 'package:blooddonation/customappbar.dart';
import 'package:blooddonation/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blooddonation/repositories.dart';
import 'package:blooddonation/restapi/postcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../bloc/app_events.dart';

class DonationRequest extends StatelessWidget {
  const DonationRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      side: BorderSide(color: Color(0xFFE22030), width: 2.w),
      // onPrimary: Colors.black87,
      primary: Color(0xFFE22030),
      // minimumSize: const Size.fromHeight(50),
      // minimumSize: Size(100, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.w),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
    // return BlocProvider(
    //   create: (context) => UserBloc(
    //     RepositoryProvider.of<UserRepository>(context),
    //   )..add(LoadUserEvent()),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('The Bloc App'),
    //     ),
    //     body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
    //       if (state is UserLoadingState) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (state is UserLoadedState) {
    //         List<UserModel> userList = state.users;
    //         return ListView.builder(
    //             itemCount: userList.length,
    //             itemBuilder: (_, index) {
    //               return Card(
    //                 color: Colors.blue,
    //                 elevation: 4,
    //                 margin: const EdgeInsets.symmetric(vertical: 10),
    //                 child: ListTile(
    //                   title: Text(userList[index].firstname),
    //                   subtitle: Text(userList[index].lastname),
    //                 ),
    //               );
    //             });
    //       }
    //       return Container();
    //     }),
    //   ),
    // );
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Donation Request',
          ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState){
            List<UserModel> userList = state.users;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child:  ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index){
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
                                  Text('Name', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E)),),
                                  SizedBox(height: 4.0.h,),
                                  Text(userList[index].firstname, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                                  SizedBox(height: 8.0.h,),
                                  Text('location', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                                  SizedBox(height: 4.0.h,),
                                  Text('Patan Hospital'),
                                  SizedBox(height: 8.0.h,),
                                  Text('Email', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                                  SizedBox(height: 4.0.h,),
                                  Text(userList[index].email),
                                  SizedBox(height: 8.0.h,),
                                  Text('Phone number', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                                  SizedBox(height: 4.0.h,),
                                  Text(userList[index].lastname),
                                  SizedBox(height: 12.0.h,),
                                  Text('5 Minutes Ago', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E),),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55),
                                    child: SvgPicture.asset('assets/images/Blood Group.svg'),
                                  ),
                                  SizedBox(height: 15.0.h,),
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
                                          fontSize: 18.0.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // Image.asset('assets/images/Group 65.png')
                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                    );
                  }),

            );
          }
          return Container();
        },)


      )
    );
  }
}
