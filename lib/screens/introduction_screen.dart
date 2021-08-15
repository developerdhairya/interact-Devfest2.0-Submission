import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interact/models/intro_carousel.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';



class IntroductionScreen extends StatelessWidget {

  IntroCarousel pageList=IntroCarousel();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pageList.pages,
        columnMainAxisAlignment: MainAxisAlignment.center,
        showNextButton: false,
        onTapDoneButton: (){
          Navigator.pushNamed(context, '/authenticationScreen');
        },
        onTapSkipButton: (){
          Navigator.pushNamed(context, '/authenticationScreen');
        },
      ),
    );
  }
}
