import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    Key? key,
    required this.linearGradient,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  final linearGradient;
  final String text;
  final Function onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: linearGradient,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(color:Colors.white)
          ),
        ),
      ),
    );
  }
}