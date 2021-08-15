import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:uuid/uuid.dart';

class CreateMeetScreen extends StatefulWidget {
  const CreateMeetScreen({Key? key}) : super(key: key);

  @override
  _CreateMeetScreenState createState() => _CreateMeetScreenState();
}

class _CreateMeetScreenState extends State<CreateMeetScreen> {

  String code="                ";

  void generateCode(){
    setState(() {
      code=Uuid().v1().substring(0,6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Text("Create your meeting code and share it with your friends!",style: GoogleFonts.poppins(fontSize: 20.0,fontWeight:FontWeight.w700 ),textAlign: TextAlign.center,),
              SizedBox(height: 50.0,),
              RichText(text: TextSpan(
                style: GoogleFonts.poppins(fontSize: 35.0,fontWeight:FontWeight.w700,color: Colors.black),
                children: [
                  TextSpan(text: "Code :  "),
                  TextSpan(text: "$code",style: GoogleFonts.poppins(fontSize: 35.0,fontWeight:FontWeight.w500,color: Colors.purple)),
                ]
              ),
              ),
              SizedBox(height: 80.0),
              SignButton(
                  linearGradient: [
                    Color.fromRGBO(143, 158, 241, 1),
                    Color.fromRGBO(143, 148, 241, .6),
                  ],
                  text: "Generate Code",
                  fontSize: 16,
                  onPressed:(){
                    generateCode();
                  },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
