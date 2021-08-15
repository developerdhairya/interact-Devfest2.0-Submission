import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/oval_bottom_clipper.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:interact/sawo.dart';
import 'package:interact/screens/authentication_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String username = "";
  late String imgURL = "";
  late String uid;

  Future<String> getUserImage() async {
    String x=FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      uid=x;
    });
      String c = await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$uid.png')
          .getDownloadURL();
      setState(() {
        imgURL=c;
      });


    return imgURL;
  }

  void getUserDetails() async {
    late DocumentSnapshot<Object?> userDataSnapshot;
    if(!sawoEnabled){
    userDataSnapshot = await userDocument.get();
    }
    else{
      userDataSnapshot = await sawoUserDocument.get();
    }
    Map<String, dynamic> userData =
        userDataSnapshot.data() as Map<String, dynamic>;
    setState(() {
      username = userData['username'];
    });
  }

  Future<void> signOut() async {
   if(!sawoEnabled){
     await FirebaseAuth.instance.signOut();
   }
   Navigator.pushNamed(context, '/introductionScreen');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getUserDetails();
    });
    setState(() {
      getUserImage();
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
                    // backgroundImage:
                    //     imgURL=="" ? AssetImage("assets/profile_img_sample.png"):NetworkImage(imgURL),
                    // imgURL==""?NetworkImage(imgURL):
                    backgroundImage: imgURL == ""
                        ? NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/interact-b6fc0.appspot.com/o/uploads%2Fprofile_img_sample.png?alt=media&token=51fc3c34-33a3-48a5-a1e3-f90e3242c4d1')
                        : NetworkImage(imgURL.toString()),
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
                      onPressed: () {
                        Navigator.of(context).pushNamed("/addImageScreen");
                      }),
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
