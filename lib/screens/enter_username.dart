import 'package:flutter/material.dart';
import 'package:interact/components/custom_text_field.dart';
import 'package:interact/components/sign_buttons.dart';
import 'package:interact/sawo.dart';

import '../firebase.dart';
import 'login.dart';

class EnterUsernameScreen extends StatefulWidget {
  const EnterUsernameScreen({Key? key}) : super(key: key);

  @override
  _EnterUsernameScreenState createState() => _EnterUsernameScreenState();
}

class _EnterUsernameScreenState extends State<EnterUsernameScreen> {

  TextEditingController usernameController=TextEditingController();
  ScrollController scrollController=ScrollController();

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
                text: "Username",
              ),
              SizedBox(
                height: 120.0,
              ),
            CustomTetField(
              obscureText: false,
              controller: usernameController,
              textInputType: TextInputType.text,
              hintText: "Username",
              iconData: Icons.contact_page_outlined, scrollController: scrollController,
            ),
              SizedBox(
                height: 100.0,
              ),
              SignButton(
                  linearGradient: [Color(0xFFDA22FF), Color(0xFF9733EE)],
                  text: "Next",
                  fontSize: 12.0,
                  onPressed: () {
                    try{
                      userCollection.doc(sawoUserId).set({
                        'username': usernameController.text,
                      });
                    }catch(e){
                      SnackBar snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    Navigator.pushNamed(context, '/addImageScreen');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
