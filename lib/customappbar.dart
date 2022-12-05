

import 'package:blooddonation/HomeScreens/HomePage.dart';
import 'package:blooddonation/HomeScreens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? leading;
  const CustomAppBar({Key? key, this.title='', this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25/2.50),
    child: Stack(
      children: [
        Positioned.fill(child: Center(child: Text(title, style: GoogleFonts.poppins(fontSize:22, fontWeight: FontWeight.w500, color: Color(0xFF272A2F) ),) )
        ),
        Row(
          children: [
           InkWell(
             onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage())),
             child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFB8AFAF),
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: leading ?? Transform.translate(offset: Offset(-14, 0), child: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Icon(Icons.arrow_back_ios),
                      ),)
                  ),
           )



          ],
        )
      ],
    ),
      
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
    double.maxFinite, 80
  );
}
