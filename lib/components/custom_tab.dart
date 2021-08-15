import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 170.0,
      child: Card(
        child: Center(
          child: Text(text,style: GoogleFonts.gabriela(color: Colors.black87,fontWeight: FontWeight.w900,fontSize: 18.0),),
        ),
      ),
    );
  }
}
