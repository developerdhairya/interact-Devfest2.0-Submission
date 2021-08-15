import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/custom_text_field.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/components/wave_clipper_1.dart';
import 'package:interact/firebase.dart';


DecorationImage lightOneImage = DecorationImage(
  image: AssetImage('assets/light-1.png'),);

//Text Styles
TextStyle defaultHeaderTextStyle = GoogleFonts.gabriela(
    color: Colors.white, fontSize: 50.0);

//Paddings
EdgeInsets headerTextTopPadding = const EdgeInsets.only(top: 118.0);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ScrollController _scrollController = ScrollController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClippedLampContainer(
                screenSize: screenSize,
                text: "Login",
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTetField(
                      obscureText: false,
                      controller: emailController,
                      scrollController: _scrollController,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Email Id",
                      iconData: Icons.email,
                    ),
                    SizedBox(height: 40.0),
                    CustomTetField(
                      obscureText: true,
                      controller: passwordController,
                      scrollController: _scrollController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: "Password",
                      iconData: Icons.vpn_key_sharp,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                    SignButton(
                      linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                      text: "Login",
                      fontSize: 16,
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.pushNamed(context, '/homeScreen');
                        } catch (e) {
                          SnackBar snackBar =
                              SnackBar(content: Text(e.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClippedLampContainer extends StatelessWidget {
  const CustomClippedLampContainer({
    Key? key,
    required this.screenSize,
    this.text,
  }) : super(key: key);

  final Size screenSize;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDA22FF), Color(0xFF9733EE)],
          ),
        ),
        height: screenSize.height / 2.2,
        width: screenSize.width,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              height: 200,
              width: 80,
              child: Container(
                decoration: BoxDecoration(
                  image: lightOneImage,
                ),
              ),
            ),
            Positioned(
              left: 140,
              height: 150,
              width: 80,
              child: Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/light-2.png')),
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
                  image: DecorationImage(image: AssetImage('assets/clock.png')),
                ),
              ),
            ),
            Padding(
              padding: headerTextTopPadding,
              child: Center(
                child: Container(
                  child: text == null
                      ? Text("")
                      : Text(
                          text!,
                          style: defaultHeaderTextStyle,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
