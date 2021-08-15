import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';


//Background Colors
Color pageOneColor = Color(0xFF03A9F4);
Color pageTwoColor = Colors.red.shade100;
Color pageThreeColor = Color(0xFF84C64A);
Color pageFourColor = Colors.pinkAccent;

//Titles
Text pageOneTitle = Text("Welcome");
Text pageTwoTitle = Text("Chat with Me");
Text pageThreeTitle = Text("Lets Meet Face to Face!");
Text pageFourTitle = Text("Security !! No worries");

//BodyText
Text pageOneBody = Text(
  "Welcome to interact!! Your only hangout destination..",
  textAlign: TextAlign.center,
);

//SVG
SvgPicture pageOneSvg=SvgPicture.asset(
  "assets/intro_page_1.svg",
  height: 200.0,
  width: 200.0,
  alignment: Alignment.center,
);
SvgPicture pageTwoSvg=SvgPicture.asset(
  "assets/intro_page_2.svg",
  height: 300.0,
  width: 300.0,
  alignment: Alignment.center,
);
SvgPicture pageThreeSvg=SvgPicture.asset(
  "assets/intro_page_3.svg",
  height: 300.0,
  width: 300.0,
  alignment: Alignment.center,
);
SvgPicture pageFourSvg=SvgPicture.asset(
  "assets/intro_page_4.svg",
  height: 280.0,
  width: 280.0,
  alignment: Alignment.center,
);

//Text Styles
TextStyle bodyTextStyle=GoogleFonts.zeyada(fontSize: 30);



class IntroCarousel {
  final pages = [
    PageViewModel(
      title: pageOneTitle,
      pageColor: pageOneColor,
      mainImage: pageOneSvg,
      titleTextStyle: GoogleFonts.zeyada(fontSize: 80),
      bodyTextStyle: bodyTextStyle,
      body: pageOneBody,
    ),
    PageViewModel(
      title: pageTwoTitle,
      pageColor: pageTwoColor,
      mainImage: pageTwoSvg,
      titleTextStyle: GoogleFonts.zeyada(fontSize: 50),
    ),
    PageViewModel(
      title: pageThreeTitle,
      pageColor: pageThreeColor,
      mainImage: pageThreeSvg,
      titleTextStyle: GoogleFonts.zeyada(fontSize: 50),
    ),
    PageViewModel(
      title: pageFourTitle,
      pageColor: pageFourColor,
      mainImage: pageFourSvg,
      titleTextStyle: GoogleFonts.zeyada(fontSize: 80),
    ),
  ];
}
