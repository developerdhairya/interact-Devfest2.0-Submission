import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interact/sawo.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import 'login.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  _AddImageScreenState createState() => _AddImageScreenState();
}



class _AddImageScreenState extends State<AddImageScreen> {
  final picker = ImagePicker();
  late File _imageFile;
  String uid="";
  bool showHud=false;


  Future pickImage() async {
    setState(() {
      showHud=true;
    });
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    uploadFile(pickedFile!.path);
  }
  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      if(!sawoEnabled){
        uid=FirebaseAuth.instance.currentUser!.uid;
      }else{
        uid=sawoUserId;
      }
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$uid.png')
          .putFile(file).then((x){
            setState(() {
              showHud=false;
            });
            uid!=""?Navigator.pushNamed(context,'/homeScreen'):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Network Error.")));

      });
    } on FirebaseException catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(child: Container(
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
                backgroundImage:
                AssetImage("assets/profile_img_sample.png"),
                // backgroundImage: ,
                radius: 60.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 50.0,),
              InkWell(
                onTap: ()async{await pickImage();},
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
      ),inAsyncCall: showHud,),
    );
  }
}
