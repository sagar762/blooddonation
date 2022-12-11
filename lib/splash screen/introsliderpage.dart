
import 'package:blooddonation/model/onboarding.dart';
import 'package:blooddonation/splash%20screen/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int ?initScreen;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // initScreen = (await preferences.getInt('initScreen'));
  // await preferences.setInt('initScreen', 1);

}

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [

            Container(
              height: MediaQuery.of(context).size.height*0.72,
              child: PageView.builder(
                controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder:(_, i){
                    return Padding(

                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset(contents[i].image, height: 300,),
                          SizedBox(height: 40.0,),
                          Text(contents[i].title, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w400)),
                          SizedBox(height: 40.0,),
                          Text(contents[i].description, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 20.0, color: Color(0xFF7E7E7E), fontWeight: FontWeight.w500 ) ),
                          // SizedBox(height: 40.0,),


                        ],
                      ),
                    );
                  } ),
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              List.generate(contents.length, (index) => buildDot(index, context)),

            ),
          ),
          SizedBox(height: 120.0,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingFinalScreen()));},
                    child:  Text('Skip',style: GoogleFonts.poppins(fontSize: 20.0, color: Color(0xFF3A4351), fontWeight: FontWeight.w500 )),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      if(currentIndex==contents.length - 1){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingFinalScreen()));

                      }
                      _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                    },
                    child:  Text('Next', style: GoogleFonts.poppins(fontSize: 20.0, color: Color(0xFFE22030), fontWeight: FontWeight.w400 ),),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
                height: 10,
                width: currentIndex == index ? 40 :10,
                margin: EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFE22030)
                ),
              );
  }
  TextStyle TextMainStyle() {
    return GoogleFonts.poppins(fontSize: 20.0, color: Color(0xFF7E7E7E), fontWeight: FontWeight.w400 );
  }
}
