import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Decoration Images
DecorationImage loginPageBackground = DecorationImage(
  image: AssetImage('assets/login_page_background.png'),
  fit: BoxFit.fill,
);
DecorationImage lightOneImage = DecorationImage(
  image: AssetImage('assets/light-1.png'),);

//Text Styles
TextStyle defaultHeaderTextStyle = GoogleFonts.gabriela(
    color: Colors.white, fontSize: 50.0);

//Paddings
EdgeInsets headerTextTopPadding = const EdgeInsets.only(top: 118.0);


class LampLayout extends StatefulWidget {
  const LampLayout({Key? key, this.headerText, this.textStyle, required this.body, required this.scrollController})
      : super(key: key);
  final String ?headerText;
  final TextStyle ? textStyle;
  final Widget body;
  final ScrollController scrollController;

  @override
  _LampLayoutState createState() => _LampLayoutState();
}

class _LampLayoutState extends State<LampLayout> {

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
            child: ListView(
              controller: widget.scrollController,
              shrinkWrap: true,
              children: [
                Container(
                  height: deviceSize.height/2.1,
                  decoration: BoxDecoration(
                    image: loginPageBackground,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        height: 200,
                        width: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            image:lightOneImage,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        height: 150,
                        width: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-2.png')),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 40,
                        height: 150,
                        width: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/clock.png')),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: headerTextTopPadding,
                          child: Center(
                            child: Container(
                              child: Text(
                                widget.headerText ?? "",
                                style: widget.textStyle ?? defaultHeaderTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.body,
              ],
            ),
          ),
    );
  }
}
