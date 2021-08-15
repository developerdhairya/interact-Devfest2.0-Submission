import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTetField extends StatelessWidget {
  const CustomTetField(
      {Key? key,
      required this.scrollController,
      required this.textInputType,
      required this.hintText,
      required this.iconData, required this.controller,required this.obscureText})
      : super(key: key);

  final bool obscureText;
  final ScrollController scrollController;
  final TextInputType textInputType;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    void scrollToBottom() {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }

    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.6,
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          onTap: () {
            scrollToBottom();
          },
          style: GoogleFonts.poppins(color: Colors.black),
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(color: Colors.black),
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
