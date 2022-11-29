import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 34.0, right: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Welcome Asis', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),),
                  Icon(Icons.notifications_active, size: 32, color: Color(0xFF272A2F),)
                ],
              ),
            ),
            SizedBox(height: 15.0,),
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
            SizedBox(height: 15.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate(images.length, (index) => buildDot(index, context)),

              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              height: 140,
              // width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 135,
                        width: MediaQuery.of(context).size.width*0.27,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only( top: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Image.asset(details[index].image,)),
                              SizedBox(height: 10,),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(details[index].name, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7E7E7E)),))
                            ],
                          ),
                        ),

                      ),
                    );
                  }),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Donation Requests', style: GoogleFonts.poppins(fontSize: 17, fontWeight:FontWeight.w500, color: Color(0xFF272A2F)),),
                  SizedBox(height: 10.0,),
                  Container(
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
                            Image.asset('assets/images/Blood Group.png'),
                            SizedBox(height: 15.0,),
                            ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                // if(_formkey.currentState!.validate()) {
                                //   return;
                                // }
                                // else
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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

                  )
                ],
              ),
            )

            
          ],
        ),
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _current == index ? 10 :10,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _current == index ? Color(0xFFE22030) : Color(0xFFE0E0E0)
      ),
    );


  }

}




