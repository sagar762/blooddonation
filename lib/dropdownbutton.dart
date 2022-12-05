
import 'package:blooddonation/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: values.length,
          itemBuilder: (BuildContext context, int index){
        return DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: values[index].title,
            labelStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF272A2F)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF272A2F)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF272A2F)),
            ),
          ),


          // hint: Text('Blood Type', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.02, color: Color(0xFF272A2F)),),
          // dropdownColor: Color(0xFFB8B8B8),
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5E5E5E)
          ),

          value: values[index].valueChoose, onChanged: (newvalue){
          setState(() {

            values[index].valueChoose = newvalue as String?;
          });

        },
          items: values[index].names.map((valueItem){
            return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem));
          }).toList(),
        );
      }),
    );

  }
}
