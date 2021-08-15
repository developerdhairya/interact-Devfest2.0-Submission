import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/oval_bottom_clipper.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/firebase.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String username = "";

  void getUserDetails() async {
    DocumentSnapshot<Object?> userDataSnapshot = await userDocument.get();
    Map<String, dynamic> userData =
        userDataSnapshot.data() as Map<String, dynamic>;
    username = userData['username'];
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getUserDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: screenSize.height / 2.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height / 2.8,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/profile_img_sample.png"),
                    radius: 60.0,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  username == ""
                      ? CircularProgressIndicator()
                      : Text(
                          username,
                          style: GoogleFonts.montserrat().copyWith(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                  SizedBox(
                    height: 80.0,
                  ),
                  SignButton(
                      linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                      text: "Update Profile",
                      fontSize: 12.0,
                      onPressed: () {}),
                  SizedBox(
                    height: 40.0,
                  ),
                  SignButton(
                      linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                      text: "Sign Out",
                      fontSize: 12.0,
                      onPressed: () async {
                        await signOut();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
