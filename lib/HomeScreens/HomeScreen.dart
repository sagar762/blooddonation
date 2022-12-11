import 'package:blooddonation/bottomNavBar/donationrequest.dart';
import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current=0;
  late PageController _controller;
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  final List<String> images = [
    'assets/images/bro.jpg',
    'assets/images/rafiki.jpg',
    'assets/images/rafiki.jpg',
    'assets/images/rafiki.jpg',


  ];

  List<Widget> generateImageTiles(){
    return images.map((e) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
    )).toList();
    // return images.map((element) => ClipRRect(
    //   child: Image.asset(element, fit: BoxFit.cover,),
    //   borderRadius: BorderRadius.circular(15.0),
    //
    // )).toList();
  }
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
    int currntTab = 0;

    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          body: SingleChildScrollView(
            // physics: ScrollPhysics(),
            child:
              Expanded(

                child: Column(

                  children: [
                    SizedBox(height: 20.0.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0).w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Welcome Asis', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                          Icon(Icons.notifications_active, size: 32, color: Color(0xFF272A2F),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0.h,),
                    Stack(
                      children: [
                        CarouselSlider(items: generateImageTiles(), options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 2,
                            onPageChanged: (index, reason){
                              setState(() {
                                _current = index;
                              });
                            }
                        ))
                      ],
                    ),
                    SizedBox(height: 15.0.h,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(images.length, (index) => buildDot(index, context)),

                      ),
                    ),
                    SizedBox(height: 25.0.h,),
                    Container(
                      height: 100.h,
                      // width: MediaQuery.of(context).size.width,
                      child: ListView.builder(

                          shrinkWrap: true,
                          itemCount: details.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                              child: InkWell(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => details[index].route)),
                                child: Container(
                                  height: 100.h,
                                  width: MediaQuery.of(context).size.width*0.27,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0).h,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(child: SvgPicture.asset(details[index].image,)),
                                        SizedBox(height: 5.h,),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text(details[index].name, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E)),))
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 20.0.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('Donation Requests', style: GoogleFonts.poppins(fontSize: 17.sp, fontWeight:FontWeight.w500, color: Color(0xFF272A2F)),),
                          SizedBox(height: 10.0.h,),
                          Container(
                            // height: 500.h,
                            child:
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // scrollDirection: Axis.vertical,
                            itemCount: 6,
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
                                          Text('John Doe',style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)), ),
                                          SizedBox(height: 8.0.h,),
                                          Text('location', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF7E7E7E),),),
                                          SizedBox(height: 4.0.h,),
                                          Text('Patan Hospital'),
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
                          ),



                        ],
                      ),
                    ),
                  ],
                ),
              ),


          )

        ),
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: _current == index ? 10.w :10.w,
      margin: EdgeInsets.symmetric(horizontal: 5.0).w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _current == index ? Color(0xFFE22030) : Color(0xFFE0E0E0)
      ),
    );


  }

}




