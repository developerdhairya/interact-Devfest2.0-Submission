import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/custom_text_field.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/screen_layouts/lamp_layout.dart';
import 'package:interact/screens/login.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple.shade300,
      statusBarBrightness: Brightness.dark,
    ));
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClippedLampContainer(screenSize: screenSize),
              SizedBox(
                height: 100.0,
              ),
              SignButton(
                  linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                  text: "Login",
                  fontSize: 16,
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginScreen');
                  }),
              SizedBox(
                height: 50.0,
              ),
              SignButton(
                  linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE),],
                  text: "Sign Up",
                  fontSize: 16,
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerScreen');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
