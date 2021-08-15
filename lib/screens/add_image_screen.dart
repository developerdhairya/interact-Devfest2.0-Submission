import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interact/components/hexagonal_clipper.dart';
import 'package:interact/components/wave_clipper_1.dart';
import 'package:interact/components/wave_clipper_2.dart';
import 'package:interact/firebase.dart';

import 'login.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  _AddImageScreenState createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  Future<void> uploadImage(File upload)async{

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomClippedLampContainer(
                screenSize: screenSize,
                text: "👨‍💻",
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 55.0,
              ),
              CircleAvatar(
                // backgroundImage:
                // AssetImage("assets/profile_img_sample.png"),
                backgroundImage: ,
                radius: 60.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 50.0,),
              InkWell(
                onTap: (){},
                child: Container(

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple,width: 2.0,)
                  ),
                  // color: Colors.red,
                  width: screenSize.width/1.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Upload Image",textAlign: TextAlign.center,style: GoogleFonts.roboto().copyWith(color: Colors.deepPurple,fontSize: 30.0),),
                      Icon(Icons.upload ,color: Colors.deepPurple,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
