import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interact/components/custom_text_field.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/firebase.dart';
import 'package:interact/screens/login.dart';
import 'package:interact/screens/otp_validation_screen.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ScrollController _scrollController = ScrollController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple.shade300,
      statusBarBrightness: Brightness.dark,
    ));
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomClippedLampContainer(
                screenSize: screenSize,
                text: "Register",
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTetField(
                obscureText: false,
                controller: usernameController,
                scrollController: _scrollController,
                textInputType: TextInputType.text,
                hintText: "Username",
                iconData: Icons.contact_page_outlined,
              ),
              SizedBox(height: 40.0),
              CustomTetField(
                obscureText: false,
                controller: emailController,
                scrollController: _scrollController,
                textInputType: TextInputType.emailAddress,
                hintText: "E-mail Id",
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
                  text: "Sign Up",
                  fontSize: 16,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpValidationScreen(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                        ),
                      ),
                    );
                    // try {
                    //   await registerUser();
                    //   Navigator.pushNamed(context, '/homeScreen');
                    // }on FirebaseAuthException catch (e) {
                    //   print(e);
                    //   SnackBar snackBar = SnackBar(
                    //     content: Text(e.toString()),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
